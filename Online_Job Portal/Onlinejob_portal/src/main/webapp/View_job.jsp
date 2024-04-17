
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
    <title>View_jobs</title>
    <%@ include file="All_component/Allcss.jsp" %>
</head>
<body style="background-color: #f0f1f2">



    <%@ include file="All_component/navbar.jsp" %>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">All jobs</h5>
             
                
                <%
                    JobDAO dao = new JobDAO(DBconnect.getConn());
                    List<Jobs> list1 = dao.getAllJobs();
                    request.setAttribute("list1", list1);
                %>
                <c:forEach items="${list1}" var="j">
                    <div class="card mt-2">
                        <div class="card body border-0 ml-3">
                            <div class="text-center text-primary">
                                <i class="fa-regular fa-clipboard display-4"></i>
                            </div>
                           
                            <h6> Job title :- ${j.title}</h6>
                            
                            <p>${j.description}</p>
                            <br>
                            <div class="form-row">
                                <div class="form-group col-md-3">
                                    <input type="text" value="${j.company_name}" class="form-control from-contro-sm" readonly>
                                </div>
                                <div class="form-group col-md-3">
                                    <input type="text" value="${j.location}" class="form-control from-contro-sm" readonly>
                                </div>
                                
                                
                                  <div class="form-group col-md-3">
                                    <input type="text"  value="${j.category}" class="form-control from-contro-sm" readonly>
                                    
                                </div>
                              
                                <div class="form-group col-md-3">
                                    <input type="text"  value="${j.satus}" class="form-control from-contro-sm" readonly>
                                    
                                </div>
                                
                                 
                            </div>
                            
                            <h6>Public date <c:out value="${j.pdate}" /></h6>
                                
                            <div class="text-center pb-4">
                                  <a href="edit_jobs.jsp?id=${j.id }"
                                 class="btn btn-sm bg-success text-white">Edit</a>
                                
									 <a href="delete?id=${ j.id}"
                                 class="btn btn-sm bg-danger text-white">Delete</a>                           
                             </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>

