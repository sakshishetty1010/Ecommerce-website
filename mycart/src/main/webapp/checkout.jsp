<%@page import="com.learn.mycart.helper.FactoryProvider"
		import="com.learn.mycart.entities.Product"
		import="com.learn.mycart.dao.ProductDao"
		import="com.learn.mycart.entities.Category"
		import="com.learn.mycart.dao.CategoryDao"
		import="com.learn.mycart.helper.Helper"
		import="java.util.List"
		import="java.util.ArrayList"
		import="java.io.PrintWriter"
		import="javax.servlet.http.HttpServlet"%>
<%
	User user = (User)session.getAttribute("current-user");
	if (user == null) {
	session.setAttribute("message","You are not logged in!! Login First to checkout.");
	response.sendRedirect("login.jsp");
	return;
	}
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Billing</title>
		<%@include file="components/common_css_js.jsp"%>
	</head>
	<body>
		<%@include file="components/navbar.jsp"%>
		<%@include file="components/common_modals.jsp" %>
	
<head>
	<title>Checkout Form</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="style.css">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

</head>

<body>
		<div class="col-md-4 container bg-default">
			
			<h4 class="my-4">
					Billing Address
			</h4>
			
			<form>
				<div class="form-row">
					<div class="col-md-6 form-group">
						<label for="firstname">First Name</label>
						<input type="text" class="form-control" id="firstname" placeholder="First Name">
						<div class="invalid-feedback">
							Valid first name is required.
						</div>
					</div>

					<div class="col-md-6 form-group">
						<label for="lastname">Last Name</label>
						<input type="text" class="form-control" id="lastname" placeholder="Last Name">
						<div class="invalid-feedback">
							Valid last name is required.
						</div>
					</div>
				</div>
				<div class="form-group">
						<label for="email">Email</label>
						<input type="email" class="form-control" id="email" placeholder="you@example.com" required>
				</div>

				<div class="form-group">
					<label for="adress">Address</label>
					<input type="text" class="form-control" id="adress" placeholder="1234 Main Street" required>
					<div class="invalid-feedback">
						Please enter your shipping address.
					</div>
				</div>

				<div class="form-group">
					<label for="address2">Address 2
						<span class="text-muted">(Optional)</span>
					</label>
					<input type="text" class="form-control" id="adress2" placeholder="Flat No">
				</div>

				<div class="row">
					<div class="col-md-4 form-group">
						<label for="country">Country</label>
						<select class="form-control" id="country">
							<option>Select</option>
							<option>India</option>
						</select>
						<div class="invalid-feedback">
							Please select a valid country.
						</div>
					</div>

					<div class="col-md-4 form-group">
						<label for="city">City</label>
						<select  class="form-control" id="city">
							<option>Select</option>
							<option>Mumbai</option>
							<option>Chennai</option>
							<option>Banglore</option>
							<option>Delhi</option>
							<option>Uttarakhand</option>
							<option>Nashik</option>
							<option>Nagpur</option>
							<option>Karnataka</option>
							<option>Kolkata</option>
							
						</select>
						<div class="invalid-feedback">
							Please provide a valid city.
						</div>
					</div>
						
					<div class="col-md-4 form-group">
						<label for="postcode">Postcode</label>
						<select class="form-control" id="postcode">
							<option>Select</option>
							<option>400001</option>
							<option>400002</option>
							<option>400003</option>
							<option>400004</option>
							<option>400004</option>
							<option>400005</option>
							<option>400006</option>
							<option>400007</option>
							<option>400008</option>
							
							
						</select>
						<div class="invalid-feedback">
							Postcode required.
						</div>
					</div>
				</div>

				<hr>
				
				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="shipping-adress"> 
						Shipping address is the same as my billing address
					<label for="shipping-adress" class="form-check-label"></label>
				</div>

				<div class="form-check">
					<input type="checkbox" class="form-check-input" id="same-adress">
						Save this information for next time
					<label for="same-adress" class="form-check-label"></label>					
					</div>

				<hr>

				<h4 class="mb-4">Payment</h4>
				
				<div class="form-check">
					<input type="radio" class="form-check-input" id="credit" name="payment-method" checked required>
					<label for="credit" class="form-check-label">Credit Card</label>
				</div>

				<div class="form-check">
					<input type="radio" class="form-check-input" id="debit" name="payment-method" required>
					<label for="debit" class="form-check-label">Debit Card</label>
				</div>

				<div class="form-check">
					<input type="radio" class="form-check-input" id="paypal" name="payment-method"  required>
					<label for="paypal" class="form-check-label">PayPal</label>
				</div>
			
				<div class="row mt-4">
					<div class="col-md-6 form-group">
							<label for="card-name">Name on card</label>
							<input type="text" class="form-control" id="card-name" required>
							<div class="invalid-feedback">
								Name on card is required
							</div>
						</div>

						<div class="col-md-6 form-group">
							<label for="card-no">Card Number</label>
							<input type="text" class="form-control" id="card-no"  required>
							<div class="invalid-feedback">
								Credit card number is required
							</div>
						</div>
				</div>

				<div class="form-row">
					<div class="col-md-5 form-group">
							<label for="expiration">Expire Date</label>
							<input type="text" class="form-control" id="card-name"  required>
							<div class="invalid-feedback">
								Expiration date required
							</div>
						</div>
					

					<div class="col-md-5 form-group">
							<label for="ccv-no">Security Number</label>
							<input type="text" class="form-control" id="sec-no"  required>
							<div class="invalid-feedback">
								Security code required
							</div>
					</div>
				</div>

					<hr class="mb-4">
				<button type = "button" onclick="goToIndex()" class="btn btn-primary bt-lg btn-block"  data-toggle="modal" data-target="#exampleModal">Place Order</button>
			<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalLabel">Order Placed</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">&times;</span>
				        </button>
				      </div>
				      <div class="modal-body">
				       Wohooo!! ORDER PLACED
				      </div>
				      <div class="modal-footer">
				        <button><a href="index.jsp">Back to Home</a></button>
				        
				      </div>
				    </div>
				  </div>
				</div>
									
			</form>
		</div>
</body>
</html>
		