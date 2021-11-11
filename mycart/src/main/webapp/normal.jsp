<%@ page import="com.learn.mycart.entities.User"
 		import="com.learn.mycart.helper.FactoryProvider"
		import="com.learn.mycart.entities.Product"
		import="com.learn.mycart.dao.ProductDao"
		import="com.learn.mycart.entities.Category"
		import="com.learn.mycart.dao.CategoryDao"
		import="com.learn.mycart.helper.Helper"
		import="java.util.List"
		import="java.util.ArrayList"
		import="javax.servlet.http.HttpServlet"%>
<%
	User user = (User)session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("message","You are not logged in!! Login First.");
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
<title>Normal panel</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
	<div class="row mt-3 mx-2">
	<%		
	
        String cat = request.getParameter("category");
	    //out.println(cat);
	    
	    
	    
	
		ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
		 List<Product> list = null;
		 
		 if(cat == null){
			 list = pdao.getAllProducts();
		 }else if(cat.trim().equals("all") ){
			
			 list = pdao.getAllProducts();
		}
		else {
			
			int cid= Integer.parseInt(cat.trim());
			list = pdao.getAllProductsById(cid);
			
			
		}
		
		
	
		
        //List<Product> list = dao.getAllProducts();
        
        
        
        CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
        List<Category> clist = cdao.getCategories();

	%>
	<!-- show categories -->
	<div class="col-md-2">
			
			<div class="list-group mt-4">
			
				<a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
   				All Products
  				</a>
			<%
			
			for(Category c : clist){
				
			%> 
			
			<a href="index.jsp?category=<%=c.getCategoryId() %> " class="list-group-item list-group-item-action "><%= c.getCategoryTitle() %></a>	
				
			
			<%
				
			}
			
			%>
			
			</div>
			
	</div>	
	
	<!-- show products -->
	<div class="col-md-10">
			<div class="row mt-4">
				<div class="col-md-12">
				<!-- traversing products -->
					<div class="card-columns">
					<%
					for(Product p : list){
					%>
					<!--product card  -->
					<div class="card">
					
					<div class="container text-center">
						<img class="card-img-top m-2" src="img/products/<%=p.getpPhoto()%>" style= "max-height: 100px; max-width: 100px; width:auto;">
					</div>
					
						<div class="card-body">
							<h5 class="card-title"><%=p.getpName() %></h5>
								<p class="card-text"><%=Helper.get10Words(p.getpDescription()) %></p>
						
						</div>
						
						<div class="card-footer text-center">
							<button class="btn custom-bg text-white" onclick="add(<%= p.getpId() %>, '<%= p.getpName() %>' , <%= p.getPriceAfterApplyingDiscount() %>)">Add to cart</button>
							<button class="btn btn-outline-success"> &#8377; <%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label"> &#8377;<%=  p.getpPrice() %></span><%=p.getpDiscount() %>% OFF</button>
						</div>
					
					</div>
					<% }
					
					if(list.size()== 0){
						out.println("<h3> no item here </h3>");
					}
					%>
					</div>
				
				</div>
			</div>
			
	</div>
	
	
	</div>
	</div>
	<%@include file="components/common_modals.jsp" %>
	<%@include file="js/script.js" %>
	
</body>
</html>