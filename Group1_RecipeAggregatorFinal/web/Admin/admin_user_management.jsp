<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin User Management</title>
    <style>
        body{
            font-family: Arial;
            color: black;
            background-color: #e1fce8;
            line-height: 1.5;
            text-align: center;
        }
        ul {
            display: table;
            margin: auto;
        }
        input[type=submit] {
            width: 150px;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin: auto;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        
    </style>
</head>
<body>
    <h2>Manage Users</h2>

    <h3>Existing Users</h3>
    <ul>
        <c:forEach var="user" items="${users}">
            <li>
                ${user.username} (${user.role}) 
                <form action="do.getrecipemanager" method="POST" style="display:inline;">
                    <input type="hidden" name="userId" value="${user.id}">
                    <input type="submit" name="action" value="Delete this User">
                    <input type="submit" name="action" value="Promote to Admin">
                </form>
            </li>
        </c:forEach>
    </ul>
</body>
</html>