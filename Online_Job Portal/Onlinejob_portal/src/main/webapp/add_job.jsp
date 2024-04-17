

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Add jobs</title>
<%@ include file="All_component/Allcss.jsp"%>
</head>

<body style="background-color: #f0f1f2;">

	<%@ include file="All_component/navbar.jsp"%>

	<div class="container p-2 p-center">
		<form action="addjob" method="POST">
			<div class="row justify-content-center">
				<div class="col-md-8">
					<div class="card">
						<div class="card-body">
							<div class="text-center text-success">
								<i class="fas fa-user-friends fa-3x"></i>
								
								<c:if test="${not empty succMsg}">
     								<div class="alert aleart-success" role="alert">${succMsg }
     								<c:remove var="succMsg"/>
     								</div>
      								 
										</c:if>
								
								
								<h5>Add jobs</h5>
							</div>

							<div class="form-group">
								<label for="job-title">Enter Title:</label> <input type="text"
									id="job-title" name="title" required class="form-control">
							</div>

							<div class="form-group">
								<label for="company-name">Company Name:</label> <input
									type="text" id="company-name" name="company-name" required
									class="form-control">
							</div>

							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="job-location">Job Location:</label> <select
										id="job-location" class="custom-select" name="Location">
										<option selected>Choose...</option>
										<option value="Pune">Pune</option>
										<option value="Mumbai">Mumbai</option>
										<option value="Hyderabad">Hyderabad</option>
										<option value="Bangalore">Bangalore</option>
									</select>
								</div>

								<div class="form-group col-md-4">
									<label for="job-category">Category:</label> <select
										id="job-category" class="custom-select" name="Category">
										<option selected>Choose...</option>
										<option value="IT">IT</option>
										<option value="Developer">Developer</option>
										<option value="Banking">Banking</option>
										<option value="Engineer">Engineer</option>
									</select>
								</div>

								<div class="form-group col-md-4">
									<label for="job-status">Status:</label> <select id="job-status"
										class="custom-select" name="Status">
										<option selected>Choose...</option>
										<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									</select>
								</div>
							</div>

							<div class="form-group">
								<label for="job-description">Job Description:</label>
								<textarea id="job-description" name="description"
									class="form-control" rows="2" required></textarea>
							</div>

							<div class="text-right">
								<button type="submit" class=" btn btn-success ">Publish</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>

</body>

</html>
