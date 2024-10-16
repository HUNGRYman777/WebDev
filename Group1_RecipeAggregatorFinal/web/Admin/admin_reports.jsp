<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Reports</title>
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
    <h2>Manage Reports</h2>
    <ul>
        <c:forEach var="report" items="${reports}">
            <li>${report.description} 
                <form action="ReportServlet" method="POST" style="display:inline;">
                    <input type="hidden" name="reportId" value="${report.id}">
                    <input type="submit" name="action" value="Resolve">
                </form>
            </li>
        </c:forEach>
    </ul>
</body>
</html>