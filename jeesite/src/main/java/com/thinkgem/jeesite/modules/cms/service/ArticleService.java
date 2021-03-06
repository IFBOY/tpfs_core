/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cms.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.solr.client.solrj.SolrServerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.ContentBean;
import com.thinkgem.jeesite.common.utils.SolrApi;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.cms.dao.ArticleDao;
import com.thinkgem.jeesite.modules.cms.dao.ArticleDataDao;
import com.thinkgem.jeesite.modules.cms.dao.CategoryDao;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.ArticleData;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 文章Service
 * 
 * @author ThinkGem
 * @version 2013-05-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleService extends CrudService<ArticleDao, Article> {

	@Autowired
	private ArticleDataDao articleDataDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private SolrApi solrApi;

	@Transactional(readOnly = false)
	public Page<Article> findPage(Page<Article> page, Article article, boolean isDataScopeFilter) {
		// 更新过期的权重，间隔为“6”个小时
		/*
		 * Date updateExpiredWeightDate =
		 * (Date)CacheUtils.get("updateExpiredWeightDateByArticle"); if
		 * (updateExpiredWeightDate == null || (updateExpiredWeightDate != null
		 * && updateExpiredWeightDate.getTime() < new Date().getTime())){
		 * dao.updateExpiredWeight(article);
		 * CacheUtils.put("updateExpiredWeightDateByArticle",
		 * DateUtils.addHours(new Date(), 6)); }
		 */
		// DetachedCriteria dc = dao.createDetachedCriteria();
		// dc.createAlias("category", "category");
		// dc.createAlias("category.site", "category.site");
		if (article.getCategory() != null && StringUtils.isNotBlank(article.getCategory().getId())
				&& !Category.isRoot(article.getCategory().getId())) {
			Category category = categoryDao.get(article.getCategory().getId());
			if (category == null) {
				category = new Category();
			}
			category.setParentIds(category.getId());
			category.setSite(category.getSite());
			article.setCategory(category);
		} else {
			article.setCategory(new Category());
		}
		// if (StringUtils.isBlank(page.getOrderBy())){
		// page.setOrderBy("a.weight,a.update_date desc");
		// }
		// return dao.find(page, dc);
		// article.getSqlMap().put("dsf",
		// dataScopeFilter(article.getCurrentUser(), "o", "u"));
		return super.findPage(page, article);

	}

	@Transactional(readOnly = false)
	public void save(Article article) {
		if (article.getArticleData().getContent() != null) {
			article.getArticleData().setContent(StringEscapeUtils.unescapeHtml4(article.getArticleData().getContent()));
		}
		// 如果没有审核权限，则将当前内容改为待审核状态
		if (!UserUtils.getSubject().isPermitted("cms:article:audit")) {
			article.setDelFlag(Article.DEL_FLAG_AUDIT);
		}
		// 如果栏目不需要审核，则将该内容设为发布状态
		if (article.getCategory() != null && StringUtils.isNotBlank(article.getCategory().getId())) {
			Category category = categoryDao.get(article.getCategory().getId());
			if (!Global.YES.equals(category.getIsAudit())) {
				article.setDelFlag(Article.DEL_FLAG_NORMAL);
			}
		}
		article.setUpdateBy(UserUtils.getUser());
		article.setUpdateDate(new Date());
		if (StringUtils.isNotBlank(article.getViewConfig())) {
			article.setViewConfig(StringEscapeUtils.unescapeHtml4(article.getViewConfig()));
		}

		ArticleData articleData = new ArticleData();
		if (StringUtils.isBlank(article.getId())) {
			article.preInsert();
			articleData = article.getArticleData();
			articleData.setId(article.getId());
			dao.insert(article);
			articleDataDao.insert(articleData);

		} else {
			article.preUpdate();
			articleData = article.getArticleData();
			articleData.setId(article.getId());
			dao.update(article);
			articleDataDao.update(article.getArticleData());
		}
		ContentBean ctx = new ContentBean();
		ctx.setId(article.getId());
		ctx.setTitle(article.getTitle());
		ctx.setContent(article.getArticleData().getContent());
		ctx.setCreate_date(article.getCreateDate() == null ? new Date() : article.getCreateDate());
		ctx.setDescription(article.getDescription());
		ctx.setKeywords(article.getKeywords());
		try {
			solrApi.getInstance();
			solrApi.addDoc(ctx);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
	}

	@Transactional(readOnly = false)
	public void delete(Article article, Boolean isRe) {
		// dao.updateDelFlag(id,
		// isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		// 使用下面方法，以便更新索引。
		// Article article = dao.get(id);
		// article.setDelFlag(isRe!=null&&isRe?Article.DEL_FLAG_NORMAL:Article.DEL_FLAG_DELETE);
		// dao.insert(article);
		super.delete(article);
	}

	/**
	 * 通过编号获取内容标题
	 * 
	 * @return new Object[]{栏目Id,文章Id,文章标题}
	 */
	public List<Object[]> findByIds(String ids) {
		if (ids == null) {
			return new ArrayList<Object[]>();
		}
		List<Object[]> list = Lists.newArrayList();
		String[] idss = StringUtils.split(ids, ",");
		Article e = null;
		for (int i = 0; (idss.length - i) > 0; i++) {
			e = dao.get(idss[i]);
			list.add(new Object[] { e.getCategory().getId(), e.getId(), StringUtils.abbr(e.getTitle(), 50) });
		}
		return list;
	}

	/**
	 * 根据分类和排序获取排序权重
	 */
	@Transactional(readOnly = false)
	public Double findWeight(Article article) {
		Integer sort = article.getSort();
		Double resultWeight;
		Double preWeight = 0.0;
		Double nextWeight = 0.0;
		int firstResult = sort == 1 ? 0 : sort - 2;
		if (sort != null & sort > 0) {
			if (sort == 1) {
				preWeight = 0.0;
			}
		}
		Page<Article> page = new Page<Article>();
		page.setPageSize(2);
		page.setFirstResult(firstResult);
		article.setPage(page);
		List<Article> articleList = dao.findBetweenList(article);
		if (sort - article.getPage().getCount() > 1) {
			resultWeight = Double.valueOf(article.getPage().getCount() + 1);
		} else if (articleList == null || articleList.size() == 0) {
			resultWeight = 1.0;
		} else if (sort == 1) {
			nextWeight = articleList.get(0).getWeight();
			resultWeight = nextWeight / 2;
		} else {// 序号大于1
			if (article.getPage().getCount() >= sort) {// 插入到已有的序号
				preWeight = articleList.get(0).getWeight();
				nextWeight = articleList.get(1).getWeight();
				resultWeight = (preWeight + nextWeight) / 2;
			} else {// 正常放到最后
				if (StringUtils.isNotBlank(article.getId())) { // 修改
					preWeight = articleList.get(0).getWeight();
					nextWeight = Double.valueOf(sort);
					resultWeight = (preWeight + nextWeight) / 2;
				} else {// 添加
					Article maxWeightArt = new Article();
					maxWeightArt.setCategory(article.getCategory());
					Double maxWeight = dao.findMaxWeight(maxWeightArt);
					if (maxWeight >= sort) {
						preWeight = articleList.get(0).getWeight();
						nextWeight = Double.valueOf(Math.floor(preWeight + 1));
						resultWeight = (preWeight + nextWeight) / 2;
					} else {
						resultWeight = Double.valueOf(sort);
					}
				}
			}
		}
		return resultWeight;
	}

	/**
	 * 根据Weight和分类ID获取序号
	 * 
	 * @param article
	 * @return
	 */
	@Transactional(readOnly = false)
	public List<Article> findBetweenList(Article article) {
		Integer sort = article.getSort();
		int firstResult = sort == 1 ? 0 : sort - 2;
		Page<Article> page = new Page<Article>();
		page.setPageSize(3);
		page.setFirstResult(firstResult);
		article.setPage(page);
		List<Article> articleList = dao.findBetweenList(article);
		return articleList;
	}

	/**
	 * 根据Weight和分类ID获取序号
	 * 
	 * @param article
	 * @return
	 */
	@Transactional(readOnly = false)
	public Integer findSort(Article article) {
		return dao.findSort(article);
	}

	/**
	 * 获取序号
	 */
	@Transactional(readOnly = false)
	public void updateHitsAddOne(String id) {
		dao.updateHitsAddOne(id);
	}

	/**
	 * 更新索引
	 */
	public void createIndex() {
		// dao.createIndex();
	}

	/**
	 * 全文检索
	 */
	// FIXME 暂不提供检索功能
	public Page<Article> search(Page<Article> page, String q, String categoryId, String beginDate, String endDate) {

		// 设置查询条件
		// BooleanQuery query = dao.getFullTextQuery(q,
		// "title","keywords","description","articleData.content");
		//
		// // 设置过滤条件
		// List<BooleanClause> bcList = Lists.newArrayList();
		//
		// bcList.add(new BooleanClause(new TermQuery(new
		// Term(Article.FIELD_DEL_FLAG, Article.DEL_FLAG_NORMAL)), Occur.MUST));
		// if (StringUtils.isNotBlank(categoryId)){
		// bcList.add(new BooleanClause(new TermQuery(new Term("category.ids",
		// categoryId)), Occur.MUST));
		// }
		//
		// if (StringUtils.isNotBlank(beginDate) &&
		// StringUtils.isNotBlank(endDate)) {
		// bcList.add(new BooleanClause(new TermRangeQuery("updateDate",
		// beginDate.replaceAll("-", ""),
		// endDate.replaceAll("-", ""), true, true), Occur.MUST));
		// }

		// BooleanQuery queryFilter =
		// dao.getFullTextQuery((BooleanClause[])bcList.toArray(new
		// BooleanClause[bcList.size()]));

		// System.out.println(queryFilter);

		// 设置排序（默认相识度排序）
		// FIXME 暂时不提供lucene检索
		// Sort sort = null;//new Sort(new SortField("updateDate",
		// SortField.DOC, true));
		// 全文检索
		// dao.search(page, query, queryFilter, sort);
		// 关键字高亮
		// dao.keywordsHighlight(query, page.getList(), 30, "title");
		// dao.keywordsHighlight(query, page.getList(), 130,
		// "description","articleData.content");

		return page;
	}

	@SuppressWarnings("unchecked")
	public Page<ContentBean> queryByParam(Page<ContentBean> page, ContentBean con) throws SolrServerException,
			IOException {
		solrApi.getInstance();
		Map<String, Object> map = solrApi.queryByParam(con.getQ(), page.getFirstResult(), page.getPageSize());
		con.setPage(page);
		page.setCount((Long) map.get("rows"));
		page.setList((List<ContentBean>) map.get("data"));
		// page = new
		// Page<ContentBean>(page.getPageNo(),page.getPageSize(),(Long)map.get("rows"),(List<ContentBean>)map.get("data"));
		return page;
	}

	/**
	 * 初始化分词服务器
	 * 
	 * @param page
	 *            Page<Article>
	 * @param article
	 *            Article
	 */
	public void initSolrWords() {
		List<Article> result = super.dao.findAll();
		for (Article a : result) {
			if(a.getArticleData()!=null){
			ContentBean ctx = new ContentBean();
			ctx.setId(a.getId());
			ctx.setTitle(a.getTitle());
			ctx.setContent(a.getArticleData().getContent());
			ctx.setCreate_date(a.getCreateDate());
			ctx.setDescription(a.getDescription());
			ctx.setKeywords(a.getKeywords());
			try {
				solrApi.getInstance();
				solrApi.addDoc(ctx);
			} catch (IOException e) {
				e.printStackTrace();
			} catch (SolrServerException e) {
				e.printStackTrace();
			}
		}}
	}
}
