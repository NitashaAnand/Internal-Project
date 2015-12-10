package com.howtodoinjava.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.howtodoinjava.entity.CaseDetailsEntity;

public class CaseReportDaoImpl extends HibernateDaoSupport implements CaseReportDao {

	
	@SuppressWarnings("unchecked")
	public List<String> fetchResults(final CaseDetailsEntity caseDetailsEntity) {
		
		List<String> reportList = new ArrayList<String>();
		
		getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria criteria = session.createCriteria(CaseDetailsEntity.class);
				addCriteria(caseDetailsEntity, criteria);
				List results = criteria.list();
				return results;
			}
		});
		return reportList;
		
		/*DetachedCriteria criteria = DetachedCriteria.forClass(CaseDetailsEntity.class);
		if(caseDetailsEntity.getCaseNo()!=null && !caseDetailsEntity.getCaseNo().isEmpty()){
			criteria.add(Restrictions.eq("caseNo",caseDetailsEntity.getCaseNo()));
		}
		if(caseDetailsEntity.getClientName()!=null && !caseDetailsEntity.getClientName().isEmpty()){
			criteria.add(Restrictions.eq("clientName",caseDetailsEntity.getClientName()));
		}
		if(caseDetailsEntity.getAssignedOn()!=null){
			criteria.add(Restrictions.eq("assignedOn",caseDetailsEntity.getAssignedOn()));
		}
		if(caseDetailsEntity.getAssignedTo()!=null && !caseDetailsEntity.getAssignedTo().isEmpty()){
			criteria.add(Restrictions.eq("assignedTo",caseDetailsEntity.getAssignedTo()));
		}
		if(caseDetailsEntity.getIssueSummary()!=null && !caseDetailsEntity.getIssueSummary().isEmpty()){
			criteria.add(Restrictions.eq("issueSummary",caseDetailsEntity.getIssueSummary()));
		}
		if(caseDetailsEntity.getTicketStatus()!=null && !caseDetailsEntity.getTicketStatus().isEmpty()){
			criteria.add(Restrictions.eq("ticketStatus",caseDetailsEntity.getTicketStatus()));
		}
		if(caseDetailsEntity.getTicketPriority()!=null && !caseDetailsEntity.getTicketPriority().isEmpty()){
			criteria.add(Restrictions.eq("ticketPriority",caseDetailsEntity.getTicketPriority()));
		}
		
		reportList = (List<String>) getHibernateTemplate().findByCriteria(criteria);
		
		System.out.println(reportList);
		
		return reportList;*/
		
	}
	
	@SuppressWarnings("unchecked")
	private void addCriteria (final CaseDetailsEntity caseDetailsEntity, Criteria criteria){
				
		if(caseDetailsEntity.getCaseNo()!=null && !caseDetailsEntity.getCaseNo().isEmpty()){
			criteria.add(Restrictions.eq("caseNo",caseDetailsEntity.getCaseNo()));
		}
		if(caseDetailsEntity.getClientName()!=null && !caseDetailsEntity.getClientName().isEmpty()){
			criteria.add(Restrictions.eq("clientName",caseDetailsEntity.getClientName()));
		}
		if(caseDetailsEntity.getAssignedOn()!=null){
			criteria.add(Restrictions.eq("assignedOn",caseDetailsEntity.getAssignedOn()));
		}
		if(caseDetailsEntity.getAssignedTo()!=null && !caseDetailsEntity.getAssignedTo().isEmpty()){
			criteria.add(Restrictions.eq("assignedTo",caseDetailsEntity.getAssignedTo()));
		}
		if(caseDetailsEntity.getIssueSummary()!=null && !caseDetailsEntity.getIssueSummary().isEmpty()){
			criteria.add(Restrictions.eq("issueSummary",caseDetailsEntity.getIssueSummary()));
		}
		if(caseDetailsEntity.getTicketStatus()!=null && !caseDetailsEntity.getTicketStatus().isEmpty()){
			criteria.add(Restrictions.eq("ticketStatus",caseDetailsEntity.getTicketStatus()));
		}
		if(caseDetailsEntity.getTicketPriority()!=null && !caseDetailsEntity.getTicketPriority().isEmpty()){
			criteria.add(Restrictions.eq("ticketPriority",caseDetailsEntity.getTicketPriority()));
		}
	}
}
