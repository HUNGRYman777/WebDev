<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Recipe Details</title>
    <style>
        body {
            background-color: #e1fce8;
        }
        div {
            width: 60%;
            padding: 10px;
            margin: auto;
            line-height: 1.5;
            background-color: #dfe8e1;
            border: 2px solid black;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <div>
    <h2>${recipe.name}</h2>
    
    <p><strong>Description:</strong> ${recipe.description}</p><br>
    <p><strong>Ingredients:</strong></p>
    <ul>
        <c:forEach var="ingredient" items="${recipe.ingredients}">
            <li>${ingredient}</li>
        </c:forEach>
    </ul>
    <p><strong>Instructions:</strong></p>
    <ol>
        <c:forEach var="step" items="${recipe.steps}">
            <li>${step}</li>
        </c:forEach>
    </ol>

    <form action="LikeServlet" method="POST">
        <input type="hidden" name="recipeId" value="${recipe.id}">
        <button type="submit">Like</button>
    </form>
    
    <h3>Comments</h3>
    <form action="CommentServlet" method="POST">
        <input type="hidden" name="recipeId" value="${recipe.id}">
        <textarea name="comment" placeholder="Leave a comment"></textarea><br>
        <button type="submit">Post Comment</button>
    </form>
    <ul>
        <c:forEach var="comment" items="${recipe.comments}">
            <li><strong>${comment.username}:</strong> ${comment.text}</li>
        </c:forEach>
    </ul>
    </div>
</body>
</html>