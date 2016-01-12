<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li id="home"><a href="home"><spring:message code="label.add" /></a></li>
			<li id="empList"><a href="employee"><spring:message code="label.employee.details" /></a></li>
			<li id="caseDetails"><a href="caseDetails"><spring:message code="label.case.details" /></a></li>
			<li id="caseReport"><a href="caseReport"><spring:message code="label.case.report" /></a></li>
		</ul>
		<ul class="nav pull-right">
			<li id="logout">
				<a href="<c:url value='j_spring_security_logout'/>"><spring:message code="label.logout" /></a>
			</li>
		</ul>
	</div>
	</nav>
	</head>
	</html>