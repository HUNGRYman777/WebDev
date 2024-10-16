<%-- 
    Document   : index
    Created on : 10 7, 24, 6:37:47 PM
    Author     : Ramon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel ="stylesheet" href ="newcss.css">
    </head>
    <body>
        <h1>Welcome to the Recipe Aggregator!</h1>
        <a href="User/login.jsp">Login Here</a><br><br>
        <a href="User/register.jsp">Register Here</a><br><br>
        <a href ="do.logout">Logout</a><br><br>
        ${param.msg}
    </body>
</html>
