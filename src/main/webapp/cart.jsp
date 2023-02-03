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
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<title>Cart</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container mt-3">
		<h2 class="h2">Shopping Cart</h2>
	</div>
	<div class="row d-flex justify-content-center mx-auto mt-3"
		style="margin-bottom: 40px;">



		<div class="col-lg-7 col-6 h-100 m-3">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col">



					<c:forEach items="${cart.items}" var="c">
						<div class="card mb-4">
							<div class="card-body p-4">

								<div class="row align-items-center">
									<div class="col-md-2">
										<img src="${c.src}" class="img-fluid" alt="">
									</div>
									<div class="col-md-4 d-flex justify-content-center">
										<div>
											<p class="text-dark mb-4 pb-2">Product name</p>
											<h5 class="text-dark mb-0">${c.name}</h5>
										</div>
									</div>

									<div class="col-md-2 d-flex justify-content-center">
										<div>
											<p class="text-dark mb-4 pb-2">Quantity</p>
											<h5 class="text-dark mb-0">${c.number}</h5>
										</div>
									</div>
									<div class="col-md-2 d-flex justify-content-center">
										<div>
											<p class="text-dark mb-4 pb-2">Price</p>
											<h5 class="text-dark mb-0">$${c.price}</h5>
										</div>
									</div>
									<div class="col-md-2 d-flex justify-content-center">
										<div>
											<p class="text-dark mb-4 pb-2">Delete</p>
											<form action="${pageContext.request.contextPath}/AddToCartController?action=delete&id=${c.id}" method="post">
												<button type="submit" class="btn bg-light btn-md ">
													<i class="fas fa-trash-alt text-danger"></i>
												</button>
											</form>
										</div>
									</div>
								</div>

							</div>
						</div>
					</c:forEach>

					<%--- --%>




				</div>
			</div>
		</div>

		<div class="col-lg-3 col-4 h-100 m-3">
			<div
				class="row d-flex justify-content-center align-items-center h-100">

				<div class="col">


					<div class="card mb-4">
						<div class="card-body p-4">

							<div class="row align-items-center mb-3">
								<div class="col">
									<div class="mb-3">
										<p class="text-dark mb-1">Customer name:</p>
										<h5 class="text-dark ">${user.name}</h5>
									</div>

									<div class="mb-3">
										<p class="text-dark mb-1 ">Customer address:</p>
										<h5 class="text-dark ">${user.address}</h5>
									</div>

									<div class="mb-3">
										<p class="text-dark mb-1">Customer phone number:</p>
										<h5 class="text-dark ">${user.phone}</h5>
									</div>

									<div class="mb-3">
										<p class="text-dark mb-1">Total:</p>
										<h5 class="text-dark ">$${cart.amount}</h5>
									</div>


								</div>

							</div>

							<div class="d-flex justify-content-between mb-3">
								<a href="home">
									<button type="button" class="btn btn-secondary btn-md btn-block">
										<i class="fas fa-chevron-circle-left pr-2"></i>Back to Shop
									</button>
								</a>
								<form action="PayController?address=${user.address}&phone=${user.phone}&name=${user.usr}&discount=" method="post">
									<button type="submit" class="btn btn-warning btn-md btn-block">
										<i class="fas fa-shopping-cart pr-2"></i>Order
									</button>
								</form>
							</div>


						</div>
					</div>

				</div>
			</div>

		</div>
	</div>
	</div>
	<%@ include file="footer.jsp"%>
</body>
</html>