/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.knowledge.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.service.TreeService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.knowledge.entity.KnoCate;
import com.thinkgem.jeesite.modules.knowledge.dao.KnoCateDao;

/**
 * 知识范畴Service
 * @author dj
 * @version 2015-11-20
 */
@Service
@Transactional(readOnly = true)
public class KnoCateService extends TreeService<KnoCateDao, KnoCate> {

	public KnoCate get(String id) {
		return super.get(id);
	}
	
	public List<KnoCate> findList(KnoCate knoCate) {
		if (StringUtils.isNotBlank(knoCate.getParentIds())){
			knoCate.setParentIds(","+knoCate.getParentIds()+",");
		}
		return super.findList(knoCate);
	}
	
	@Transactional(readOnly = false)
	public void save(KnoCate knoCate) {
		super.save(knoCate);
	}
	
	@Transactional(readOnly = false)
	public void delete(KnoCate knoCate) {
		super.delete(knoCate);
	}
	
}