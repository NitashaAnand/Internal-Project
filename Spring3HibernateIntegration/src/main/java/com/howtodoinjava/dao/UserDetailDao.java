package com.howtodoinjava.dao;

import java.util.List;

import com.howtodoinjava.entity.EmployeeEntity;

public interface UserDetailDao {
	public List<String> fetchUser(EmployeeEntity employeeEntity);
	public List<String> fetchCurrentUserDetails(String name);

}
