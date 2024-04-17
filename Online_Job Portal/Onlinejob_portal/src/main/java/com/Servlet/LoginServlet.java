package com.Servlet;
import com.DB.*;
import com.dao.*;
import com.Entity.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import com.Entity.User;

@WebServlet("/login")

public class LoginServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		
		try {
			String em=req.getParameter("email");
			String ps=req.getParameter("password");
			
			User u=new User();
			HttpSession session=req.getSession();
			
			if("admin@gmail.com".equals(em) && "admin@123".equals(ps))
			{
					session.setAttribute("userobj",u);
					u.setRole("admin");
					res.sendRedirect("admin.jsp");
			}else {
				UserDAO dao =new UserDAO(DBconnect.getConn());
				User user=dao.login(em,ps);
				if(user !=null)
				{
					session.setAttribute("userobj", user);
					res.sendRedirect("index.jsp");
				}
				else 
				{
					session.setAttribute("sussMsg","Invalid user and pass");
					res.sendRedirect("login.jsp");	
				}	
			}		
		}
		catch(Exception e){
			
	
		}
		
		
	}

	
}
