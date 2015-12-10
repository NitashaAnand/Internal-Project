<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title><spring:message code="label.case.report" /></title>
</head>
<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div>
			<legend><spring:message code="label.case.report" /></legend>
			<form name="caseReportForm" class="col-xs-4" action="caseReport" method="GET">
			<table width="100%">
			<tr>
			<td><div class="form-group">
				<label ><spring:message code="label.case.number" /></label>
				<div ><input class="form-control" type='text' name='caseNo'></div>
			</div></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><div class="form-group">
				<label ><spring:message code="label.client.name" /></label>
				<div ><input class="form-control" name='clientName' id="clientName"></div>
			</div></td>
			</tr>
			<tr>
			<td><div class="form-group">
				<label ><spring:message code="label.assigned.on" /></label>
				<div ><input class="form-control" type='text' id="datepicker_assigned_on" name='assignedOn'></div>
			</div></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><div class="form-group">
				<label ><spring:message code="label.ticket.priority" /></label>
				<div ><select class="form-control" data-placeholder = "Select ticket priority" label="priorityList" array="priorityListArray"
						name="ticketPriority">
						<option value="" selected disabled>Select ticket priority</option>
							<c:forEach var="priority" items="${priorityList}">
								<option value="${priority}">
									<c:out value="${priority}" />
								</option>
							</c:forEach>
					</select></div>
			</div></td>
			</tr>
			<tr>
			<td>			
			<div class="form-group">
				<label ><spring:message code="label.ticket.status" /></label>
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
			<td><div class="form-group">
				<label ><spring:message code="label.assigned.to" /></label>
				<div ><input class="form-control" type='text' name='assignedTo'></div>
			</div></td>
			</tr>
			<tr>
			<td><div class="form-group">
				<label ><spring:message code="label.issue" /></label>
				<div ><input class="form-control" type='text' name='issueSummary'></div>
			</div></td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td><div class="form-group">
				<label ><spring:message code="label.time.spent" /></label>
				<div ><input class="form-control" type='text' name='timeSpent'></div>
			</div></td>
			</tr>
			
			</table>
			
			<div>
				<button type="submit" class="btn .btn-primary">
				<spring:message code="label.search" /></button>
				<input type="reset" class="btn" value="Reset"/>
			</div>
			
			<div>&nbsp;</div>
			<div>&nbsp;</div>
		
			<div class="container-fluid">
				<div class="row-fluid">
					<div>
					<table id="reportTable" class="table table-striped table-bordered table-condensed" width="100%" border="1"
								style="margin-top: 5px; table-layout: fixed;">
							<c:choose>
							<c:when test="${!empty reportList}">
							<th>Case number</th>
							<th>Client name</th>
							<th>Priority</th>
							<th>Status</th>
							<th>Assigned to</th>
							<th>Issue summary</th>
							<c:forEach items="${reportList}" var="reportList">
									<tr>
									<td>${reportList.caseNo}</td>
									<td>${reportList.clientName}</td>
									<td>${reportList.ticketPriority}</td>
									<td>${reportList.ticketStatus}</td>
									<td>${reportList.assignedTo}</td>
									<td>${reportList.issueSummary}</td>
									</tr>
									
								</c:forEach>
							</c:when>
							<c:otherwise>
								<table>
									<td>Arora</td>
								</table>
							</c:otherwise>
						</c:choose>
						</table>
					</div>
				</div>
			</div>
			</form>
			</div>
		</div>
	</div>

</body>
</html>