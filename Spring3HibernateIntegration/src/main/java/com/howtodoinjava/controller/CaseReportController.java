package com.howtodoinjava.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.howtodoinjava.entity.CaseDetailsEntity;
import com.howtodoinjava.entity.CaseReportEntity;
import com.howtodoinjava.enums.CasePriorityEnum;
import com.howtodoinjava.enums.TicketStatusEnum;
import com.howtodoinjava.service.CaseReportManager;

@Controller
public class CaseReportController {
	
	@Autowired
	private CaseReportManager caseReportManager;
	
	public void setCaseReportManager(CaseReportManager caseReportManager) {
		this.caseReportManager = caseReportManager;
	}

	public void getTicketPriorities(ModelMap map) { 
		List<String> priorityList = new ArrayList<String>();
		priorityList.add(CasePriorityEnum.P1.toString());
		priorityList.add(CasePriorityEnum.P2.toString());
		priorityList.add(CasePriorityEnum.P3.toString());
		priorityList.add(CasePriorityEnum.P4.toString());
		map.addAttribute("priorityList",priorityList);
	}
	
	public void getTicketStatuses(ModelMap map){
		List<String> ticketStatuses = new ArrayList<String>();
		ticketStatuses.add(TicketStatusEnum.NEW.getStatusCode());
		ticketStatuses.add(TicketStatusEnum.OPEN.getStatusCode());
		ticketStatuses.add(TicketStatusEnum.PENDING.getStatusCode());
		ticketStatuses.add(TicketStatusEnum.ONHOLD.getStatusCode());
		ticketStatuses.add(TicketStatusEnum.SOLVED.getStatusCode());
		ticketStatuses.add(TicketStatusEnum.CLOSED.getStatusCode());
		map.addAttribute("ticketStatuses",ticketStatuses);
	}

	@RequestMapping(value = "/caseReport", method = RequestMethod.GET)
	public String home(ModelMap map, @ModelAttribute(value = "caseReport") CaseDetailsEntity caseDetailsEntity){
		getTicketPriorities(map);
		getTicketStatuses(map);
		map.addAttribute("caseReport", new CaseReportEntity());
		List<String> reportList = new ArrayList<String>();
		reportList = caseReportManager.fetchResults(caseDetailsEntity);
		map.addAttribute("reportList",reportList);
		return "caseReport";
	}
	
	@RequestMapping(value = "/caseReportView", method = RequestMethod.GET)
	public String addCase(
			@ModelAttribute(value = "caseReport") CaseDetailsEntity caseDetailsEntity,
			BindingResult result,
			ModelMap map) {
		List<String> reportList = new ArrayList<String>();
		reportList = caseReportManager.fetchResults(caseDetailsEntity);
		map.addAttribute("reportList",reportList);
		return "redirect:/caseReport";
	}
	
}
