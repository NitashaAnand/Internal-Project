<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="commonNavigation.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
  <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <script>
	$(function() {
    $( "#datepicker_assigned_on" ).datepicker();
  });
  </script>
  <script type="text/javascript">
  function enableDisableTextArea(chkbx)
    {
        if(chkbx.checked == true)
        {
        	document.getElementById("tArea").disabled = false;
        }
        else
        {
        	document.getElementById("tArea").disabled = true;
        }
    }
	</script>
	<style>
		.form-group.required .control-label:after {
			content:"*";color:red;
		}
		
        .error {
    color: #b94a48;
    padding:5px 10px;
    background-color: #fde9f3;
    border:1px solid #c98186;
    border-radius:5px;
    margin-bottom: 10px;
	width:32%;
}
.error-field
    {
        color: #ff0000;
        font-weight: bold;
    }
    	
	</style>

<title><spring:message code="label.case.report" /></title>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div>
			<legend><spring:message code="label.case.report" /></legend>
			
			<spring:nestedPath path="caseDetails">
    <form:errors  path="date"  element="div"
        cssClass="error" />
</spring:nestedPath>
			
			<form:form method="post" modelAttribute="caseDetails" action="addCase" name="caseReportForm" class="col-xs-4">
			
			
			
			 <input type="hidden" name='date' label="Date" title="dd/mm/yyyy format"  value="<%= new java.util.Date() %>"/>
			
                </td>
			<table width="100%">
			<tr>
			<td><div class="form-group required">
				<label class="control-label"><spring:message code="label.case.number" /></label>
				<div ><input class="form-control" type='text' name='caseNo'></div>
				
			</div></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><div class="form-group required">
				<label class="control-label"><spring:message code="label.client.name" /></label>
				<div ><input class="form-control" name='clientName' id="clientName"></div>
				
			</div></td>
			</tr>
			<tr>
			<td><div class="form-group required">
				<label class="control-label"><spring:message code="label.assigned.on" /></label>
				<div ><input class="form-control" type='text' id="datepicker_assigned_on" name='assignedOn'></div>
				
			</div></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><div class="form-group required">
				<label class="control-label"><spring:message code="label.ticket.priority" /></label>
				<div ><select class="form-control" data-placeholder = "Select ticket priority" label="priorityList" array="priorityListArray"
						name="ticketPriority">
						<option value="" selected disabled>Select ticket priority</option>
							<c:forEach var="priority" items="${priorityList}">
								<option value="${priority}">
									<c:out value="${priority}" />
								</option>
							</c:forEach>
					</select></div>
			</div>
			
			</td>
			</tr>
			<tr>
			<td>			
			<div class="form-group required">
				<label class="control-label"><spring:message code="label.ticket.status" /></label>
				<div ><select class="form-control" data-placeholder ="Select ticket status" label="ticketStatuses" array="ticketStatusesArray"
						name="ticketStatus">
						<option value="" selected disabled>Select ticket status</option>
							<c:forEach var="status" items="${ticketStatuses}">
								<option value="${status}">
									<c:out value="${status}" />
								</option>
							</c:forEach>
					</select></div>
					
			</div>
			
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			
			<td>			
			<div class="form-group">
				<label ><spring:message code="label.assigned.to" /></label>
				<div ><select class="form-control" data-placeholder ="Select assignee" label="assignedTo" array="assigneeArray"
						name="assignedTo">
						<option value="" selected disabled>Select assignee</option>
							<c:forEach var="user" items="${userList}">
								<option value="${user.firstname} ${user.lastname}">
									<c:out value="${user.firstname} ${user.lastname}"/>
								</option>
							</c:forEach>
					</select></div>
			</div>
			
			</td>
			
			
			</tr>
			<tr>
			<td><div class="form-group required">
				<label class="control-label"><spring:message code="label.issue" /></label>
				<div ><input class="form-control" type='text' name='issueSummary'></div>
			</div>
			
			</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><div class="form-group required">
				<label class="control-label"><spring:message code="label.time.spent" /></label>
				<div ><input class="form-control" type='text' placeholder="In minutes" name='timeSpent'></div>
			</div>
			
			</td>
			</tr>
			<tr>
			<td>
			<div class="form-group">
				<label><spring:message code="label.enter.comment" /></label>
				<div ><input type='checkbox' name='noComment' onclick="enableDisableTextArea(this);"></div>
				<div>&nbsp;</div>
				<div ><textarea class="form-control" name="comment" placeholder="Enter text here" id="tArea" disabled="disabled"></textarea></div>
			</div>
			</td>				
			</tr>
			</table>
			
			<div>
				<button type="submit" class="btn .btn-primary">
				<spring:message code="label.add.case" /></button>
				<input type="reset" class="btn" value="Reset"/>
			</div>
			
			<div>&nbsp;</div>
			<div>&nbsp;</div>
			</form:form>
			</div>
		</div>
	</div>
</body>
</html>