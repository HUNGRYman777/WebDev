<%-- 
    Document   : login
    Created on : 10 6, 24, 5:56:07 PM
    Author     : jverceles
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link rel ="stylesheet" href ="../newcss.css">
</head>
<body>
    <h2>Login</h2>
    <form action="../do.login" method="POST">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required><br><br>
        
        <input type="submit" value="Login">
    </form>
    <br>
    <a href="register.jsp">New User? Register here</a><br><br>
    <a href ="index.jsp">Go to Index</a><br><br>
    ${param.error}
    ${param.success}
</body>
</html>