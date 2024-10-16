<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>View Reports [ADMINISTRATOR]</title>
    <style>
        table {
            width: 80%;
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
    <h2>Reports Submitted by Users</h2>

    <!-- Display success message if any -->
    <c:if test="${param.success != null}">
        <p style="color:green;">${param.success}</p>
    </c:if>

    <table>
        <tr>
            <th>Report ID</th>
            <th>Title</th>
            <th>Description</th>
        </tr>
        <c:forEach var="report" items="${reports}">
            <tr>
                <td>${report[0]}</td>
                <td>${report[1]}</td>
                <td>${report[2]}</td>
            </tr>
        </c:forEach>
    </table>

    <br><a href="admin-dashboard.jsp">Back to Admin Dashboard</a>
</body>
</html>