


<%@page import="org.apache.naming.java.javaURLContextFactory"%>
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
<%@ include file="All_component/navbar.jsp" %>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5 class="text-center text-primary mt-4">All jobs</h5>
            <c:if test="${not empty succMsg}">
                <div class="alert alert-success" role="alert">
                    ${succMsg}
                    <c:remove var="succMsg" />
                </div>
            </c:if>

            <div class="card">
                <div class="card-body">
                    <form class="form-inline" action="more_view.jsp" method="get">
                        
                        <div class="form-group col-md-5 mt-1">
                            <h5>Location</h5>
                        </div>
                            
                        <div class="form-group col-md-4 mt-1">
                            <h5>Category</h5>
                        </div>
                        
                        <div class="form-group col-md-5">
                            <select name="loc" class="custom-select" id="inlineFormCustomSelectPref" style="width: 200px;">
                                <option selected value="lo">choose...</option>
                                <option value="pune">Pune</option>
                                <option value="Mumbai">Mumbai</option>
                                <option value="Banguluru">Banguluru</option>
                                <option value="Hydrabad">Hydrabad</option>
                            </select>
                        </div>

                        <div class="form-group col-md-5">
                            <select name="cat" class="custom-select" id="inlineFormCustomSelectPref" style="width: 200px;">
                                <option selected value="ca">choose...</option>
                                <option value="It">It</option>
                                <option value="Devloper">Devloper</option>
                                <option value="Banking">Banking</option>
                                <option value="Teacher">Teacher</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-success">Submit</button>
                      
                    </form>
                </div>
            </div>
        

                 <%
                    JobDAO dao = new JobDAO(DBconnect.getConn());
                    List<Jobs> list1 = dao.getAllJobsForUser();
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
                            <a href="one_view.jsp?id="${j.getId()}" class="btn btn-sm bg-success text-white">View more</a>
                        	<a href="Apply.jsp?id="${j.getId()}" class="btn btn-sm bg-success text-white">Apply</a>
                        </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>

