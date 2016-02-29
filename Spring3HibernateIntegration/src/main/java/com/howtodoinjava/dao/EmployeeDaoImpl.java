package com.howtodoinjava.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.Session;

import com.howtodoinjava.entity.EmployeeEntity;

@Repository
public class EmployeeDaoImpl implements EmployeeDAO  {

	@Autowired
    private SessionFactory sessionFactory;
	
	public void addEmployee(EmployeeEntity employee) {
		this.sessionFactory.getCurrentSession().save(employee);
	}

	@SuppressWarnings("unchecked")
	public List<EmployeeEntity> getAllEmployees() {
		return this.sessionFactory.getCurrentSession().createQuery("from Employee").list();
	}

	public void deleteEmployee(Integer employeeId) {
		EmployeeEntity employee = (EmployeeEntity) sessionFactory.getCurrentSession().load(
				EmployeeEntity.class, employeeId);
        if (null != employee) {
        	this.sessionFactory.getCurrentSession().delete(employee);
        }
	}
	
    public EmployeeEntity getEmployeeById(int id) {
        Session session = this.sessionFactory.getCurrentSession();      
        EmployeeEntity e = (EmployeeEntity) session.load(EmployeeEntity.class, new Integer(id));
        System.out.println("Employee loaded successfully, Employee details="+e);
        return e;
    }
	
    public void updateEmployee(EmployeeEntity p) {
        Session session = this.sessionFactory.getCurrentSession();
        session.update(p);
        System.out.println("Employee updated successfully, Employee Details="+p);
    }

}
