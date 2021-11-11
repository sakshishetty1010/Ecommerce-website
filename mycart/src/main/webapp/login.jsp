<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3"></div>
				<div class="card-header custom-bg text-white">
					<h1>Login here</h1>
				</div>
				<div class="card-body">
					<%@include file="message.jsp"%>
					<form action="LoginServlet" method="post">
						<div class="form-group ">
							<label for="exampleInputEmail1">Email address</label> <input
								name="email" type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"> <small
								id="emailHelp" class="form-text text-muted">We'll never
								share your email with anyone else.</small>
						</div>
						<div class="form-group">
							<label for="exampleInputPassword1">Password</label> <input
								name="password" type="password" class="form-control"
								id="exampleInputPassword1">
						</div>
						<a href="register.jsp">New User?Click to register</a>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
							<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
						</div>
					</form>
				</div>

			</div>

		</div>

	</div>
</body>
</html>