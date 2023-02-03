<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="./css/style.css" rel="stylesheet" type="text/css">
<title>Home</title>
</head>
<body>


	<%@ include file="header.jsp"%>

	<div class="container d-flex row mx-auto"
		style="margin-bottom: 10px; margin-top: 30px;">

		<c:forEach items="${products}" var="i">

			<div class="col-6 col-lg-4">
				<a style="text-decoration: none;"
					href="InformationProductController?id=${i.id}">
					<div class="card box-shadow" style="margin-bottom: 30px">
						<div class="align-self-center mb-4 mt-4">
							<img alt="iPhone" class="product-img align-self-center"
								src="${i.src}">
							<p class="text-secondary mb-1">CELL PHONE</p>
							<p class="text-info font-weight-bold mb-2">${i.name}</p>
							<p class="text-danger font-weight-bold">$${i.price}</p>
						</div>
					</div>

				</a>
			</div>

		</c:forEach>

	</div>
	<div class="container" style="margin-bottom: 20px;">
		<div class="d-flex justify-content-center">

			<c:if test="${end > 1}">
			<nav aria-label="pagination">

					<ul class="pagination">
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?index=1&search=${search}"
							tabindex="-1">Previous</a></li>
					
					<c:forEach begin="1" end="${end}" var="i">
						<li class="page-item"><a class="page-link"
								href="${pageContext.request.contextPath}/home?index=${i}&search=${search}">${i}</a></li>
					
					</c:forEach>
					
					
					<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/home?index=2&search=${search}">Next</a></li>
				</ul>
			
			</nav>
			</c:if>
			
				</div>
		</div>
	<%@ include file="footer.jsp"%>
</body>
</html>