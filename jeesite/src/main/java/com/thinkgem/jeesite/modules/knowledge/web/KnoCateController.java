/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.knowledge.web;

import java.util.List;
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

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.knowledge.entity.KnoCate;
import com.thinkgem.jeesite.modules.knowledge.service.KnoCateService;

/**
 * 知识范畴Controller
 * @author dj
 * @version 2015-11-20
 */
@Controller
@RequestMapping(value = "${adminPath}/knowledge/knoCate")
public class KnoCateController extends BaseController {

	@Autowired
	private KnoCateService knoCateService;
	
	@ModelAttribute
	public KnoCate get(@RequestParam(required=false) String id) {
		KnoCate entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = knoCateService.get(id);
		}
		if (entity == null){
			entity = new KnoCate();
		}
		return entity;
	}
	
	@RequiresPermissions("knowledge:knoCate:view")
	@RequestMapping(value = {"list", ""})
	public String list(KnoCate knoCate, HttpServletRequest request, HttpServletResponse response, Model model) {
		List<KnoCate> list = knoCateService.findList(knoCate); 
		model.addAttribute("list", list);
		return "modules/knowledge/knoCateList";
	}

	@RequiresPermissions("knowledge:knoCate:view")
	@RequestMapping(value = "form")
	public String form(KnoCate knoCate, Model model) {
		if (knoCate.getParent()!=null && StringUtils.isNotBlank(knoCate.getParent().getId())){
			knoCate.setParent(knoCateService.get(knoCate.getParent().getId()));
			// 获取排序号，最末节点排序号+30
			if (StringUtils.isBlank(knoCate.getId())){
				KnoCate knoCateChild = new KnoCate();
				knoCateChild.setParent(new KnoCate(knoCate.getParent().getId()));
				List<KnoCate> list = knoCateService.findList(knoCate); 
				if (list.size() > 0){
					knoCate.setSort(list.get(list.size()-1).getSort());
					if (knoCate.getSort() != null){
						knoCate.setSort(knoCate.getSort() + 30);
					}
				}
			}
		}
		if (knoCate.getSort() == null){
			knoCate.setSort(30);
		}
		model.addAttribute("knoCate", knoCate);
		return "modules/knowledge/knoCateForm";
	}

	@RequiresPermissions("knowledge:knoCate:edit")
	@RequestMapping(value = "save")
	public String save(KnoCate knoCate, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, knoCate)){
			return form(knoCate, model);
		}
		knoCateService.save(knoCate);
		addMessage(redirectAttributes, "保存范畴成功");
		return "redirect:"+Global.getAdminPath()+"/knowledge/knoCate/?repage";
	}
	
	@RequiresPermissions("knowledge:knoCate:edit")
	@RequestMapping(value = "delete")
	public String delete(KnoCate knoCate, RedirectAttributes redirectAttributes) {
		knoCateService.delete(knoCate);
		addMessage(redirectAttributes, "删除范畴成功");
		return "redirect:"+Global.getAdminPath()+"/knowledge/knoCate/?repage";
	}

	@RequiresPermissions("user")
	@ResponseBody
	@RequestMapping(value = "treeData")
	public List<Map<String, Object>> treeData(@RequestParam(required=false) String extId, HttpServletResponse response) {
		List<Map<String, Object>> mapList = Lists.newArrayList();
		List<KnoCate> list = knoCateService.findList(new KnoCate());
		for (int i=0; i<list.size(); i++){
			KnoCate e = list.get(i);
			if (StringUtils.isBlank(extId) || (extId!=null && !extId.equals(e.getId()) && e.getParentIds().indexOf(","+extId+",")==-1)){
				Map<String, Object> map = Maps.newHashMap();
				map.put("id", e.getId());
				map.put("pId", e.getParentId());
				map.put("name", e.getName());
				mapList.add(map);
			}
		}
		return mapList;
	}
	
}