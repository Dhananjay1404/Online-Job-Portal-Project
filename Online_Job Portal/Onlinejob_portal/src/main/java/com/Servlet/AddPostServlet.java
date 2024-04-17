package com.Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.DB.DBconnect;
import com.Entity.Jobs;
import com.Entity.User;
import com.dao.JobDAO;
@WebServlet("/addjob")
public class AddPostServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	

		try {
			String ti=req.getParameter("title");
			String ds=req.getParameter("description");
			String cn=req.getParameter("company-name");
			String loc=req.getParameter("Location");
			String cat=req.getParameter("Category");
			String sat=req.getParameter("Status");

			
			Jobs j=new Jobs();
			j.setDescription(ds);
			j.setTitle(ti);
			j.setCompany_name(cn);
			j.setLocation(loc);
			j.setCategory(cat);
			j.setSatus(sat);
			System.out.print(j.getCompany_name());

			HttpSession session=req.getSession();			
			JobDAO jd=new JobDAO(DBconnect.getConn());
			System.out.print(j.getCompany_name());
			
			boolean	d=jd.addjob(j);
			
			if(d)
			{
				session.setAttribute("succMsg","job post sussesfully.....");
				res.sendRedirect("add_job.jsp");
			}
			else {
				session.setAttribute("succMsg","Something wrong.....");
				res.sendRedirect("add_job.jsp");

				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();	
			}
	}
}
		
		
