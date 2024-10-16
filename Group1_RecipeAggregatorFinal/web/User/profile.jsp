<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <link rel ="stylesheet" href ="../newcss.css">
</head>
<body>
    <h2><%= session.getAttribute("username") %>'s Profile</h2>
    <p><strong>Following:</strong> <%= session.getAttribute("following") %></p>
    <p><strong>Followers:</strong> <%= session.getAttribute("followers") %></p>
    
    <h3>Liked Recipes</h3>
    

    <a href="user-following.jsp">View Following</a><br><br>
    <a href ="../do.logout">Logout</a>
</body>
</html>