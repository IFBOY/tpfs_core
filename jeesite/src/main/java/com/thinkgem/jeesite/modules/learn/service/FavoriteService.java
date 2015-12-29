/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.learn.dao.FavoriteDao;
import com.thinkgem.jeesite.modules.learn.entity.Favorite;

/**
 * 收藏夹Service
 * 
 * @author Alex
 * @version 2015-11-25
 */
@Service
@Transactional(readOnly = true)
public class FavoriteService extends CrudService<FavoriteDao, Favorite> {

	/**
	 * 持久层对象
	 */
	@Autowired
	protected FavoriteDao dao;

	public Favorite get(String id) {
		return super.get(id);
	}

	public Favorite getByFavorite(Favorite favorite) {
		return dao.getByFavorite(favorite);
	}

	public List<Favorite> findList(Favorite favorite) {
		return super.findList(favorite);
	}

	public List<Favorite> findTopFive(Map<String, Object> param) {
		return super.dao.findTopFive(param);
	}

	public Page<Favorite> findPage(Page<Favorite> page, Favorite favorite) {
		return super.findPage(page, favorite);
	}

	public Page<Favorite> findPageByUserId(Page<Favorite> page,
			Favorite favorite) {
		favorite.setPage(page);
		page.setList(dao.findListByUserId(favorite));
		return page;
	}

	@Transactional(readOnly = false)
	public void save(Favorite favorite) {
		super.save(favorite);
	}

	@Transactional(readOnly = false)
	public void delete(Favorite favorite) {
		super.delete(favorite);
	}

}