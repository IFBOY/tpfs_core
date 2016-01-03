/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.mapper.JsonMapper;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.cms.entity.Article;
import com.thinkgem.jeesite.modules.cms.entity.Site;
import com.thinkgem.jeesite.modules.cms.utils.CmsUtils;
import com.thinkgem.jeesite.modules.learn.entity.Favorite;
import com.thinkgem.jeesite.modules.learn.service.FavoriteService;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 收藏夹Controller
 * 
 * @author Alex
 * @version 2015-11-25
 */
@Controller
@RequestMapping(value = "${adminPath}/learn/favorite")
public class FavoriteController extends BaseController {

	@Autowired
	private FavoriteService favoriteService;

	@ModelAttribute
	public Favorite get(@RequestParam(required = false) String id) {
		Favorite entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = favoriteService.get(id);
		}
		if (entity == null) {
			entity = new Favorite();
		}
		return entity;
	}

	@RequiresPermissions("learn:favorite:view")
	@RequestMapping(value = { "list", "" })
	public String list(Favorite favorite, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		Page<Favorite> page = favoriteService.findPage(new Page<Favorite>(
				request, response), favorite);
		model.addAttribute("page", page);
		return "modules/learn/favoriteList";
	}

	@RequestMapping(value = "listByUser")
	public String listByUser(Favorite favorite, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		long start = System.currentTimeMillis();
		Site site = CmsUtils.getSite(Site.defaultSiteId());
		model.addAttribute("site", site);
		Page<Favorite> page = favoriteService.findPageByUserId(
				new Page<Favorite>(request, response), favorite);
		model.addAttribute("page", page);
		page.setMessage("匹配结果，共耗时 " + (System.currentTimeMillis() - start) + "毫秒。");
		
		return "modules/cms/front/themes/basic/frontFavorite";
	}

	@RequiresPermissions("learn:favorite:view")
	@RequestMapping(value = "form")
	public String form(Favorite favorite, Model model) {
		model.addAttribute("favorite", favorite);
		return "modules/learn/favoriteForm";
	}

	@RequiresPermissions("learn:favorite:edit")
	@RequestMapping(value = "save")
	public String save(Favorite favorite, Model model,
			RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, favorite)) {
			return form(favorite, model);
		}
		favoriteService.save(favorite);
		addMessage(redirectAttributes, "保存收藏夹成功");
		return "redirect:" + Global.getAdminPath() + "/learn/favorite/?repage";
	}

	/**
	 * ajax 添加
	 */
	@ResponseBody
	@RequestMapping(value = "addFavorite")
	public String addFavorite(String articleId, Model model,
			HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		Favorite favorite = new Favorite();
		favorite.setArticle(new Article(articleId));
		favorite.setUser(UserUtils.getUser());
		favoriteService.save(favorite);
		Map<String, String> result = new HashMap<String, String>();
		result.put("id", favorite.getId());
		return JsonMapper.toJsonString(result);
	}

	/**
	 * ajax 删除
	 */
	@ResponseBody
	@RequestMapping(value = "delFavorite")
	public String delFavorite(String favoriteId, Model model,
			HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		favoriteService.delete(new Favorite(favoriteId));
		return "1";
	}

	@RequiresPermissions("learn:favorite:edit")
	@RequestMapping(value = "delete")
	public String delete(Favorite favorite,
			RedirectAttributes redirectAttributes) {
		favoriteService.delete(favorite);
		addMessage(redirectAttributes, "删除收藏夹成功");
		return "redirect:" + Global.getAdminPath() + "/learn/favorite/?repage";
	}

}