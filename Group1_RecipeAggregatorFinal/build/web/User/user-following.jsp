<%-- 
    Document   : user-following.jsp
    Created on : 10 8, 24, 3:02:13 PM
    Author     : Ramon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Following</title>
        <link rel ="stylesheet" href ="../newcss.css">
    </head>
    <body>
        <h1>You are following: </h1>
        <ul>
            <c:forEach var="comment" items="">
                <li><strong><a href="profile.jsp"><%= session.getAttribute("username") %></a></strong></li>
            </c:forEach>
        </ul>
    </body>
</html>
