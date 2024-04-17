package com.Servlet;
import com.DB.*;
import com.Entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.UserDAO;


@WebServlet("/adduser")
public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String name =request.getParameter("name");	
			String que =request.getParameter("que");	
			String email =request.getParameter("email");	
			String ps =request.getParameter("ps");	
			
			
			UserDAO dao =new UserDAO(DBconnect.getConn());
			
			User u=new User(name,email,ps,que,"User");
			
			boolean f= dao.addUser(u);
			
			HttpSession session =request.getSession();
			
			if(f)
			{
				session.setAttribute("sussMSg","Registration sucessfully");
				response.sendRedirect("sign.jsp");
				
			}
			else {
				session.setAttribute("sussMSg","Something went wrong");
				response.sendRedirect("sign.jsp");
					
			}
		}catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
	}
}
