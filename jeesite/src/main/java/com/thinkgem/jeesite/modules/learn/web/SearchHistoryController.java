/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.learn.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.learn.entity.SearchHistory;
import com.thinkgem.jeesite.modules.learn.service.SearchHistoryService;

/**
 * 搜索历史Controller
 * @author deejay
 * @version 2015-12-31
 */
@Controller
@RequestMapping(value = "${adminPath}/learn/searchHistory")
public class SearchHistoryController extends BaseController {

	@Autowired
	private SearchHistoryService searchHistoryService;
	
	@ModelAttribute
	public SearchHistory get(@RequestParam(required=false) String id) {
		SearchHistory entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = searchHistoryService.get(id);
		}
		if (entity == null){
			entity = new SearchHistory();
		}
		return entity;
	}
	
	@RequiresPermissions("learn:searchHistory:view")
	@RequestMapping(value = {"list", ""})
	public String list(SearchHistory searchHistory, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<SearchHistory> page = searchHistoryService.findPage(new Page<SearchHistory>(request, response), searchHistory); 
		model.addAttribute("page", page);
		return "modules/learn/searchHistoryList";
	}

	@RequiresPermissions("learn:searchHistory:view")
	@RequestMapping(value = "form")
	public String form(SearchHistory searchHistory, Model model) {
		model.addAttribute("searchHistory", searchHistory);
		return "modules/learn/searchHistoryForm";
	}

	@RequiresPermissions("learn:searchHistory:edit")
	@RequestMapping(value = "save")
	public String save(SearchHistory searchHistory, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, searchHistory)){
			return form(searchHistory, model);
		}
		searchHistoryService.save(searchHistory);
		addMessage(redirectAttributes, "保存搜索历史成功");
		return "redirect:"+Global.getAdminPath()+"/learn/searchHistory/?repage";
	}
	
	@RequiresPermissions("learn:searchHistory:edit")
	@RequestMapping(value = "delete")
	public String delete(SearchHistory searchHistory, RedirectAttributes redirectAttributes) {
		searchHistoryService.delete(searchHistory);
		addMessage(redirectAttributes, "删除搜索历史成功");
		return "redirect:"+Global.getAdminPath()+"/learn/searchHistory/?repage";
	}

}