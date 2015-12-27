package com.thinkgem.jeesite.common.utils;

import java.util.Date;

import org.apache.solr.client.solrj.beans.Field;

import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;

/**
 * 分词实体类
 * 
 * @author chenlijun08@163.com
 * 
 * @version 1.0
 * 
 * @date 2015年12月16日
 */
public class ContentBean extends BaseEntity<ContentBean> {
	private static final long serialVersionUID = 1L;
	@Field
	private String id;
	@Field
	private String title;
	@Field
	private String keywords;
	@Field
	private String description;
	@Field
	private String content;
	private int hits;
	private String q;
	private Category category;
	@Field
	private Date create_date;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	@Override
	public void preInsert() {

	}

	@Override
	public void preUpdate() {
	}

	public String getQ() {
		return q;
	}

	public void setQ(String q) {
		this.q = q;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getUrl() {
		Article article = new Article();
		article.setCategory(this.category);
		article.setId(this.id);
		return CmsUtils.getUrlDynamic(article);
	}
}
