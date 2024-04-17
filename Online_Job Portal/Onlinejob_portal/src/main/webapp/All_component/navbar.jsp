<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Portal</title>
    <!-- Include Bootstrap CSS and Font Awesome CSS if needed -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha512-/MnCf9ztZ8KK9/ZCt7LGDj/+6+P7d/MEGXC2Dt6w/DpZvOuSBYVvEf1cB4PgJWK7ALsnjwGkn9AwfTB4J04Rlw==" crossorigin="anonymous" />
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Job Portal</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      
      </li>
      
      <c:if test="${userobj.role eq 'admin'}">
        <li class="nav-item">
          <a class="nav-link" href="add_job.jsp"><i class="fas fa-plus-circle" ></i>Post Job</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="View_job.jsp"><i class="fas fa-eye"></i>View Job</a>
        </li>
      </c:if>
     <!-- <c:if test="${not empty userobj}">
      	<li>
      		<a class="list-group-" href="home.jsp">Apply Jobs <span class="sr-only">(current)</span></a>
      	</li>
      </c:if>- -->
      
    </ul>
    
    <c:choose>
      <c:when test="${userobj.role eq 'admin'}">
        <form class="form-inline my-2 my-lg-0">
          <a href="index.jsp" class="btn btn-success  mr-1">Admin</a>
          <a href="logout" class="btn btn-success ml-2">Logout</a>
        </form>
      </c:when>
      
      <c:when test="${not empty userobj}">
        <form class="form-inline my-2 my-lg-0">
          <a href="home.jsp" class="btn btn-success  mr-1">User</a>
          <a href="logout" class="btn btn-success ml-2">Logout</a>
        </form>
      </c:when>
      
      <c:otherwise>
        <form class="form-inline my-2 my-lg-0">
          <a href="login.jsp" class="btn btn-success  mr-1">Login</a>
          <a href="sign.jsp" class="btn btn-success ml-2">Signup</a>
        </form>
      </c:otherwise>
    </c:choose>
  </div>
</nav>

<!-- Include jQuery and Bootstrap JS if needed -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-5/CI6GkxiL6Ijg8P5HmP5DnxfNq0uH04i1ln2Ysv4Cqfm3Xnn/1FdDqn6vNTWIwY" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shCk+5L4Zda7I5205H0tuP2hkss0pVzc1Jwfo" crossorigin="anonymous"></script>

</body>
</html>
