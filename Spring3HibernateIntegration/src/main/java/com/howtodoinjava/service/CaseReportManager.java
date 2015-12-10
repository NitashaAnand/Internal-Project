package com.howtodoinjava.service;

import java.util.List;

import com.howtodoinjava.entity.CaseDetailsEntity;

public interface CaseReportManager {
	public List<String> fetchResults(CaseDetailsEntity caseDetailsEntity);
}
