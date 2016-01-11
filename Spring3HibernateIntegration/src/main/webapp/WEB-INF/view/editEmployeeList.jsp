<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<jsp:include page="commonNavigation.jsp" />
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
	  <legend>Employee Administration</legend>
		<form name="form" class="col-xs-2" action="add" commandName="employee" onsubmit="return validate(this);"
			method="POST">
			
			<div class="form-group">
				<label><spring:message code="label.username.employee" /></label>
				<div><input class="form-control" type='text' name='username'/></div>
			</div>
			
			<div class="form-group">
				<label><spring:message code="label.password" /></label>
				<div><input class="form-control" type='text' name='password'/></div>
			</div>
			
			<div class="form-group">
				<label><spring:message code="label.firstname" /></label>
				<div><input class="form-control" type='text' name='firstname'/></div>
			</div>
			
			<div class="form-group">
				<label><spring:message code="label.lastname" /></label>
				<div><input class="form-control" type='text' name='lastname'></div>
			</div>
			
			<div>
			
			<div class="form-group">
				<label><spring:message code="label.email" /></label>
				<div><input class="form-control" type='email' name='email' id="email"></div>
			</div>
			</div>
			
			<div class="form-group">
				<label><spring:message code="label.contact" /></label>
				<div><input class="form-control" type='text' name='telephone'></div>
			</div>
			
			<div class="form-group">
				<label><spring:message code="label.address" /></label>
				<div><input class="form-control" type='text' name='address'></div>
			</div>
			
			<div class="form-group">
				<label><spring:message code="label.enter.comment" /></label>
				<div><input type='checkbox' name='noComment' onclick="enableDisableTextArea(this);"></div>
				<div>&nbsp;</div>
				<div><textarea class="form-control" name='comment' placeholder="Enter text here" id="tArea" disabled="disabled"></textarea></div>
			</div>
			
			<div>
			<div>&nbsp;</div>
			<div>
				<button type="submit" class="btn .btn-primary">
				<spring:message code="label.add"/></button>
				<input type="reset" class="btn" value="Reset"/>
			</div>
			</div>
			
		</form>
	   </div>
	</div>
  </div>
</div>
</div>
</body>
</html>