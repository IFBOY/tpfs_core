/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.knowledge.dao;

import com.thinkgem.jeesite.common.persistence.TreeDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.knowledge.entity.KnoCate;

/**
 * 知识范畴DAO接口
 * @author dj
 * @version 2015-11-20
 */
@MyBatisDao
public interface KnoCateDao extends TreeDao<KnoCate> {
	
}