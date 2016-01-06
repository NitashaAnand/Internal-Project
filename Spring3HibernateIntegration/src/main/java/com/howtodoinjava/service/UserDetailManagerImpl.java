package com.howtodoinjava.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.howtodoinjava.entity.EmployeeEntity;
import com.howtodoinjava.dao.CaseReportDao;
import com.howtodoinjava.dao.UserDetailDao;

public class UserDetailManagerImpl implements UserDetailManager{
	
	@Autowired
	private UserDetailDao userDetailDao;
	

	public List<String> fetchUser(EmployeeEntity employeeEntity) {
		// TODO Auto-generated method stub
		List<String> userList = new ArrayList<String>();
		userList = userDetailDao.fetchUser(employeeEntity);
		return userList;
	}

}

