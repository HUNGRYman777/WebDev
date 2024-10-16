<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Content [ADMINISTRATOR]</title>
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
    <h2>Edit Content</h2>

    <!-- Simulate fetching existing content -->
    <%
        // Simulate stored content in memory (in a real application, this would be fetched from a database)
        List<String[]> contentList = new ArrayList<>();
        contentList.add(new String[]{"1", "Recipe 1", "http://example.com/image1.jpg", "Description 1"});
        contentList.add(new String[]{"2", "Recipe 2", "http://example.com/image2.jpg", "Description 2"});
    %>

    <h3>Existing Content</h3>
    <table>
        <tr>
            <th>Title</th>
            <th>Image</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        <c:forEach var="content" items="<%= contentList %>">
            <tr>
                <td>${content[1]}</td>
                <td><img src="${content[2]}" target="_blank">${content[2]}</a></td>
                <td>${content[3]}</td>
                <td>
                    <form action="do.edit" method="GET">
                        <input type="hidden" name="contentId" value="${content[0]}">
                        <input type="submit" value="Edit">
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>

    <br><a href="admin-dashboard.jsp">Back to Admin Dashboard</a>
</body>
</html>