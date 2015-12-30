package com.thinkgem.jeesite.common.utils;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.solr.client.solrj.SolrClient;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.response.FacetField;
import org.apache.solr.client.solrj.response.FacetField.Count;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.params.ModifiableSolrParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.thinkgem.jeesite.modules.cms.dao.ArticleDao;
import com.thinkgem.jeesite.modules.cms.entity.Article;

/**
 * 分词工具类
 * 
 * @author chenlijun08@163.com
 * 
 * @version 1.0
 * 
 * @date 2015年12月19日
 */
@Component
public class SolrApi {

	@Autowired
	private ArticleDao articleDao;
	@Value("${solr_server_url}")
	private String url;
	private static SolrClient client;

	public void getInstance() {
		if (client == null) {
			client = new HttpSolrClient(url);
		}
	}

	public void addDoc(ContentBean ctx) throws IOException, SolrServerException {
		client.addBean(ctx);
		client.commit();
	}

	public void deleteDoc(String... ids) throws SolrServerException, IOException {
		for (String id : ids) {
			client.deleteById(id);
		}
		client.commit(true, true);
	}

	public SolrDocument getDocById(String id) throws SolrServerException, IOException {
		return client.getById(id);
	}

	public List<ContentBean> queryAll(int startIndex, int pageSize) throws SolrServerException, IOException {
		List<ContentBean> result = new ArrayList<ContentBean>();
		ModifiableSolrParams params = new ModifiableSolrParams();
		// 查询关键词，*:*代表所有属性、所有值，即所有index
		params.set("q", "*:*");
		params.set("start", startIndex);
		// 分页，start=0就是从0开始，，rows=5当前返回5条记录，第二页就是变化start这个值为5就可以了。
		params.set("rows", pageSize);
		// 排序，，如果按照create_date 排序，，那么将create_date asc
		params.set("sort", "create_date desc");
		// 返回信息 * 为全部 这里是全部加上title，如果不加下面就不能使用title
		params.set("fl", "*,title");
		SolrDocumentList list = client.query(params).getResults();
		if (list != null && list.size() > 0) {
			for (SolrDocument d : list) {
				ContentBean bean = new ContentBean();
				bean.setContent(d.getFieldValue("content") == null ? "" : d.getFieldValue("content").toString());
				bean.setDescription(d.getFieldValue("description") == null ? "" : d.getFieldValue("description")
						.toString());
				bean.setId(d.getFieldValue("id") == null ? "" : d.getFieldValue("id").toString());
				bean.setKeywords(d.getFieldValue("keywords") == null ? "" : d.getFieldValue("keywords").toString());
				bean.setTitle(d.getFieldValue("title") == null ? "" : d.getFieldValue("title").toString());
				bean.setTitle(d.getFieldValue("create_date") == null ? "" : d.getFieldValue("create_date").toString());
				result.add(bean);
			}
		}
		return result;

	}

	public Map<String, Object> queryByParam(String condition, int startIndex, int PageSize) throws SolrServerException,
			IOException {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("rows", 0L);
		SolrQuery params = new SolrQuery("title:" + condition + " OR " + "description:" + condition + " OR "
				+ "keywords:" + condition + " OR " + "content:" + condition);
		params.addSort("title", ORDER.asc);
		// 分页：start开始页，rows每页显示记录条数
		params.setStart(startIndex);
		params.setRows(PageSize);
		// 设置高亮
		params.setHighlight(true); // 开启高亮组件
		params.setHighlightFragsize(10);
		params.setHighlightRequireFieldMatch(true);
		params.addHighlightField("title");// 高亮字段
		params.addHighlightField("keywords");// 高亮字段
		params.addHighlightField("description");// 高亮字段
		params.addHighlightField("content");// 高亮字段
		params.setHighlightSimplePre("<font color='red'>");// 标记，高亮关键字前缀
		params.setHighlightSimplePost("</font>");// 后缀
		QueryResponse response = client.query(params);
		SolrDocumentList list = response.getResults();
		Map<String, Map<String, List<String>>> lightMap = response.getHighlighting();
		if (list != null && list.size() > 0) {
			List<ContentBean> datalist = new ArrayList<ContentBean>();
			if ("*".equals(condition)) {
				condition = "";
			}
			for (SolrDocument d : list) {
				ContentBean bean = new ContentBean();
				Map<String, List<String>> map = lightMap.get(d.getFieldValue("id").toString());
				bean.setContent((map.get("content") == null || "".equals(condition)) ? d.getFieldValue("content") == null ? ""
						: d.getFieldValue("content").toString()
						: map.get("content").get(0));
				bean.setDescription((map.get("description") == null || "".equals(condition)) ? d
						.getFieldValue("description") == null ? "" : d.getFieldValue("description").toString() : map
						.get("description").get(0));
				bean.setId(d.getFieldValue("id").toString());
				bean.setKeywords((map.get("keywords") == null || "".equals(condition)) ? d.getFieldValue("keywords") == null ? ""
						: d.getFieldValue("keywords").toString()
						: map.get("keywords").get(0));
				bean.setTitle((map.get("title") == null || "".equals(condition)) ? d.getFieldValue("title") == null ? ""
						: d.getFieldValue("title").toString()
						: map.get("title").get(0));
				bean.setCreate_date(d.getFieldValue("create_date") == null ? null : (Date) d
						.getFieldValue("create_date"));
				Article article = articleDao.get(d.getFieldValue("id").toString());
				bean.setHits(article == null ? 0 : article.getHits());
				bean.setCategory(article.getCategory() == null ? null : article.getCategory());
				datalist.add(bean);
			}
			result.put("rows", list.getNumFound());
			result.put("data", datalist);
		}
		return result;

	}

	public List<Map<String, Long>> getKeyWordsCount() throws SolrServerException, IOException {
		List<Map<String, Long>> result = new ArrayList<Map<String, Long>>();
		SolrQuery params = new SolrQuery("*:*");
		params.addSort("title", ORDER.asc);
		params.setStart(0);
		params.setRows(Integer.MAX_VALUE);
		params.setFacet(true).setQuery("*:*").setFacetMinCount(1).setFacetLimit(5).addFacetField("title")
				.addFacetField("keywords").addFacetField("content").addFacetField("description");// 分片字段
		QueryResponse response = client.query(params);
		// 输出分片信息
		List<FacetField> facets = response.getFacetFields();
		for (FacetField facet : facets) {
			List<Count> facetCounts = facet.getValues();
			for (FacetField.Count count : facetCounts) {
				// 关键字 - 出现次数
				Map<String, Long> map = new HashMap<String, Long>();
				map.put(count.getName(), (Long) count.getCount());
				result.add(map);
			}
		}

		return result;
	}
}