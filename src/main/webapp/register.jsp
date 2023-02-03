<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<title>Sign up</title>
</head>
<body>
	<%@ include file="header.jsp"%>
	<section class="vh-100" style="background-color: #eee;">
  <div class="container h-100">
    <div class="row d-flex justify-content-center align-items-center h-100" style="padding:50px 0;">
      <div class="col-lg-5 col-xl-5">
        <div class="card text-black" style="border-radius: 25px;">
          <div class="card-body p-md-5">
            <div class="row justify-content-center">
              <div class="col-sm-12 order-2 order-lg-1">

                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                <form class="mx-1 mx-md-4" action="RegisterController" method="post">

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-user fa-lg mr-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input name="username" type="text" id="form3Example1c" class="form-control" placeholder="Your name" required/>
                      
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-envelope mr-3 fa-lg fa-fw "></i>
                    <div class="form-outline flex-fill mb-0">
                      <input name="usermail" type="text" id="form3Example3c" class="form-control" placeholder="Your email" required/>
                      
                    </div>
                  </div>

                  

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-key fa-lg mr-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input name="password" type="password" id="form3Example4cd" class="form-control" placeholder="Your password" required/>
                     
                    </div>
                  </div>
                  
                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-phone fa-lg mr-3 fa-fw"></i> 
                    <div class="form-outline flex-fill mb-0">
                      <input name="phone" type="text" id="form3Example4cd" class="form-control" placeholder="Your phone number" required/>
                     
                    </div>
                  </div>

                  <div class="d-flex flex-row align-items-center mb-4">
                    <i class="fas fa-map-marker-alt fa-lg mr-3 fa-fw"></i>
                    <div class="form-outline flex-fill mb-0">
                      <input name="address" type="text" id="form3Example4c" class="form-control" placeholder="Your address" required/>
                    
                    </div>
                  </div>
					<p class="text-danger text-center">
						<%=session.getAttribute("error") != null ? session.getAttribute("error") : ""%>
					</p>
                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                    <button type="submit" class="btn btn-primary btn-lg">Register</button>
                  </div>

                </form>

              </div>
             
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<%@ include file="footer.jsp"%>

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