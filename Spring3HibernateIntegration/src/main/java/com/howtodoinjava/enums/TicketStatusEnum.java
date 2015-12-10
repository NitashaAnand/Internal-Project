package com.howtodoinjava.enums;

public enum TicketStatusEnum {
	NEW("New"),
	OPEN("Open"),
	PENDING("Pending"),
	CLOSED("Closed"),
	ONHOLD("On-Hold"),
	SOLVED("Solved");
	
	private String statusCode;
	
	TicketStatusEnum(String str){
		statusCode = str;
	}

	public String getStatusCode() {
		return statusCode;
	}
	
}
