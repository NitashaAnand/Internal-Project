package com.howtodoinjava.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import java.io.Serializable;  
import org.hibernate.Transaction;  
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.howtodoinjava.entity.CaseDetailsEntity;
import com.howtodoinjava.entity.EmployeeEntity;

public class CaseReportDaoImpl extends HibernateDaoSupport implements CaseReportDao {

	@Autowired
    private SessionFactory sessionFactory;
	
	public List<String> fetchResults(CaseDetailsEntity caseDetailsEntity) {
		List<String> reportList = new ArrayList<String>();
		reportList=addCriteria(caseDetailsEntity);
		return reportList;
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private List<String> addCriteria (final CaseDetailsEntity caseDetailsEntity){
		List result= (List)this.getHibernateTemplate().execute(new HibernateCallback() {

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria criteria = session.createCriteria(CaseDetailsEntity.class);
				if(caseDetailsEntity.getCaseNo()!=null && !caseDetailsEntity.getCaseNo().isEmpty()){
					criteria.add(Restrictions.eq("caseNo",caseDetailsEntity.getCaseNo()));
				}
				if(caseDetailsEntity.getClientName()!=null && !caseDetailsEntity.getClientName().isEmpty()){
					criteria.add(Restrictions.eq("clientName",caseDetailsEntity.getClientName()));
				}
				if(caseDetailsEntity.getAssignedOn()!=null && !caseDetailsEntity.getAssignedOn().isEmpty()){
					criteria.add(Restrictions.eq("assignedOn",caseDetailsEntity.getAssignedOn()));
				}
				if(caseDetailsEntity.getAssignedTo()!=null && !caseDetailsEntity.getAssignedTo().isEmpty()){
					criteria.add(Restrictions.eq("assignedTo",caseDetailsEntity.getAssignedTo()));
				}
				if(caseDetailsEntity.getIssueSummary()!=null && !caseDetailsEntity.getIssueSummary().isEmpty()){
				criteria.add(Restrictions.ilike("issueSummary", caseDetailsEntity.getIssueSummary(),  MatchMode.ANYWHERE));
				}
				if(caseDetailsEntity.getTicketStatus()!=null && !caseDetailsEntity.getTicketStatus().isEmpty()){
					criteria.add(Restrictions.eq("ticketStatus",caseDetailsEntity.getTicketStatus()));
				}
				if(caseDetailsEntity.getTicketPriority()!=null && !caseDetailsEntity.getTicketPriority().isEmpty()){
					criteria.add(Restrictions.eq("ticketPriority",caseDetailsEntity.getTicketPriority()));
				}
				if(caseDetailsEntity.getTimeSpent()!=null && !caseDetailsEntity.getTimeSpent().isEmpty()){
					criteria.add(Restrictions.eq("timeSpent",caseDetailsEntity.getTimeSpent()));
				}
				
				List reportList = criteria.list();
				
				return reportList;
			}
			
		});
		return result;

	}
	
	public void deleteCase(Integer caseId) {
		CaseDetailsEntity casedetailsEntity = (CaseDetailsEntity) sessionFactory.getCurrentSession().load(
				CaseDetailsEntity.class, caseId);
        if (null != casedetailsEntity) {
        	this.sessionFactory.getCurrentSession().delete(casedetailsEntity);
        }
	}
}
