package com.howtodoinjava.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.howtodoinjava.entity.CaseDetailsEntity;

public class CaseDetailDaoImpl implements CaseDetailDao{

	
	@Autowired
    private SessionFactory sessionFactory;
	
	public void addCase(CaseDetailsEntity caseDetails) {
		this.sessionFactory.getCurrentSession().save(caseDetails);
	}

}
