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
<title>Login</title>
</head>
<body>

	<%
		String uname = "", rem = "";
		Cookie [] cookies = request.getCookies();
		
		if(cookies != null) {
			for (Cookie cook: cookies) {
				if(cook.getName().equals("cookUsename")) {
					uname = cook.getValue();
				} else if(cook.getName().equals("cookRememeber")) {
					rem = cook.getValue();
				}
			}
		}
	
	%>


	<div class="row mx-auto container box-shadow p-0" style="margin-top: 100px; width: 720px;box-shadow: 0 20px 30px 0 rgba(0, 0, 0, 0.07);" >
		<div class="col-lg-6 col-12" style="padding: 60px 30px;">
			<h2 class="text-dark font-weight-bold pt-2 pb-2 text-center">Sign in</h2>
			<div>
				
				<form name="loginForm" style="margin: 10px" action="LoginServlet" method="post" onsubmit="return validateForm()">
					<div class="mb-3">
						
						<input name="username" value="<%=uname %>" type="text" class="form-control" id="inputUsername" placeholder="Username">
					</div>
			
					<div class="mb-3">
						
						<input name="password" type="password" class="form-control" id="inputPassword" placeholder="Password">
					</div>
					
					<div class="mb-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" name="remember" id="checkRemember" value="1" 
							<%= "1".equals(rem) ? "checked='/checked'" : "" %>>
							<label class="form-check-label" for="checkRemember">Remember me</label>					
						</div>
					</div>
					
					<div class="mb-3 ">
						<div class="justify-content-between d-flex">
							<button type="submit" class="btn btn-danger text-light">LOGIN</button>
							<a href="#">Forgot password?</a>
						</div>
						<p class="mt-4">Don't have an account? 
						<a href="register.jsp">Create one</a></p>
					</div>
					<p class="text-danger text-center">
						<%=session.getAttribute("error") != null ? session.getAttribute("error") : ""%>
					</p>
					
					<div class="d-flex flex-row align-items-center mb-4">
					<a href="home">
                    	<i style="" class="fas fa-home fa-lg fa-fw "></i> 
                    
                    </a>
                  </div>
					
					
				</form>
			</div>
		</div>
		
		<div class="col-lg-6 col-12 d-flex  align-items-center" style="background-color: #222f3c; padding: 60px 30px;">
			<div class="align-self-center mx-auto">
				<h2 class="text-light text-center font-weight-bold pb-2">Welcome back</h2>
				<h5 class="text-light text-center ">To keep connected with us<br/>please login with your personal<br/>info</h5>
			</div>
		</div>
	
	</div>
	<script type="text/javascript">
		
		function validateForm() {
			 let usernameInput = document.getElementById("inputUsername");
			 let passwordInput = document.getElementById("inputPassword");
			 if (usernameInput.value === "" || passwordInput.value === "") {
				 alert("Please fill out Username and Password");
				 return false;
			 } 
			
		}
	</script>
</body>
</html>