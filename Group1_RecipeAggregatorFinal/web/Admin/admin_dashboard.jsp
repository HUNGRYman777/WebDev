<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link rel ="stylesheet" href ="../newcss.css">
</head>
<body>
    <h2>Admin Dashboard</h2>
    
    <h3>System Statistics</h3>
    <p>Total Users: ${totalUsers}</p>
    <p>Total Recipes: ${totalRecipes}</p>
    
    <a href="admin_recipe_management.jsp">Manage Recipes</a><br>
    <a href="admin_user_management.jsp">Manage Users</a><br>
    <a href="admin_reports.jsp">Manage Reports</a><br>

    <h3>Recent Activity</h3>
    <ul>
        <c:forEach var="activity" items="${recentActivities}">
            <li>${activity}</li>
        </c:forEach>
    </ul>
</body>
</html>