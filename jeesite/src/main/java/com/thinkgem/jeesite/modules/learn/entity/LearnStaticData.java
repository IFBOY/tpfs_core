package com.thinkgem.jeesite.modules.learn.entity;

import java.io.Serializable;

import com.thinkgem.jeesite.modules.cms.entity.Article;

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
	private int learnCount;
	private int totalMinutes;
	private int articleCount;
	private Article article;

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

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}

}
