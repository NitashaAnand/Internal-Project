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
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/modal.js"></script>
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>

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
    <script>
    $('#more-info-panel').on('hide.bs.collapse', function (e) {
        $('.more-info-toggle').html('More');
    });

    $('#more-info-panel').on('show.bs.collapse', function (e) {
        $('.more-info-toggle').html('Less');
    });

    $('#edit-profile').on('show.bs.modal', function (e) {
        $('#username').val($('.username').html());
        $('#password').val($('.password').html());
        $('#firstname').val($('.firstname').html());
        $('#lastname').val($('.lastname').html());
        $('#email').val($('.email').html());
        $('#telephone').val($('.telephone').html());
    })
    </script>
    <style>
        /* Global styles */

@import url('http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css');
@import url('http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic');

body,
html {
    width: 100%;
    height: 100%;
    font-family: "Lato", "Helvetica Neue", Helvetica, Arial, sans-serif;
    font-weight: 400;
}

h1,
h2,
h3,
h4,
h5,
h6,
th,
b,
strong {
    font-weight: 700;
}

.lead,
.panel-heading {
    font-size: 16px;
    font-weight: 400;
}

/* Page styles */

body {
    background: url('http://www.stripegenerator.com/generators/generate_stripes.php?fore=f8f8f8&h=30&w=20&p=20&back1=fcfcfcfdfd&back2=dddddd&gt=0&d=0&shadow=0') repeat;
    background-attachment: fixed;
}

.profile-panel, .academic-panel, .achievements-panel, .projects-panel {

}



.user-info-box {
    padding-left: 30px;
}

/* Media queries */

@media (max-width:480px) {
    .btn-edit {
        margin-top: 8px;
    }
    
    .user-info-box {
        padding-left: 15px;
    }
}
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-9 col-sm-12">
            <div class="panel panel-default profile-panel">
                <div class="panel-body">
                <c:forEach var="user" items="${currentList}">
                    <div class="row">
                        
                        <div class="col-sm-9 col-xs-12 user-info-box">
                            <a class="btn btn-info pull-right btn-edit" href="<c:url value='/edit/${user.id}' />" data-toggle="modal" data-target="#edit-profile">
                                <i class="fa fa-edit"></i>
                                Edit
                            </a>
                            
                            <h3 class="user-name">${user.firstname} ${user.lastname}</h3>
                            <p><a href="#more-info-panel" data-toggle="collapse" data-target="#more-info-panel" class="more-info-toggle">More</a></p>
                            <div id="more-info-panel" class="collapse out">
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <p><strong><i class="fa fa-envelope"></i> E-mail: </strong><span class="user-email">${user.email}</span></p>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                    	<p><strong><i class="fa fa-phone-square"></i> Phone: </strong><span class="user-phone">${user.telephone}</span></p>
                                    </div>
                                </div>
                            </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal fade" id="edit-profile" tabindex="-1" role="dialog" aria-labelledby="edit-profile-label" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form:form class="form-horizontal" action="update" role="form" commandName="employee">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="edit-profile">Edit Profile</h4>
                </div>
                <div class="modal-body">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form:form>
        </div>
   
    </div>
</div>   
 <div class="container-fluid">
 
	<div class="row-fluid">
	  <div>
	  <legend>User Details</legend>
		<form:form name="form" class="col-xs-2" commandName="employee" onsubmit="return validate(this);"
			method="POST">
			<table>
			<c:forEach var="user" items="${currentList}">
			<tr><td>
				<form:label path="username"><spring:message code="label.username.employee" /></form:label>
				<div><form:input path="username" class="form-control" type='text' name='username' value="${user.username}" readonly="true" disabled="true"/></div>
			</td>
			</tr>
			<tr><td>
				<form:label path="password"><spring:message code="label.password" /></form:label>
				<div><form:input  path="password" class="form-control" type='text' name='password' value="${user.password}" readonly="true" disabled="true"/></div>
			</td></tr>
			
			<tr><td>
				<form:label path="firstname"><spring:message code="label.firstname" /></form:label>
				<div><form:input path="firstname" class="form-control" type='text' name='firstname' value="${user.firstname}" readonly="true" disabled="true"/></div>
			</td></tr>
			
			<tr><td>
				<form:label path="lastname"><spring:message code="label.lastname" /></form:label>
				<div><form:input path="lastname" class="form-control" type='text' name='lastname' value="${user.lastname}" readonly="true" disabled="true"/></div>
			</td></tr>
			
			<tr><td>
				<form:label path="email"><spring:message code="label.email" /></form:label>
				<div><form:input path="email" class="form-control" type='email' name='email' id="email" value="${user.email}" readonly="true" disabled="true"/></div>
			</td></tr>
			
			<tr><td>
				<form:label path="telephone"><spring:message code="label.contact" /></form:label>
				<div><form:input path="telephone" class="form-control" type='text' name='telephone' value="${user.telephone}" readonly="true" disabled="true"/></div>
			</td></tr>
			</c:forEach>
			</table>
			
		</form:form>
	   </div>
	</div>
  </div>
</div>
</div>
</c:forEach>
</body>
</html>