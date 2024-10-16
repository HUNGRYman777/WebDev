<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User [ADMINISTRATOR]</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin: auto;
            background-color: white;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        body, h1, p {
            font-family: Arial;
            color: black;
            background-color: #e1fce8;
            line-height: 1.5;
            text-align: center;
        }
        input[type=submit] {
            width: 30%;
            background-color: #4CAF50;
            color: white;
            padding: 5px;
            margin: auto;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        a{
            display: block;
            padding: 10px;
            margin: auto;
            background-color: #8df0a3;
            border: 2px solid black;
            border-radius: 10px;
            width: 200px;
        }
    </style>
</head>
<body>
    <h2>Delete User</h2>

    <!-- Display error message if any -->
    <c:if test="${param.error != null}">
        <p style="color:red;">${param.error}</p>
    </c:if>

    <!-- Display success message if any -->
    <c:if test="${param.success != null}">
        <p style="color:green;">${param.success}</p>
    </c:if>

    <!-- Simulated list of users for demonstration -->
    <%
        // In the future, you would fetch this from the database
        String[] users = {"user1", "user2", "user3", "admin"};
    %>

    <h3>Current Users</h3>
    <table>
        <tr>
            <th>Username</th>
            <th>Action</th>
        </tr>
        <c:forEach var="user" items="<%= users %>">
            <tr>
                <td>${user}</td>
                <td>
                    <form action="do.deleteUser" method="POST" style="display:inline;">
                        <input type="hidden" name="username" value="${user}">
                        <input type="submit" value="Delete">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <br><a href="admin-dashboard.jsp">Back to Admin Dashboard</a>
</body>
</html>