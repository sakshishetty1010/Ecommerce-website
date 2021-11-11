<%@ page import="com.learn.mycart.entities.User"
	import="com.learn.mycart.entities.Category"
	import="com.learn.mycart.dao.CategoryDao"
	import="com.learn.mycart.helper.FactoryProvider"
	import="com.learn.mycart.helper.Helper"
	import="java.util.HashMap"
	import="java.util.Map"
	import="com.mysql.cj.Session"
	import="org.hibernate.Query"
	import="org.hibernate.SessionFactory"

	import="java.util.List"%>
<%
	User user = (User)session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("message","You are not logged in!! Login First.");
		response.sendRedirect("login.jsp");
		return;
	}
	else {
		if (user.getUserType().equals("normal") || user.getUserType().equals("admin")) {
			session.setAttribute("message","You are not an seller! Do not access this page.");
			response.sendRedirect("login.jsp");
			return;
		}
	}
%>

        <%CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
        List<Category> list = cdao.getCategories(); 
       
        Map<String,Long>m= Helper.getCount(FactoryProvider.getFactory());
        
         %> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container admin">

		<div class="container-fluid mt-3">
			<%@include file="message.jsp"%>
		</div>

		
		<!-- 2nd Row -->
		<div class="row mt-3">
			<!-- 1st Column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-modal">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid"
								src="img/put-in-box.png" alt="user_icon">
						</div>

						<p class="mt-2">Click here to add new category</p>
						<h1 class="text uppercase" text muted>Add Category</h1>
					</div>
				</div>
			</div>
			<!-- 2nd Column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-product-modal">
					<div class="card-body text-center">

						<div class="container">
							<img style="max-width: 100px;" class="img-fluid rounded-circle"
								src="img/add.png" alt="user_icon">
						</div>

						<p class="mt-2">Click here to add new products</p>
						<h1 class="text uppercase" text muted>Add products</h1>
					</div>
				</div>
			</div>

		</div>

	</div>

	<!-- Add category modal -->


	<!-- Modal -->
	<div class="modal fade" id="add-category-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white">
					<h5 class="modal-title" id="exampleModalLabel">Fill Category
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="ProductOperationServlet" method="post">

						<input type="hidden" name="operation" value="addcategory" />

						<div class="form-group">
							<input type="text" class="form-control" name="catTitle"
								placeholder="Enter Category Title" required />
						</div>

						<div class="form-group">

							<textarea placeholder="Enter Category Description"
								style="height: 300px;" class="form-control"
								name="catDescription" required></textarea>
						</div>

						<div class="container text-center">
							<button class="btn btn-outline-success">Add Category</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- End category modal -->

	<!-- *************************** -->

	<!-- Product modal -->

	<!-- Modal -->
	<div class="modal fade" id="add-product-modal" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Fill Product
						Details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">

					<!--Start form -->
					<form action="ProductOperationServlet" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="operation" value="addproduct" />

						<!-- Product title -->
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Enter Product Title" name="pName" required />
						</div>

						<!-- Product Description -->
						<div class="form-group">
							<textarea placeholder="Enter Product Description"
								style="height: 150px;" class="form-control" name="pDesc"
								required></textarea>
						</div>

						<!-- Product price -->
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter Product Price" name="pPrice" required />
						</div>

						<!-- Product Discount -->
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter Product Discount" name="pDiscount" required />
						</div>

						<!-- Product quantity -->
						<div class="form-group">
							<input type="number" class="form-control"
								placeholder="Enter Product Quantity" name="pQuantity" required />
						</div>

						<!-- Product category -->

						

						<div class="form-group">
							<select name="catId" class="form-control" id=>

								<% for (Category c : list){ %>

								<option value="<%=c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>
								<% } %>
							</select>
						</div>

						<!-- Product file -->
						<div>
							<label for="pPic">Select Product Picture :</label> <br> <input
								type="file" id="pPic" name="pPic" required />
						</div>

						<!-- Submit button -->
						<div class="container text-center">
							<button class="btn btn-outline-success">Add Product</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>

						</div>


					</form>
					<!-- End form -->

				</div>
			</div>
		</div>
	</div>



	<!-- End product modal -->
	<%@include file="components/common_modals.jsp" %>

</body>
</html>