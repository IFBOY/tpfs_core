/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.learn.entity.LearnStatistics;

/**
 * 学习统计DAO接口
 * @author Alex
 * @version 2015-11-26
 */
@MyBatisDao
public interface LearnStatisticsDao extends CrudDao<LearnStatistics> {
	
}