package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.DB.DBconnect;
import com.dao.JobDAO;

@WebServlet("/delete")
public class DeleteJobServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			PrintWriter out =response.getWriter();
		
		try {
			
			int id=Integer.parseInt(request.getParameter("id"));
			System.out.println();
			JobDAO dao=new JobDAO(DBconnect.getConn());
			boolean f=dao.deleteJobs(id);
		
			
			//HttpSession session=request.getSession();			
			
			
			if(f)
			{
				//session.setAttribute("succMsg","job delete sussesfully.....");
				response.sendRedirect("View_job.jsp");
			}
			else {
				//session.setAttribute("succMsg","Something wrong.....");
				response.sendRedirect("View_job.jsp");	
			}
			
		}catch(Exception e)
		{
		e.printStackTrace();
		
		
		}
	}



}
