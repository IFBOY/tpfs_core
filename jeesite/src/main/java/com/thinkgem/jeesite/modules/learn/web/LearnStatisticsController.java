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
import com.thinkgem.jeesite.modules.learn.entity.LearnStatistics;
import com.thinkgem.jeesite.modules.learn.service.LearnStatisticsService;

/**
 * 学习统计Controller
 * @author Alex
 * @version 2015-11-26
 */
@Controller
@RequestMapping(value = "${adminPath}/learn/learnStatistics")
public class LearnStatisticsController extends BaseController {

	@Autowired
	private LearnStatisticsService learnStatisticsService;
	
	@ModelAttribute
	public LearnStatistics get(@RequestParam(required=false) String id) {
		LearnStatistics entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = learnStatisticsService.get(id);
		}
		if (entity == null){
			entity = new LearnStatistics();
		}
		return entity;
	}
	
	@RequiresPermissions("learn:learnStatistics:view")
	@RequestMapping(value = {"list", ""})
	public String list(LearnStatistics learnStatistics, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LearnStatistics> page = learnStatisticsService.findPage(new Page<LearnStatistics>(request, response), learnStatistics); 
		model.addAttribute("page", page);
		return "modules/learn/learnStatisticsList";
	}

	@RequiresPermissions("learn:learnStatistics:view")
	@RequestMapping(value = "form")
	public String form(LearnStatistics learnStatistics, Model model) {
		model.addAttribute("learnStatistics", learnStatistics);
		return "modules/learn/learnStatisticsForm";
	}

	@RequiresPermissions("learn:learnStatistics:edit")
	@RequestMapping(value = "save")
	public String save(LearnStatistics learnStatistics, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, learnStatistics)){
			return form(learnStatistics, model);
		}
		learnStatisticsService.save(learnStatistics);
		addMessage(redirectAttributes, "保存学习统计成功");
		return "redirect:"+Global.getAdminPath()+"/learn/learnStatistics/?repage";
	}
	
	@RequiresPermissions("learn:learnStatistics:edit")
	@RequestMapping(value = "delete")
	public String delete(LearnStatistics learnStatistics, RedirectAttributes redirectAttributes) {
		learnStatisticsService.delete(learnStatistics);
		addMessage(redirectAttributes, "删除学习统计成功");
		return "redirect:"+Global.getAdminPath()+"/learn/learnStatistics/?repage";
	}

}