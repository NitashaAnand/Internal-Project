<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

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
	
	
<style>
	body{
		font-family="Helvetica Neue",Helvetica,Arial,sans-serif;
		font-size=3px;
		line-height=18px;
		color=#333;	
	}
	.btn-primary{
		background-color=blue;
	}
	
	.well{
		min-height=20px;
		padding=19px;
		margin-bottom=20px;
		background-color=#f5f5f5;
		border-radius=4px;	
		box-shadow=inset 0 1px 1px rgba(0,0,0,0.05);
	}
	
</style>
</head>
<body>
	<div class="container-fluid">
	<div class="row-fluid"><div class="span-12"><h1><spring:message code="label.header"/></div></div>
	<div class="row-fluid">
	<div class="well">
		<legend><spring:message code="label.login"/></legend>
		<form name="f" action="<c:url value='j_spring_security_check'/>"
			method="POST">
			<div class="span-6">
			<div class="control-group">
				<label class="control-label"><spring:message code="label.username" /></label>
				<div class="controls"><input type='text' name='j_username' /><span class="help-inline"></span></div>
			</div>
			<div>&nbsp;</div>
			<div class="control-group">
				<label class="control-label"><spring:message code="label.password" /></label>
				<div class="controls"><input type='password' name='j_password'><span class="help-inline"></span></div>
			</div>
			<div>
				<div>&nbsp;</div>
			</div>
			<div>
				<button type="submit" class="btn .btn-primary">
				<spring:message code="label.submit" /></button>
			</div>
			</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>