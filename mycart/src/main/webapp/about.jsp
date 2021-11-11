<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<%@include file="components/common_css_js.jsp"  %>

<style>

@import url('https://fonts.googleapis.com/css?family=Roboto');
		body{
		   margin:0;
		   padding:0;
		   font-family: 'Roboto', sans-serif;
		   position:relative;
		}
		nav{
		   width:100%;
		   height:100px;
		   background-color:rgba(51, 51, 51, 0.3);
		   position:absolute;
		   top:0;
		   z-index:5;
		}
		
		.container{
		   width:100%;
		}
		.container h1{
		   font-size:50px
		}
		.about{
		   padding:5% 0;
		   width:100%;
		   height:auto;
		   background-color:#fff;
		}
		.about .left{
		   padding:2% 0;
		   float:left;
		   width:50%;
		   display:inline-block;
		}
		.about .right{
		   width:50%;
		   display:inline-block;
		}
		.about .right img{
		   width:100%
		}
		.about .left h1{
		   text-align:center;
		   color:#1EADFF;
		   margin:0 0 10px 0;
		}
		.about .left hr{
		   width:20%;
		   border-top:2px solid #000;
		   border-bottom:none;
		}
		.about .left p{
		   font-size:1rem;
		   margin:40px auto;
		   width:80%
		}
		
		.mission{
		   padding:5% 0;
		   width:100%;
		   height:auto;
		   background-color:#fff;
		}
		.mission .right{
		   padding:2% 0;
		   width:50%;
		
		   display:inline-block;
		}
		.mission .left{
		   float:left;
		   width:50%;
		
		   display:inline-block;
		}
		.mission .left img{
		   width:100%;
		}
		.mission .right h1{
		   text-align:center;
		   color:#1EADFF;
		   margin:0 0 20px 0;
		}
		.mission .right hr{
		   width:35%;
		   border-top:2px solid #000;
		   border-bottom:none;
		}
		.mission .right p{
		   font-size:1rem;
		   margin:40px auto;
		   width:80%
		}
		
		
		.team{
		   width:90%;
		   margin:auto;
		   padding:5% 5%;
		   over-flow:hidden;
		}
		.team h1{
		   text-align:center;
		   color:#1EADFF;
		   
		}
		.team h1 hr{
		   width:15%;
		   border-top:2px solid #000;
		   background-color:transperant;
		   border-bottom:none;
		   margin-bottom:50px;
		}
		.team .card{
		   padding-bottom:20px;
		   padding-top:20px;
		   position:relative;
		   min-width:20%;
		   height:500px !important;
		   height:auto;
		   background-color:#fff;
		   display:inline-block;
		   margin:40px 6.5%;
		   box-shadow: 0 0 20px 2px rgba(0,0,0,0.5);
		   text-align:center;
		}
		.card .circle-container{
		   position:relative;
		   background-color:rgb(255, 171, 0);
		   width:250px;
		   height:250px;
		   border:none;
		   border-radius:50%;
		   margin:auto;
		   color:#fff;
		}
		.circle-container h1{
		   position:absolute;
		   top:50%;
		   left:50%;
		   transform:translate(-50%,-50%);
		   margin:0;
		   font-size:60px;
		}
		
		.team .card h2{
		   text-align:center;
		   margin:30px 0 0 0;
		}
		.team .card h4{
		   text-align:center;
		   margin:10px 0 0 0;
		}
		.team .card p{
		   width:250px;
		   margin:30px auto;
		   text-align:center;
		
		}
		.clear{
		    clear: both;			
		}
		
		footer{
		   width:100%;
		   height:100px;
		   background-color:rgb(255, 171, 0);
		}
		footer p{
		   text-align:center;
		   padding: 0 2% ;
		}
				
		/* media */
		@media(max-width:1200px){
		   .mission .right p{
		      font-size:.8rem;
		      margin:20px auto;
		   }
		   .about .left p{
		      font-size:.8rem;
		      margin:20px auto;
		   }
		}
		
		@media(max-width:992px){
		   .about .left{
		   width:100%; 
		}
		   .about .right{
		   width:100%; 
		}
		      .mission .left{
		   width:100%; 
		}
		   .mission .right{
		   width:100%; 
		}
		   .team .card{ 
		   width:40%;
		}   
		}
		
		@media(max-width:768px){
		      .team .card{ 
		   width:100%;
		} 
		   nav{
		      height:80px;
		   }
		}


</style>
</head>
<body>
<%@include file="components/navbar.jsp" %> 
<%@include file="components/common_modals.jsp" %>


<div class="container">
   
   <div class="about">
      <div class="left">
         <h1>About us</h1>
         <hr>
         <p><b>It is not just about ideas, it's also about making ideas happen</b><br><br>
We have witnessed the fall of a number of enterprises, in the wake of
The global pandemic, covid-19. People, in multitudes, have lost the
Security and comfort of their jobs, and have been left to fend for
themselves. But in these miserable times, we have seen a number of
Entrepreneurs rise up. Homemade masks, sweets and many other
Similar small business have taken birth. This project aims to provide
These new entrepreneurs with a platform to widen their reach..</p>

                 

      </div>
      <div class="right">
         <img src="https://i.pinimg.com/originals/a4/32/e6/a432e67a3789a9ec38d87fd0aef7758a.jpg">
      </div>
      <div class="clear"></div>
   </div>
   
   
   
   <div class="mission">
     
      <div class="left">
         <img src="https://bsmedia.business-standard.com/_media/bs/img/article/2019-07/07/full/1562507245-8559.jpg">
      </div>
        <div class="right">
         <h1>Mission Statement</h1>
         <hr>
         <p>Most of these enterprises are operating from peoples homes. A
Majority of the entrepreneurs are women. In almost all cases, the
Production, management, book-keeping etc is being done by only one
Person. This project will take the burden of management, off the

Shoulders of the entrepreneurs. Their only job would be maintaining
/ improving production quality.</p>

                 

      </div>
      <div class="clear"></div>
      
   </div>
   
   
  
       <div class="team">
      <h1>Our Team</h1>
          
          
          
      <div  class="card m-2">
         <div class="circle-container">
            <h1 style="color:#fff;">J</h1>
         </div>
         <h2>Jesica Dsouza</h2>
         <h6>8933 SE COMPS B</h6>
         
      </div>
          
          
          
      <div class="card m-2">
         <div class="circle-container">
            <h1 style="color:#fff;">S</h1>
         </div>
         <h2>Sakshi Shetty</h2>
         <h6>8972 SE COMPS B</h6>
          
      </div>
          
          
          
      <div class="card m-2">
         <div class="circle-container">
            <h1 style="color:#fff;">A</h1>
         </div>
         <h2>Ameaza Rodrigues</h2>
         <h6>8967 SE COMPS B</h6>
         
      </div>
          
          
   </div>

   
</div>
<footer>
   <br>
   <p>Copyright ©2020 @@@@@@@@. All rights reserved</p>
</footer>
</body>
</html>