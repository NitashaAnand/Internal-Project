package com.howtodoinjava.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.howtodoinjava.entity.EmployeeEntity;
import com.howtodoinjava.service.CaseManager;
import com.howtodoinjava.service.EmployeeManager;
import com.howtodoinjava.service.UserDetailManager;

@Controller
public class EditEmployeeController {

	@Autowired
	private EmployeeManager employeeManager;
	
	@Autowired
	private UserDetailManager detailManager;

	public void setDetailManager(UserDetailManager detailManager) {
		this.detailManager = detailManager;
	}
	
	public void setEmployeeManager(EmployeeManager employeeManager) {
		this.employeeManager = employeeManager;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String defaultPage(ModelMap map) {
		return "redirect:/home";
	}
	@RequestMapping(value = "/userdetails", method = RequestMethod.GET)
	public String UserDetails(ModelMap map,Principal principal) {
		String name = principal.getName();
		System.out.println("Current User"+ name);
		List<String> currentList = new ArrayList<String>();
		currentList = detailManager.fetchCurrentUserDetails(name);
		System.out.println("Current UserDetails......."+currentList);
		map.addAttribute("currentList",currentList);
		map.addAttribute("employee", new EmployeeEntity());
		return "userdetails";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String home(ModelMap map,Principal principal) {
		String name = principal.getName();
		System.out.println("Current User"+ name);
		List<String> currentList = new ArrayList<String>();
		currentList = detailManager.fetchCurrentUserDetails(name);
		System.out.println("Current UserDetails......."+currentList);
		map.addAttribute("currentList",currentList);
		map.addAttribute("employee", new EmployeeEntity());
		return "editEmployeeList";
	}
	
	@RequestMapping(value = "/employee", method = RequestMethod.GET)
	public String listEmployees(ModelMap map,Principal principal) { 
		String name = principal.getName();
		System.out.println("Current User"+ name);
		List<String> currentList = new ArrayList<String>();
		currentList = detailManager.fetchCurrentUserDetails(name);
		System.out.println("Current UserDetails......."+currentList);
		map.addAttribute("currentList",currentList);
		map.addAttribute("employee", new EmployeeEntity());
		map.addAttribute("employeeList", employeeManager.getAllEmployees());
		return "employee";
	}

	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addEmployee(
			@ModelAttribute(value = "employee") EmployeeEntity employee,
			BindingResult result) {
		if (!employee.getTelephone().equals("^[0-9]")
				&& employee.getTelephone().length() != 10) {
			return "redirect:/home";
		}
		if(employee.getId()==null)
		{
			employeeManager.addEmployee(employee);
			return "redirect:/employee";
			
		}
		else
		{
			this.employeeManager.updateEmployee(employee);
			return "redirect:/userdetails";
		}
	}


	@RequestMapping("/delete/{employeeId}")
	public String deleteEmplyee(@PathVariable("employeeId") Integer employeeId) {
		employeeManager.deleteEmployee(employeeId);
		return "redirect:/employee";
	}
	
	 @RequestMapping("/edit/{id}")
	    public String editEmployee(@PathVariable("id") int id, ModelMap model){
	        model.addAttribute("employee", this.employeeManager.getEmployeeById(id));
	        model.addAttribute("employeeList", this.employeeManager.getAllEmployees());
	        return "editEmployeeList";
	    }
	 
	
	 
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}

	@RequestMapping(value = "/accessdenied", method = RequestMethod.GET)
	public String loginerror(ModelMap model) {
		model.addAttribute("error", "true");
		return "denied";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(ModelMap model) {
		return "login";
	}
}
