package com.howtodoinjava.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.howtodoinjava.dao.CaseReportDao;
import com.howtodoinjava.entity.CaseDetailsEntity;

public class CaseReportManagerImpl implements CaseReportManager{
	
	@Autowired
	private CaseReportDao caseReportDao;

	public void setCaseReportDao(CaseReportDao caseReportDao) {
		this.caseReportDao = caseReportDao;
	}

	public List<String> fetchResults(CaseDetailsEntity caseDetailsEntity) {
		List<String> reportList = new ArrayList<String>();
		reportList = caseReportDao.fetchResults(caseDetailsEntity);
		return reportList;
	}

}
