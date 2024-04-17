<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.dao.JobDAO" %>
<%@ page import="com.DB.DBconnect" %>
<%@ page import="java.util.List" %>
<%@ page import="com.Entity.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User: single job</title>
    <%@ include file="All_component/Allcss.jsp" %>
</head>
<body style="background-color: #f0f1f2">

<c:if test="${empty userobj }">
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@ include file="All_component/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <%
                int id = 0; // Default value for id
                String idParam = request.getParameter("id");
                		
                if (idParam != null && !idParam.isEmpty()) {
                    try {
                        id = Integer.parseInt(idParam);
                    } catch (NumberFormatException e) {
                        // Handle invalid id parameter, such as logging the error or providing a default value
                        e.printStackTrace(); // This line will print the error stack trace to the server logs
                    }
                }

                JobDAO dao = new JobDAO(DBconnect.getConn());
                Jobs j = dao.getJobById(id);
            %>
            <div class="card mt-5">
                <div class="card-body border-0 ml-3">
                    <div class="text-center text-primary">
                        <i class="fa-regular fa-clipboard display-4"></i>
                    </div>
                    <p><%= j.getDescription() %></p>
                    <br>
                    <div class="form-row">
                        <div class="form-group col-md-3">
                          <input type="text" value="<%= j.getCompany_name() %>" class="form-control from-contro-sm" readonly>
                        </div>
                        <div class="form-group col-md-3">
                            <input type="text" value="<%= j.getLocation() %>" class="form-control from-contro-sm" readonly>
                        </div>
                        <div class="form-group col-md-3">
                            <input type="text"  value="<%= j.getCategory() %>" class="form-control from-contro-sm" readonly>
                        </div>
                        <div class="form-group col-md-3">
                            <input type="text"  value="<%= j.getSatus() %>" class="form-control from-contro-sm" readonly>
                        </div>
                    </div>
                    <h6>Public date <%= j.getPdate().toString()%></h6>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
