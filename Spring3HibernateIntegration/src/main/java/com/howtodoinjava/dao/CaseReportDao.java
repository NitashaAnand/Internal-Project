package com.howtodoinjava.dao;

import java.util.List;

import com.howtodoinjava.entity.CaseDetailsEntity;

public interface CaseReportDao {
	public List<String> fetchResults(CaseDetailsEntity caseDetailsEntity);
}
