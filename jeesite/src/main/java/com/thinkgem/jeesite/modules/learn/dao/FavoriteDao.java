/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.learn.entity.Favorite;

/**
 * 收藏夹DAO接口
 * 
 * @author Alex
 * @version 2015-11-25
 */
@MyBatisDao
public interface FavoriteDao extends CrudDao<Favorite> {
	public List<Favorite> findTopFive(Map<String, Object> param);
}