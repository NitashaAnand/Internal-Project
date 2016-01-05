package com.howtodoinjava.service;

import java.util.List;

import com.howtodoinjava.entity.CaseDetailsEntity;

public interface CaseReportManager {
	public List<String> fetchResults(CaseDetailsEntity caseDetailsEntity);
	 public void deleteCase(Integer caseId);
	//public void updateCase(CaseDetailsEntity caseDetailsEntity);
	 //public CaseDetailsEntity getCaseById(int id);
	 
	 /*public CaseDetailsEntity getRowById(int id);  
	  
	 public int updateRow(CaseDetailsEntity caseDetailsEntity);  */
	 
}
