/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.learn.entity.SearchHistory;

/**
 * 搜索历史DAO接口
 * @author deejay
 * @version 2015-12-31
 */
@MyBatisDao
public interface SearchHistoryDao extends CrudDao<SearchHistory> {
	
}