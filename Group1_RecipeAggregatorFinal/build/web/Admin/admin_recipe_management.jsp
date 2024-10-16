<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="asia.uap.Recipe" %>
<jsp:include page="../include/admin_header.jsp" />
<html>
<head>
    <title>Admin Recipe Management</title>
    <style>
        body {
            font-family: Arial;
            color: black;
            background-color: #e1fce8;
            line-height: 1.5;
            text-align: center;
        }
        .recipe {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
        }
        .recipe img {
            max-width: 100%;
            height: auto;
        }
        .recipe-title {
            font-size: 1.5em;
            margin: 10px 0;
        }
        .recipe-description {
            color: #555;
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
    <h1>Recipe Management</h1>
    <h2>Add Recipe</h2>
    <form action="AddContent" method="post">
        <label>Title: <input type="text" name="title" required></label><br>
        <label>Description: <textarea name="description" required></textarea></label><br>
        <label>Image: <input type="text" name="image" required></label><br>
        <input type="submit" value="Add Recipe">
    </form>

    <h2>Existing Recipes</h2>
    <div id="recipeList">
        <%
            List<Recipe> recipeList = (List<Recipe>) request.getAttribute("recipeList");
            if (recipeList != null && !recipeList.isEmpty()) {
                for (int i = 0; i < recipeList.size(); i++) {
                    Recipe recipe = recipeList.get(i);
        %>
            <div class="recipe">
                <h2 class="recipe-title"><%= recipe.getTitle() %></h2>
                <img src="images/<%= recipe.getImage() %>" alt="<%= recipe.getTitle() %>">
                <p class="recipe-description"><%= recipe.getDescription() %></p>
                <form action="EditContent" method="post">
                    <input type="hidden" name="index" value="<%= i %>">
                    <label>New Title: <input type="text" name="title" value="<%= recipe.getTitle() %>" required></label><br>
                    <label>New Description: <textarea name="description" required><%= recipe.getDescription() %></textarea></label><br>
                    <label>New Image: <input type="text" name="image" value="<%= recipe.getImage() %>" required></label><br>
                    <input type="submit" value="Edit Recipe">
                </form>
                <form action="DeleteContent" method="post" style="display:inline;">
                    <input type="hidden" name="index" value="<%= i %>">
                    <input type="submit" value="Delete Recipe">
                </form>
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
