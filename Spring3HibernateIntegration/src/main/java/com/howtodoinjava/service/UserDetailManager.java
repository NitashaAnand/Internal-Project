package com.howtodoinjava.service;

import java.util.List;

import com.howtodoinjava.entity.EmployeeEntity;

public interface UserDetailManager {
	public List<String> fetchUser(EmployeeEntity employeeEntity);
	public List<String> fetchCurrentUserDetails(String name);

}
