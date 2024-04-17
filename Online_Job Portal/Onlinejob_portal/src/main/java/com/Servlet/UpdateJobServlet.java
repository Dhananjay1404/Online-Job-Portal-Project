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
import com.Entity.Jobs;
import com.dao.JobDAO;

@WebServlet("/update")
public class UpdateJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


		
		
		try {
			int id=Integer.parseInt(req.getParameter("id"));
			
			String ti=req.getParameter("title");
			String ds=req.getParameter("description");
			String cn=req.getParameter("company-name");
			String loc=req.getParameter("Location");
			String cat=req.getParameter("Category");
			String sat=req.getParameter("Status");
			
			Jobs j=new Jobs();
			j.setId(id);
			j.setDescription(ds);
			j.setTitle(ti);
			j.setCompany_name(cn);
			j.setLocation(loc);
			j.setCategory(cat);
			j.setSatus(sat);
			System.out.println(j);
			System.out.print(j.getCompany_name());
		

						
			JobDAO jd=new JobDAO(DBconnect.getConn());
			System.out.print(j.getCompany_name());
			
			boolean	d=jd.updateJob(j);
			
			if(d)
			{
				
				resp.sendRedirect("View_job.jsp");
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
	}	
	
}
