package com.howtodoinjava.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;

import com.howtodoinjava.entity.CaseDetailsEntity;
import com.howtodoinjava.entity.CaseReportEntity;
import com.howtodoinjava.entity.EmployeeEntity;
import com.howtodoinjava.enums.CasePriorityEnum;
import com.howtodoinjava.enums.TicketStatusEnum;
import com.howtodoinjava.service.CaseManager;
import com.howtodoinjava.service.UserDetailManager;

@Controller
public class CaseDetailsController {
	
	@Autowired
	private CaseManager caseManager;
	
	@Autowired
	private UserDetailManager detailManager;

	public void setCaseManager(CaseManager caseManager) {
		this.caseManager = caseManager;
	}
	
	public void setDetailManager(UserDetailManager detailManager) {
		this.detailManager = detailManager;
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
	
	public void getUser(ModelMap map, @ModelAttribute(value = "userDetail") EmployeeEntity employeeEntity){
		map.addAttribute("caseReport", new CaseReportEntity());
		List<String> userList = new ArrayList<String>();
		userList = detailManager.fetchUser(employeeEntity);
		map.addAttribute("userList",userList);
	}
	
	@RequestMapping(value = "/caseDetails", method = RequestMethod.GET)
	public String home(ModelMap map,Principal principal, @ModelAttribute(value = "userDetail") EmployeeEntity employeeEntity) {
		String name = principal.getName();
		System.out.println("Current User"+ name);
		List<String> currentList = new ArrayList<String>();
		currentList = detailManager.fetchCurrentUserDetails(name);
		System.out.println("Current UserDetails......."+currentList);
		map.addAttribute("currentList",currentList);
		getTicketPriorities(map);
		getTicketStatuses(map);
		getUser(map, employeeEntity);
		map.addAttribute("caseDetails", new CaseDetailsEntity());
		return "caseDetails";
	}
	
	@RequestMapping(value = "/addCase", method = RequestMethod.POST)
	public String addCase(ModelMap map,
			@ModelAttribute(value = "caseDetails") CaseDetailsEntity caseDetails,
			BindingResult result, SessionStatus status, @ModelAttribute(value = "userDetail") EmployeeEntity employeeEntity) {
		
		getTicketPriorities(map);
		getTicketStatuses(map);
		getUser(map, employeeEntity);
		
		boolean error = false;
	     
	    System.out.println(caseDetails); //Verifying if information is same as input by user
	     
		if (caseDetails.getCaseNo().isEmpty()
				|| caseDetails.getClientName().isEmpty()
				|| caseDetails.getAssignedOn().isEmpty()
				|| caseDetails.getAssignedTo() == null
				|| caseDetails.getIssueSummary().isEmpty()
				|| caseDetails.getTimeSpent().isEmpty()
				|| caseDetails.getTicketStatus() == null
				|| caseDetails.getTicketPriority() == null) {
	        result.rejectValue("date", "error.date");
	        error = true;
	    }	
		
	    if(error) {
	    	map.addAttribute("errorMessage", "Please enter all details");
	        return "caseDetails";
	    }
		caseManager.addCase(caseDetails);
		status.setComplete();
		return "redirect:/caseDetails";
	}
}
