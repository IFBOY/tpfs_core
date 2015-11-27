/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import org.hibernate.validator.constraints.Length;
import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 学习记录Entity
 * @author dj
 * @version 2015-11-27
 */
public class LearnRecords extends DataEntity<LearnRecords> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户
	private Article article;		// 文章
	private String difficultyDegree;		// 困难度
	private String helpDegree;		// 帮助度
	private Integer learnMinutes;		// 学习时长
	private Date beginUpdateDate;		// 开始 更新时间
	private Date endUpdateDate;		// 结束 更新时间
	
	public LearnRecords() {
		super();
	}

	public LearnRecords(String id){
		super(id);
	}

	@NotNull(message="用户不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@NotNull(message="文章不能为空")
	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}
	
	@Length(min=0, max=1, message="困难度长度必须介于 0 和 1 之间")
	public String getDifficultyDegree() {
		return difficultyDegree;
	}

	public void setDifficultyDegree(String difficultyDegree) {
		this.difficultyDegree = difficultyDegree;
	}
	
	@Length(min=0, max=1, message="帮助度长度必须介于 0 和 1 之间")
	public String getHelpDegree() {
		return helpDegree;
	}

	public void setHelpDegree(String helpDegree) {
		this.helpDegree = helpDegree;
	}
	
	public Integer getLearnMinutes() {
		return learnMinutes;
	}

	public void setLearnMinutes(Integer learnMinutes) {
		this.learnMinutes = learnMinutes;
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
		
}