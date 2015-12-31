/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 搜索历史Entity
 * @author deejay
 * @version 2015-12-31
 */
public class SearchHistory extends DataEntity<SearchHistory> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private int count;		// 次数
	
	public SearchHistory() {
		super();
	}

	public SearchHistory(String id){
		super(id);
	}

	@Length(min=1, max=100, message="名称长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
}