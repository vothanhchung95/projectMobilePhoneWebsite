<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Product</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="container mx-auto mt-3" style="margin-bottom: 40px;">
		<h4 class="mb-3 pb-3 border-bottom border-warning">${product.name}</h4>
		<div class="container row mt-3" >
			<div class="col-sm-4 p-3">
				<img alt="${product.name}" src="${product.src}" class="img-fluid">
			</div>
			<div class="col-sm-4 p-3">
				<h2 class="text-danger">${product.price} USD</h2>
				<p>${product.description}</p>
				<form class="mt-3 pt-3" action="${pageContext.request.contextPath}/AddToCartController?action=add&id=${product.id}" method="post">
					<button
							class="btn btn-warning"
							style="padding:6px 12px;"
							type="submit" value="Go">
							<p class="text-dark text-center font-weight-bold m-0">Add to Cart</p>
							
						</button>
				
				</form>
			</div>
			<div class="col-sm-4 ">
				
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp"%>	
</body>
</html>