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
<script>
$(function(){
    $(".dropdown").hover(            
            function() {
                $('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
                $(this).toggleClass('open');
                $('b', this).toggleClass("caret caret-up");                
            },
            function() {
                $('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
                $(this).toggleClass('open');
                $('b', this).toggleClass("caret caret-up");                
            });
    });

</script>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<ul class="nav navbar-nav">
			<li id="home"><a href="home"><spring:message code="label.add" /></a></li>
			<li id="empList"><a href="employee"><spring:message code="label.employee.details" /></a></li>
			<li id="caseDetails"><a href="caseDetails"><spring:message code="label.case.details" /></a></li>
			<li id="caseReport"><a href="caseReport"><spring:message code="label.case.report" /></a></li>
			<li id="userdetails"><a href="userdetails">User Details</a></li>
		</ul>
		<!--<ul class="nav pull-right">
			<li id="logout">
				<a href="<c:url value='j_spring_security_logout'/>"><spring:message code="label.logout" /></a>
			</li>
		</ul>-->
		<ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                 <c:forEach var="user" items="${currentList}">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-user"></span>
                        <strong><c:out value="${user.username}"/></strong>
                        <span class="glyphicon glyphicon-chevron-down"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li>
                            <div class="navbar-login">
                                <div class="row">
                                    <div class="col-lg-4">
                                        <p class="text-center">
                                            <span class="glyphicon glyphicon-user icon-size"></span>
                                        </p>
                                    </div>
                                    
                                    <div class="col-lg-8">
                                        <p class="text-left"><strong><c:out value="${user.firstname} ${user.lastname}"/></strong></p>
                                        <p class="text-left small"><c:out value="${user.email}"/></p>
                                        <!-- <p class="text-left">
                                            <a href="#" class="btn btn-primary btn-block btn-sm">Profile</a>
                                        </p> -->
                                    </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </li>
                        <li class="divider navbar-login-session-bg"></li>
                       
            <li><a href="<c:url value='j_spring_security_logout'/>">Sign Out <span class="glyphicon glyphicon-log-out pull-right"></span></a></li>
                    </ul>
                </li>
            </ul>
	</div>
	</nav>
	<style>
	.navbar-login
{
    width: 305px;
    padding: 10px;
    padding-bottom: 0px;
}

.navbar-login-session
{
    padding: 10px;
    padding-bottom: 0px;
    padding-top: 0px;
}

.icon-size
{
    font-size: 87px;
}
</style>
	</head>
<body>

</body>
	</html>