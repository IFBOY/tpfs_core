/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.entity;

import com.thinkgem.jeesite.modules.sys.entity.User;
import javax.validation.constraints.NotNull;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import java.util.Date;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 收藏夹Entity
 * @author Alex
 * @version 2015-11-25
 */
public class Favorite extends DataEntity<Favorite> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户名
	private Article article;		// 文章题目
	private Date beginUpdateDate;		// 开始 更新时间
	private Date endUpdateDate;		// 结束 更新时间
	
	public Favorite() {
		super();
	}

	public Favorite(String id){
		super(id);
	}

	@NotNull(message="用户名不能为空")
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@NotNull(message="文章题目不能为空")
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
		
}