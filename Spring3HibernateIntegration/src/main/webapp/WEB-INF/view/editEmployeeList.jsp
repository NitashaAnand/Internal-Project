<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<c:if test="${empty employee.username}">
<jsp:include page="commonNavigation.jsp" />
</c:if>
	<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	

    <title>Spring 3 hibernate integration example on www.howtodoinjava.com</title>
    <script type="text/javascript">
    function validate(form){
    	var email=document.form.email.value;
    	var patt = /^[_a-z0-9]+(\.[_a-z0-9]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4})$/;
    	var errors = [];
    	if(!patt.test(email)){
    		errors[errors.length] = "You must enter a valid email address";
    		//document.getElementById("email").innerHTML = "*Please enter a valid email*";
    	}
    	
    	if (errors.length > 0) {
    		  reportErrors(errors);
    		  return false;
    		 }
    	function reportErrors(errors){
    		 var msg = "Please Enter Valid Data...\n";
    		 for (var i = 0; i<errors.length; i++) {
    		 var numError = i + 1;
    		  msg += "\n" + numError + ". " + errors[i];
    		}
    		 window.alert(msg);
    	}   
		window.alert("Employee saved");	
		return true;
    }
    
    
   function enableDisableTextArea(chkbx){
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
</head>
<body>
 <div class="container-fluid">
 
	<div class="row-fluid">
	  <div>
	  <c:if test="${empty employee.username}">
	  <legend>Employee Administration</legend>
	  </c:if>
		<form:form name="form" class="col-xs-4" action="add" commandName="employee" onsubmit="return validate(this);"
			method="POST">
			
			<table>
	<c:if test="${!empty employee.username}">
		<legend>User details</legend>
   		<tr>
       		 <td>
            	<form:hidden path="id" readonly="true" size="8"  disabled="true" />
            	<form:hidden path="id" />
        	</td> 
    	</tr>
    	<tr><td>
				<form:label path="username"><spring:message code="label.username.employee" /></form:label>
				<div><form:input path="username" class="form-control" type='text' name='username' readonly="true" disabled="true"/></div>
				<div><form:hidden path="username"/></div>
			</td>
			</tr>
    </c:if>
    <c:if test="${empty employee.username}">
			<!--  <div class="form-group">-->
			<tr><td>
			<form:label path="username"><spring:message code="label.username.employee" /></form:label>
				<div><form:input path="username" class="form-control" type='text' name='username'/></div>
			</td>
			</tr>
			</c:if>
			<tr><td>
				<form:label path="password"><spring:message code="label.password" /></form:label>
				<div><form:input  path="password" class="form-control" type='text' name='password'/></div>
			</td></tr>
			
			<tr><td>
				<form:label path="firstname"><spring:message code="label.firstname" /></form:label>
				<div><form:input path="firstname" class="form-control" type='text' name='firstname'/></div>
			</td></tr>
			
			<tr><td>
				<form:label path="lastname"><spring:message code="label.lastname" /></form:label>
				<div><form:input path="lastname" class="form-control" type='text' name='lastname'/></div>
			</td></tr>
			
			<tr><td>
				<form:label path="email"><spring:message code="label.email" /></form:label>
				<div><form:input path="email" class="form-control" type='email' name='email' id="email"/></div>
			</td></tr>
			
			<tr><td>
				<form:label path="telephone"><spring:message code="label.contact" /></form:label>
				<div><form:input path="telephone" class="form-control" type='text' name='telephone'/></div>
			</td></tr>
			</table>
			<div>&nbsp;</div>
			<div>
				<c:if test="${empty employee.username}">
				<button type="submit" class="btn .btn-primary">
				<spring:message code="label.add"/></button>
				</c:if>
				<c:if test="${!empty employee.username}">
				<button type="submit" class="btn btn-primary">
				Save changes</button>
				</c:if>
			</div>
			</div>
			
		</form:form>
	   </div>
	</div>
  </div>
</div>
</div>
</body>
</html>