<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Swift Courier</title>
</head>
<body>
	<br>
	<br>
	<br>
	<div class="container" style="margin-top: 20px; padding-top: 0px;">
		<div class="col-xs-6 col-xs-offset-3">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">

						<img alt="" src="<spring:url value='/images/Swift.jpg'/>"
							class="col-xs-4 col-xs-offset-4">
					</div>
					<div class="row" align="center">
						<h2>Welcome to Swift Courier!!</h2>
					</div>
				</div>
				<div class="panel-body" align="center">
					<div class="row">
						<div class="col-xs-6" align="left">
							<a href="#">Home</a>

						</div>
						<div class="col-xs-6" align="right">
							<a href="logout">Logout</a>

						</div>
					</div>
					<br> <br>
					<div class="row">
						<h4 style="color: Teal" align="center">
							Currently logged-in user:<%=session.getAttribute("loggedUser")%>
						</h4>
					</div>
					<br>
					<security:authorize access="hasRole('ROLE_EMPLOYEE')">
						<a href="report.htm">Generate Report</a>
					</security:authorize>
					<br>
					<security:authorize
						access="hasRole('ROLE_EMPLOYEE') or hasRole('ROLE_USER')">
						<a href="transaction.htm">Send a Courier</a>
					</security:authorize>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
