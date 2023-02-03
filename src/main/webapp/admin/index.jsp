<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Admin page</title>
</head>
<body>
	
	<div class="row">
	
		<div class="col-sm-2" style="background-color: #222f3c;">
			<div >
				<h4 class="text-warning text-center font-weight-bold" style="padding-top: 60px; padding-bottom: 60px">1849 TEAM</h4>
				
				<%@page import="model.*" %>
		
				
				<h5 class="text-light text-center font-weight-bold" style="padding-bottom: 30px">Welcome<br/><br/>${user.name}</h5>
				<div class="d-flex justify-content-center pb-3"><a href="../home" class="text-light"><i class="fas fa-home pr-2"></i>Home</a>
				</div>
				
				<div class="d-flex justify-content-center" style="padding-top: 30px">
					<form action="../LogoutController" method="get">
						<button type="submit" class="btn btn-danger text-light align-self-center" >Log out</button>
					</form>
				</div>
			</div>
		
		</div>
	
		<div class="col-sm-10 pl-0">
			<div >
				<img alt="cover" src="./cover.png" style="height: 300px; width: 1300px; object-fit: cover">
			</div>
			<div style="padding:120px">
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col">Order ID</th>
				      <th scope="col">Customer Email</th>
				      <th scope="col">Status</th>
				      <th scope="col">Discount code</th>
				      <th scope="col">Address</th>
				      <th scope="col">Phone</th>
				    </tr>
				  </thead>
				  <tbody>
				    <tr>
				      <th scope="row">1</th>
				      <td>Member 1</td>
				      <td>-</td>
				      <td>Discount code 1</td>
				      <td>Address 1</td>
				      <td>Phone 1</td>
				    </tr>
				    <tr>
				      <th scope="row">2</th>
				      <td>Member 2</td>
				      <td>-</td>
				      <td>Discount code 2</td>
				      <td>Address 2</td>
				      <td>Phone 2</td>
				    </tr>
				    <tr>
				      <th scope="row">3</th>
				      <td>Member 3</td>
				      <td>-</td>
				      <td>Discount code 3</td>
				      <td>Address 3</td>
				      <td>Phone 3</td>
				    </tr>
				  </tbody>
				</table>
			
			</div>
		
		</div>
	
	
	
	</div>
	
</body>
</html>