/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.learn.entity.LearnRecords;

/**
 * 学习记录DAO接口
 * 
 * @author dj
 * @version 2015-11-27
 */
@MyBatisDao
public interface LearnRecordsDao extends CrudDao<LearnRecords> {
	public List<LearnRecords> findTopFive(Map<String, Object> param);

	public LearnRecords findLearnRecords(Map<String, Object> param);

}