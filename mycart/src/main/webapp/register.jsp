<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">


				<div class="card">

					<%@include file="message.jsp"%>
					<div class="card-body px-5 ">
						<h3>Sign up here</h3>
						<form action="RegisterServlet" method="post">
							<div class="form-group">
								<label for="name">Username</label> <input type="text"
									name="user_name" class="form-control" id="name"
									aria-describedby="emailHelp" placeholder="Enter username">
							</div>
							<div class="form-group">
								<label for="email">E-mail</label> <input type="email"
									name="user_email" class="form-control" id="email"
									aria-describedby="emailHelp" placeholder="Enter email-id">
							</div>

							<div class="form-group">
									
								<label for="password">Password</label> <input type="password"
									name="user_password" class="form-control" id="password"
									aria-describedby="emailHelp" placeholder="Enter password">
							</div>
							<div class="form-group">
								<label for="phone">Phone No.</label> <input type="number"
									name="user_phone" class="form-control" id="phone"
									aria-describedby="emailHelp" placeholder="Enter phone no">
							</div>

							<div class="form-group">
								<label for="address">Address</label>
								<textarea name="user_address" style="height: 150px;"
									class="form-control" placeholder="Enter Address"></textarea>
							</div>
							
							<a href="login.jsp">Already registered?Click here</a>

							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>