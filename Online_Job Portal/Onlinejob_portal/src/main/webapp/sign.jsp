<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up - Job Portal</title>
    <%@ include file="All_component/Allcss.jsp"%>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<%@ include file="All_component/navbar.jsp"%>
     <div class="container  d-flex justify-content-center align-items-center " style="height: 90vh; ">
        <div class="card "  style="width: 35%;">
            <div class="card-body ">
                <h5 class="card-title text-center">Ragisteration</h5>
                
                <c:if test="${not empty succMsg}">
                <h4 class="text-center text-success">${succMsg}</h4>
                <c:remove var="sussMsg"/>
                </c:if>
                <form action="adduser" method="post" >
                    <div class="form-group">
                        <label for="name">Name:</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name">
                    </div>
                    <div class="form-group">
                        <label for="qualification:">Qualification:</label>
                        <input type="qualification:" class="form-control" id="qualification:" placeholder="Enter your Qualification:" name="que">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email" name="email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password:</label>
                        <input type="password" class="form-control" id="password" placeholder="Enter your password" name="ps">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
                      <p class="login-link text-center">Already have an account? <a href="login.jsp">Login</a></p>
    
                </form>
            </div>
        </div>
    </div>
    
                      
</body>
</html>
