




<%@page import="com.DB.DBconnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.Entity.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Edit jobs</title>
<%@ include file="All_component/Allcss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">





	<%@ include file="All_component/navbar.jsp"%>

	<div class="container p-2 p-center">
		<form action="update" method="POST">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-body">
							<div class="text-center text-success">
								<i class="fas fa-user-friends fa-3x"></i>
								
								<% int id=Integer.parseInt(request.getParameter("id"));
								JobDAO dao=new JobDAO(DBconnect.getConn());
								Jobs j=dao.getJobById(id);%>
								
								<h5>Edit  jobs</h5>
							</div>
							
							<input type="hidden" value="<%= id%>" name="id">

							<div class="form-group">
								<label for="job-title">Enter Title:</label> <input type="text"
									id="job-title" name="title" required class="form-control" value="<%=j.getTitle()%>">
							</div>

							<div class="form-group">
								<label for="company-name">Company Name:</label> <input
									type="text" id="company-name" value="<%=j.getCompany_name()%>" name="company-name" required
									class="form-control">
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="job-location">Job Location:</label> <select
										id="job-location" class="custom-select" name="Location">
										<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
										<option value="Pune">Pune</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Hyderabad">Hyderabad</option>
										<option value="Bangalore">Bangalore</option>
									</select>
								</div>

								<div class="form-group col-md-4">
									<label for="job-category">Category:</label> <select
										id="job-category" class="custom-select" name="Category">
										<option value="<%=j.getCategory() %>"><%=j.getCategory() %></option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
									</select>
								</div>

								<div class="form-group col-md-4">
									<label for="job-status">Status:</label> <select id="job-status"
										class="custom-select" name="Status">
										
										<option value="<%=j.getSatus() %>"><%=j.getSatus()%></option>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="job-description">Job Description:</label>
								<textarea id="job-description" name="description"
									class="form-control" ><%=j.getDescription()%></textarea>
							</div>

							<div class="text-right">
								<button type="submit" class=" btn btn-success ">Update job</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>

</html>
