/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;

import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Category;

import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 学习统计Entity
 * @author Alex
 * @version 2015-11-26
 */
public class LearnStatistics extends DataEntity<LearnStatistics> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户ID
	private Category category;		// 范畴ID
	private Integer leaningCount;		// 学习文章数
	private Integer learnTotalHours;		// 学书总时长
	private Article article;		// 最近学习文章
	private Date beginUpdateDate;		// 开始 更新时间
	private Date endUpdateDate;		// 结束 更新时间
	
	public LearnStatistics() {
		super();
	}

	public LearnStatistics(String id){
		super(id);
	}

	@NotNull(message="用户ID不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Integer getLeaningCount() {
		return leaningCount;
	}

	public void setLeaningCount(Integer leaningCount) {
		this.leaningCount = leaningCount;
	}
	
	public Integer getLearnTotalHours() {
		return learnTotalHours;
	}

	public void setLearnTotalHours(Integer learnTotalHours) {
		this.learnTotalHours = learnTotalHours;
	}
	
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}
	
	public Date getBeginUpdateDate() {
		return beginUpdateDate;
	}

	public void setBeginUpdateDate(Date beginUpdateDate) {
		this.beginUpdateDate = beginUpdateDate;
	}
	
	public Date getEndUpdateDate() {
		return endUpdateDate;
	}

	public void setEndUpdateDate(Date endUpdateDate) {
		this.endUpdateDate = endUpdateDate;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
		
}