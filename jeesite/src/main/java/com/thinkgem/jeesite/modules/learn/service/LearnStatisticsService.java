/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.learn.entity.LearnStatistics;
import com.thinkgem.jeesite.modules.learn.dao.LearnStatisticsDao;

/**
 * 学习统计Service
 * @author Alex
 * @version 2015-11-26
 */
@Service
@Transactional(readOnly = true)
public class LearnStatisticsService extends CrudService<LearnStatisticsDao, LearnStatistics> {

	public LearnStatistics get(String id) {
		return super.get(id);
	}
	
	public List<LearnStatistics> findList(LearnStatistics learnStatistics) {
		return super.findList(learnStatistics);
	}
	
	public Page<LearnStatistics> findPage(Page<LearnStatistics> page, LearnStatistics learnStatistics) {
		return super.findPage(page, learnStatistics);
	}
	
	@Transactional(readOnly = false)
	public void save(LearnStatistics learnStatistics) {
		super.save(learnStatistics);
	}
	
	@Transactional(readOnly = false)
	public void delete(LearnStatistics learnStatistics) {
		super.delete(learnStatistics);
	}
	
}