package com.howtodoinjava.entity;

import java.util.Date;

import javax.persistence.Table;

@Table(name="casedetails")
public class CaseReportEntity {

	private Date date;
	
	private String caseNo;
	
	private String clientName;
	
	private Date assignedOn;
	
	private String assignedTo;
	
	private String issueSummary;
	
	private String comment;
	
	private int timeSpent;
	
	private String ticketStatus;
	
	private String ticketPriority;

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getCaseNo() {
		return caseNo;
	}

	public void setCaseNo(String caseNo) {
		this.caseNo = caseNo;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public Date getAssignedOn() {
		return assignedOn;
	}

	public void setAssignedOn(Date assignedOn) {
		this.assignedOn = assignedOn;
	}

	public String getAssignedTo() {
		return assignedTo;
	}

	public void setAssignedTo(String assignedTo) {
		this.assignedTo = assignedTo;
	}

	public String getIssueSummary() {
		return issueSummary;
	}

	public void setIssueSummary(String issueSummary) {
		this.issueSummary = issueSummary;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getTimeSpent() {
		return timeSpent;
	}

	public void setTimeSpent(int timeSpent) {
		this.timeSpent = timeSpent;
	}

	public String getTicketStatus() {
		return ticketStatus;
	}

	public void setTicketStatus(String ticketStatus) {
		this.ticketStatus = ticketStatus;
	}

	public String getTicketPriority() {
		return ticketPriority;
	}

	public void setTicketPriority(String ticketPriority) {
		this.ticketPriority = ticketPriority;
	}
	
}
