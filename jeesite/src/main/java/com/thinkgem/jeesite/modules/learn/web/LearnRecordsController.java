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
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.learn.entity.LearnRecords;
import com.thinkgem.jeesite.modules.learn.entity.LearnStatistics;
import com.thinkgem.jeesite.modules.learn.service.LearnRecordsService;
import com.thinkgem.jeesite.modules.learn.service.LearnStatisticsService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 学习记录Controller
 * @author dj
 * @version 2015-11-27
 */
@Controller
@RequestMapping(value = "${adminPath}/learn/learnRecords")
public class LearnRecordsController extends BaseController {

	@Autowired
	private LearnRecordsService learnRecordsService;
	
	@Autowired
	private LearnStatisticsService learnStatisService;
	
	@ModelAttribute
	public LearnRecords get(@RequestParam(required=false) String id) {
		LearnRecords entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = learnRecordsService.get(id);
		}
		if (entity == null){
			entity = new LearnRecords();
		}
		return entity;
	}
	
	@RequiresPermissions("learn:learnRecords:view")
	@RequestMapping(value = {"list", ""})
	public String list(LearnRecords learnRecords, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<LearnRecords> page = learnRecordsService.findPage(new Page<LearnRecords>(request, response), learnRecords); 
		model.addAttribute("page", page);
		return "modules/learn/learnRecordsList";
	}

	@RequiresPermissions("learn:learnRecords:view")
	@RequestMapping(value = "form")
	public String form(LearnRecords learnRecords, Model model) {
		model.addAttribute("learnRecords", learnRecords);
		return "modules/learn/learnRecordsForm";
	}

	@RequiresPermissions("learn:learnRecords:edit")
	@RequestMapping(value = "save")
	public String save(LearnRecords learnRecords, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, learnRecords)){
			return form(learnRecords, model);
		}
		learnRecordsService.save(learnRecords);
		addMessage(redirectAttributes, "保存学习记录成功");
		return "redirect:"+Global.getAdminPath()+"/learn/learnRecords/?repage";
	}
	
	/**
	 * ajax 添加
	 */
	@ResponseBody
	@RequestMapping(value = "saveLearnRecords")
	public String saveLearnRecords(LearnRecords learnRecords, Model model, HttpServletResponse response) {
		response.setContentType("application/json; charset=UTF-8");
		learnRecords.setUser(UserUtils.getUser());
		int learnMinutes = learnRecords.getLearnMinutes();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("DEL_FLAG_NORMAL", "0");
		User user = UserUtils.getUser();
		param.put("USERID", user.getId());
		param.put("ARTICLEID", learnRecords.getArticle().getId());
		LearnRecords learnRec = learnRecordsService.findLearnRecords(param);
		learnRecords.setLearnMinutes(learnRec.getLearnMinutes()+learnMinutes);
		learnRecordsService.save(learnRecords);
		param.put("CATEGORYID", learnRec.getArticle().getCategory().getId());
		LearnStatistics learnStatistics = learnStatisService.findLearnStatistics(param);
		learnStatistics.setArticle(learnRec.getArticle());
		learnStatistics.setLearnTotalHours(learnStatistics.getLearnTotalHours()+learnMinutes);
		learnStatisService.save(learnStatistics);
		return "1";
	}
	
	@RequiresPermissions("learn:learnRecords:edit")
	@RequestMapping(value = "delete")
	public String delete(LearnRecords learnRecords, RedirectAttributes redirectAttributes) {
		learnRecordsService.delete(learnRecords);
		addMessage(redirectAttributes, "删除学习记录成功");
		return "redirect:"+Global.getAdminPath()+"/learn/learnRecords/?repage";
	}

}