/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.learn.entity.SearchHistory;
import com.thinkgem.jeesite.modules.learn.dao.SearchHistoryDao;

/**
 * 搜索历史Service
 * @author deejay
 * @version 2015-12-31
 */
@Service
@Transactional(readOnly = true)
public class SearchHistoryService extends CrudService<SearchHistoryDao, SearchHistory> {

	public SearchHistory get(String id) {
		return super.get(id);
	}
	
	public List<SearchHistory> findList(SearchHistory searchHistory) {
		return super.findList(searchHistory);
	}
	
	public Page<SearchHistory> findPage(Page<SearchHistory> page, SearchHistory searchHistory) {
		return super.findPage(page, searchHistory);
	}
	
	@Transactional(readOnly = false)
	public void save(SearchHistory searchHistory) {
		List<SearchHistory> list = this.findList(searchHistory);
		if(list!=null && list.size()>0){
			searchHistory = list.get(0);
			searchHistory.setCount(searchHistory.getCount()+1);
		}else{
			searchHistory.setCount(1);
		}
		super.save(searchHistory);
	}
	
	@Transactional(readOnly = false)
	public void delete(SearchHistory searchHistory) {
		super.delete(searchHistory);
	}
	
}