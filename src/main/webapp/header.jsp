<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="/css/style.css" rel="stylesheet" type="text/css">
<title>Header</title>
</head>
<body>

	<div class="navbar navbar-dark flex row"
		style="background-color: #222f3c">
		<div class="col-sm-2">
			<h4 class="inline-block text-light"
				style="font-weight: bold; margin-top: 16px">PRJ321x</h4>
			<p class="text-primary">Welcome to my Website</p>
		</div>

		<div class="col-sm-10">
			<form class="justify-content-center" name="searchForm"
				action="${pageContext.request.contextPath}/SearchController?index=1"
				method="post">
				<div class=" d-flex  ">
					<div class="dropdown ">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							style="border-top-right-radius: 0px; border-bottom-right-radius: 0px"
							role="button" id="dropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">Categories</a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item" href="#">iPhone X</a> <a
								class="dropdown-item" href="#">iPhone XS </a> <a
								class="dropdown-item" href="#">iPhone 11</a>
						</div>
					</div>

					<div class="flex-grow-1 col-sm-8" style="padding: 0px">
						<input class="form-control" type="text" name="search"
							style="border-top-left-radius: 0px; border-bottom-left-radius: 0px; border-top-right-radius: 0px; border-bottom-right-radius: 0px"
							placeholder="What are you looking for?" aria-label="Search" />

					</div>
					<div>
						<button
							class="btn btn-warning my-2 my-sm-0 align-items-center d-flex"
							style="padding: 6px; border-top-left-radius: 0px; border-bottom-left-radius: 0px"
							type="submit" value="Go">
							<i class="fas fa-search"
								style="align-self: center; width: 24px; height: 24px;"></i>
						</button>
					</div>


				</div>
			</form>
		</div>


	</div>

	<div class="navbar navbar-dark bg-dark navbar-expand-lg row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8 mr-auto d-flex justify-content-between">
			<div class=" d-flex col-sm-6 pl-0">
				<div class="pr-3 ">
					<a href="home" class="text-light">Home</a>
				</div>
				<div class="pr-3">
					<a href="#" class="text-light">Products</a>
				</div>
				<div class="pr-3">
					<a href="#" class="text-light">About us</a>
				</div>

			</div>
			
				<c:if test="${user == null}">
				<div class=" d-flex mr-auto col-sm-6 justify-content-end">
					<div class="pr-3">
						<a href="login.jsp" class="text-light" style="padding-right: 20px">Log
							in</a>
					</div>
					<div class="">
						<a href="register.jsp" class="text-light">Register</a>
					</div>
				</div>
				</c:if>
				
				<c:if test="${user != null}">
				<div class=" d-flex mr-auto col-sm-6 pl-3 justify-content-end">
					<div class="mb-0 pr-4">
					<a href="cart.jsp">
						<p class="text-light mb-0"><i class="fas fa-user-circle pr-2"></i>${user.name}</p>
					</a>
					</div>
					<div class="">
					<form action="./LogoutController" method="post">
						<button class="text-light" style="border: none; background: none" type="submit"><i class="fas fa-sign-out-alt pr-2"></i></i>Log out</button>
					</form>
					</div>
					
				</div>
				</c:if>
			


		</div>
		<div class="col-sm-2"></div>

	</div>

</body>
</html>