package com.howtodoinjava.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional
	public void deleteCase(Integer caseId) {
		caseReportDao.deleteCase(caseId);
	}
	
	/*@Transactional
    public void updateCase(CaseDetailsEntity caseDetailsEntity) {
        this.caseReportDao.updateCase(caseDetailsEntity);
    }
	
	 @Transactional
	    public CaseDetailsEntity getCaseById(int id) {
	        return this.caseReportDao.getCaseById(id);
	    }*/
	
	
	 /*public CaseDetailsEntity getRowById(int id) {  
	  return caseReportDao.getRowById(id);  
	 }  
	   
	 public int updateRow(CaseDetailsEntity caseDetailsEntity) {  
	  return caseReportDao.updateRow(caseDetailsEntity);  
	 } */ 

}
