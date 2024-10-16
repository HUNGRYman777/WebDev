<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="asia.uap.Recipe" %>
<jsp:include page="../include/user_header.jsp" />
<html>
<head>
    <title>User Home</title>
    <style>
        .feed-container {
            max-width: 800px;
            margin: 20px auto;
            padding: 0 20px;
        }
        
        .recipe-card {
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin-bottom: 20px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }
        
        .recipe-card h3 {
            margin-top: 0;
            color: #333;
        }
        
        .recipe-card p {
            color: #666;
        }
        
        .loading {
            text-align: center;
            padding: 20px;
            display: none;
        }
        
        .rating {
            color: #f9a825;
            font-weight: bold;
        }
        
        body {
            font-family: Arial;
            color: black;
            background-color: #e1fce8;
            line-height: 1.5;
            text-align: center;
        }
        form {
            width: 30%;
            padding: 10px;
            margin: auto;
            text-align: center;
            background-color: #dfe8e1;
            border: 2px solid black;
            border-radius: 10px;
        }

        input[type], textarea[name] {
            width: 40%;
            padding: 10px;
            margin: auto;
            display: block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type=submit] {
            width: 30%;
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            margin: auto;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        a, button{
            padding: 10px;
            margin: 10px;
            background-color: #8df0a3;
            border: 2px solid black;
            border-radius: 10px;
        }
    </style>
</head>
<body>
    <h1>Welcome to the Recipe Aggregator</h1>
    <h2>Available Recipes</h2>
    <div id="recipeList">
        <%
            List<Recipe> recipeList = (List<Recipe>) request.getAttribute("recipeList");
            if (recipeList != null && !recipeList.isEmpty()) {
                for (Recipe recipe : recipeList) {
        %>
            <div class="recipe">
                <h2 class="recipe-title"><%= recipe.getTitle() %></h2>
                <img src="images/<%= recipe.getImage() %>" alt="<%= recipe.getTitle() %>">
                <p class="recipe-description"><%= recipe.getDescription() %></p>
            </div>
        <%
                }
            } else {
        %>
            <p>No recipes available.</p>
        <%
            }
        %>
    </div>
</body>
</html>
