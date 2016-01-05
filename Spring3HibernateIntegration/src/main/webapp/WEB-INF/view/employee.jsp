<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="commonNavigation.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
<form>
<div class="span12">
<c:if  test="${!empty employeeList}">
<table class="table table-striped table-bordered table-condensed">
<thead>
<tr>
<th id="firstName"><spring:message code="label.name" /></th>
<th id="email"><spring:message code="label.email" /></th>
<th id="contactNumber"><spring:message code="label.contact" /></th>
<th id="address"><spring:message code="label.address" /></th>
<th id="comment"><spring:message code="label.comment" /></th>
</tr>
</thead>
<tbody>

<c:forEach items="${employeeList}" var="emp">
    <tr>
        <td>${emp.lastname}, ${emp.firstname} </td>
        <td>${emp.email}</td>
        <td>${emp.telephone}</td>
        <td>${emp.address}</td>
        <td>${emp.comment}</td>
        <td><button type="submit" class="btn .btn-primary"><a href="delete/${emp.id}">
				<spring:message code="label.delete" /></button></td>
    </tr>
</c:forEach>
</tbody>
</table>
</c:if>
</div>
</form>
</div>
</body>
</html>