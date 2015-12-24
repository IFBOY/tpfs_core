package com.thinkgem.jeesite.modules.learn.entity;

import java.io.Serializable;

/**
 * 统计知识数据实体
 * 
 * @author chenlijun08@163.com
 * 
 * @version 1.0
 * 
 * @date 2015年12月24日
 */
public class LearnStaticData implements Serializable {

	private static final long serialVersionUID = 1L;
	private String categoryId;
	private String name;
	private int learnCount;
	private int totalMinutes;
	private int articleCount;

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLearnCount() {
		return learnCount;
	}

	public void setLearnCount(int learnCount) {
		this.learnCount = learnCount;
	}

	public int getTotalMinutes() {
		return totalMinutes;
	}

	public void setTotalMinutes(int totalMinutes) {
		this.totalMinutes = totalMinutes;
	}

	public int getArticleCount() {
		return articleCount;
	}

	public void setArticleCount(int articleCount) {
		this.articleCount = articleCount;
	}

}
