<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Register</title>
    <link rel ="stylesheet" href ="../newcss.css">
</head>
<body>
    <h2>Register</h2>
    <form action="../do.register" method="POST">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required><br><br>
        
        <input type="submit" value="Register">
    </form>
    <br>
    <a href="login.jsp">Already have an account? Login here</a><br><br>
    <a href ="../index.jsp">Go to Index</a><br><br>
    ${param.error}
</body>
</html>