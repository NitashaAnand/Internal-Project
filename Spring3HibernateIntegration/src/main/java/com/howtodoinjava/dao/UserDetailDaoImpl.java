package com.howtodoinjava.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.howtodoinjava.entity.EmployeeEntity;


public class UserDetailDaoImpl extends HibernateDaoSupport implements UserDetailDao {
	
	public List<String> fetchUser(EmployeeEntity employeeEntity) {
		List<String> userList = new ArrayList<String>();
		userList=addCriteria(employeeEntity);
		return userList;
	}
	public List<String> fetchCurrentUserDetails(String name) {
		List<String> currentList = new ArrayList<String>();
		currentList=addUserCriteria(name);
		return currentList;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<String> addCriteria (final EmployeeEntity employeeEntity){
		List result= (List)this.getHibernateTemplate().execute(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria criteria = session.createCriteria(EmployeeEntity.class);
				if(employeeEntity.getFirstname()!=null && !employeeEntity.getFirstname().isEmpty()){
					criteria.add(Restrictions.eq("firstName",employeeEntity.getFirstname()));
				}
				if(employeeEntity.getLastname()!=null && !employeeEntity.getLastname().isEmpty()){
					criteria.add(Restrictions.eq("lastName",employeeEntity.getLastname()));
				}
				
				List userList = criteria.list();
				
				return userList;
			}
			
		});
		return result;

	}
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<String> addUserCriteria (final String name){
		List result= (List)this.getHibernateTemplate().execute(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria criteria = session.createCriteria(EmployeeEntity.class);
				criteria.add(Restrictions.eq("username",name));
				List currentList = criteria.list();
				System.out.println("Current User Details ............."+ currentList);
				return currentList;
			}
			
		});
		return result;
		

	}



	
	

	
}
