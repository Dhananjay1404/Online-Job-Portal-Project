<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@ include file="All_component/Allcss.jsp"%>


</head>
<body>
	<%@ include file="All_component/navbar.jsp"%>
	

    <div class="login-container">
        <form action="login" method="POST" class="login-form">
            <h2>Login</h2>
            <div class="input-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <button type="submit" class="login-btn">Login</button>
            <div class="signup-link">
                <p>Don't have an account? <a href="Singup.jsp">Sign Up</a></p>
            </div>
        </form>
    </div>

	

</body>
</html>