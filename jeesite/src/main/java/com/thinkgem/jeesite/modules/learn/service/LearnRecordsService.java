/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.learn.entity.LearnRecords;
import com.thinkgem.jeesite.modules.learn.dao.LearnRecordsDao;

/**
 * 学习记录Service
 * 
 * @author dj
 * @version 2015-11-27
 */
@Service
@Transactional(readOnly = true)
public class LearnRecordsService extends
		CrudService<LearnRecordsDao, LearnRecords> {

	public LearnRecords get(String id) {
		return super.get(id);
	}

	public LearnRecords findLearnRecords(Map<String, Object> param) {
		return super.dao.findLearnRecords(param);
	}
	
	public List<LearnRecords> findList(LearnRecords learnRecords) {
		return super.findList(learnRecords);
	}

	public List<LearnRecords> findTopFive(Map<String, Object> param) {
		return super.dao.findTopFive(param);
	}

	public Page<LearnRecords> findPage(Page<LearnRecords> page,
			LearnRecords learnRecords) {
		return super.findPage(page, learnRecords);
	}

	@Transactional(readOnly = false)
	public void save(LearnRecords learnRecords) {
		super.save(learnRecords);
	}

	@Transactional(readOnly = false)
	public void delete(LearnRecords learnRecords) {
		super.delete(learnRecords);
	}

}