package com.howtodoinjava.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.howtodoinjava.dao.CaseDetailDao;
import com.howtodoinjava.entity.CaseDetailsEntity;

public class CaseManagerImpl implements CaseManager{

	@Autowired
	private CaseDetailDao caseDetailDao;
	
	@Transactional
	public void addCase(CaseDetailsEntity caseDetails) {
		caseDetailDao.addCase(caseDetails);
	}

}
