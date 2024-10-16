<%-- 
    Document   : add
    Created on : 10 7, 24, 2:53:58 PM
    Author     : jverceles
--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Content [ADMINISTRATOR]</title>
    <link rel ="stylesheet" href ="../newcss.css">
</head>
<body>
    <h2>Add New Content</h2>

    <!-- Display error messages if any -->
    <c:if test="${param.error != null}">
        <p style="color:red;">${param.error}</p>
    </c:if>

    <form action="do.add" method="POST">
        <label for="title">Recipe Title: </label><br>
        <input type="text" id="title" name="title" value="${param.title != null ? param.title : ''}"><br><br>

        <label for="photo">Add Photo Link of Finished Product: </label><br>
        <input type="text" id="image" name="image" value="${param.image != null ? param.image : ''}"><br><br>

        <label for="description">Add a description for the recipe: </label><br>
        <textarea id="description" name="description">${param.description != null ? param.description : ''}</textarea><br><br>

        <input type="submit" value="Submit">
    </form>
    
    <br><a href="home.jsp">Back to Home</a>
</body>
</html>
