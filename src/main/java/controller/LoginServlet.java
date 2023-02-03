package controller;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDAO;
import model.Account;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		try {
			request.getSession(true).invalidate();
			// make sure that email is valid
			String regexMail = "^[A-Z0-9_a-z]+@[A-Z0-9\\.a-z]+\\.[A-Za-z]{2,6}$";
			String regex = "[a-zA-Z0-9_!@#$%^&*]+";
			// collect data from a login form
			String user = request.getParameter("username");
			String password = request.getParameter("password");
			String remember = request.getParameter("remember");
			
			Account acc = new Account();
			acc.setName(user);
			acc.setPwd(password);
			
			HttpSession session = request.getSession(true);
			
			// check if password and user matches valid or not
			if(!password.matches(regex) || !user.matches(regexMail)) {
				session.setAttribute("error", "Invalid ");
				response.sendRedirect("login.jsp");
			}
			
			AccountDAO dao = new AccountDAO();
			Account accQuery = dao.getAccount(user);
			
			// read information of account in web.xml
			String uid = accQuery.getUsr();
			String pwd = accQuery.getPwd();
			
			// check account - use validate code in assignment 1 to valid user
			if(user != null && acc.getPwd().equals(pwd) && acc.getName().equalsIgnoreCase(uid)) {
				// set session
				session.setAttribute("user", accQuery);
				
				// Add cookie
				if (request.getParameter("remember") != null) {
					Cookie cookieUname = new Cookie("cookUsename", user);  
					Cookie cookieRemember = new Cookie("cookRememeber", remember);
					cookieUname.setMaxAge(1200);
					response.addCookie(cookieUname);
					response.addCookie(cookieRemember);
				} else {
					Cookie cookieUname = new Cookie("cookUsename", null);  
					Cookie cookieRemember = new Cookie("cookRememeber", null);
					cookieUname.setMaxAge(0);
					cookieRemember.setMaxAge(0);
					response.addCookie(cookieUname);
					response.addCookie(cookieRemember);
				}
				
				// login is valid, now redirect to index page of admin
				if(accQuery.getRole() == 1) {
					response.sendRedirect("admin/index.jsp");
				}
				response.sendRedirect("home");
			} else {
				session.setAttribute("error", "Wrong username or password");
				response.sendRedirect("login.jsp");
			}
			
		} catch (NullPointerException e) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		} catch (Exception ex) {
			response.getWriter().println(ex);
		}
	}
    
}
