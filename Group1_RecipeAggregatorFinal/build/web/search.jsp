<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Recipes</title>
    <link rel ="stylesheet" href ="newcss.css">
</head>
<body>
    <h2>Search Results</h2>
    <form action="SearchServlet" method="GET">
        <input type="text" name="search" placeholder="Search recipes"><br>
        <input type="submit" value="Search">
    </form>
    <br>
    <!-- Assuming that search results are passed as an attribute called 'results' -->
    <c:if test="${not empty results}">
        <ul>
            <c:forEach var="recipe" items="${results}">
                <li>
                    <a href="recipe-detail.jsp?id=${recipe.id}">${recipe.name}</a>
                </li>
            </c:forEach>
        </ul>
    </c:if>
    <c:if test="${empty results}">
        <p>No results found</p>
    </c:if>
</body>
</html>