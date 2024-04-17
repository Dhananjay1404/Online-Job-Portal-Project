<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dao.JobDAO" %>
<%@ page import="com.DB.DBconnect" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.Entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User: View jobs</title>
    <%@ include file="All_component/Allcss.jsp" %>
</head>
<body style="background-color: #f0f1f2">

<%@ include file="All_component/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5 class="text-center text-primary">All jobs</h5>
            <%
            String loc = request.getParameter("loc");
            String cat = request.getParameter("cat");
            out.print(loc);
            String msg = "";
            List<Jobs> list = new ArrayList<>();

            JobDAO dao = new JobDAO(DBconnect.getConn());

            if ("lo".equals(loc) && "ca".equals(cat)) {
                msg = "No jobs available for the selected location and category.";
            } else {
                list = dao.getJobsORLocationAndCat(cat, loc);
               
            }
            
           
            List<Jobs> list1 = dao.getAllJobs();
            request.setAttribute("list1", list1);
            
            %>

            <%-- Check if the list is empty --%>
            <c:if test="${empty list}">
                <h4 class="text-center text-danger">${msg}</h4>
            </c:if>

            <%-- Iterate over the list using for loop if it's not empty --%>
            <% if (list != null && !list.isEmpty()) {
                for (int i = 0; i < list.size(); i++) {
                    Jobs job = list.get(i);
            %>
                    <div class="card mt-5">
                        <div class="card-body border-0 ml-3">
                            <div class="text-center text-primary">
                                <i class="fa-regular fa-clipboard display-4"></i>
                            </div>
                            <h6> Job title :- <%= job.getTitle() %></h6>
                            <p><%= job.getDescription() %></p>
                            <br>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" value="<%= job.getCompany_name()%>" class="form-control from-contro-sm" readonly>
                                </div>
                                
                                <div class="form-group col-md-3">
                                    <input type="text" value="<%= job.getLocation() %>" class="form-control from-contro-sm" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text"  value="<%= job.getCategory() %>" class="form-control from-contro-sm" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text"  value="<%= job.getSatus() %>" class="form-control from-contro-sm" readonly>
                                </div>
                            </div>
                            <h6>Public date <%= job.getPdate()%></h6>
                            <div class="text-center">
                                <a href="one_view.jsp?id=<%= job.getId() %>" class="btn btn-sm bg-success text-white">View Details</a>
                            </div>
                        </div>
                    </div>
            <% }
            } %>
        </div>
    </div>
</div>
</body>
</html>


