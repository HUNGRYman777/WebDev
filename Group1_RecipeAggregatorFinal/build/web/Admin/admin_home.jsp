<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Recipe Feed</title>
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
    <jsp:include page="../include/admin_header.jsp" />
    
    <div class="feed-container">
        <h2>Recipe Feed</h2>
        <div id="feed"></div>
        <div id="loading" class="loading">Loading more recipes...</div>
    </div>

    <script>
        let page = 1;
        let loading = false;
        let hasMore = true;
        
        // Load initial recipes
        loadMoreRecipes();
        
        // Infinite scroll handler
        window.addEventListener('scroll', () => {
            if (loading || !hasMore) return;
            
            const threshold = 100; // pixels from bottom
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight - threshold) {
                loadMoreRecipes();
            }
        });
        
        function loadMoreRecipes() {
            if (loading || !hasMore) return;
            
            loading = true;
            document.getElementById('loading').style.display = 'block';
            
            fetch('HomeServlet?page=' + page)
                .then(response => response.text())
                .then(text => {
                    // Parse the text as JSON, but handle potential errors
                    try {
                        return JSON.parse(text);
                    } catch (e) {
                        console.error('Error parsing JSON:', e);
                        throw new Error('Invalid JSON response');
                    }
                })
                .then(data => {
                    if (data.recipes.length === 0) {
                        hasMore = false;
                        document.getElementById('loading').textContent = 'No more recipes to load';
                        return;
                    }
                    
                    data.recipes.forEach(recipe => {
                        const recipeElement = createRecipeElement(recipe);
                        document.getElementById('feed').appendChild(recipeElement);
                    });
                    
                    page++;
                    loading = false;
                })
                .catch(error => {
                    console.error('Error loading recipes:', error);
                    loading = false;
                })
                .finally(() => {
                    document.getElementById('loading').style.display = 'none';
                });
        }
        
        function createRecipeElement(recipe) {
            const div = document.createElement('div');
            div.className = 'recipe-card';
            div.innerHTML = `
                <h3>${recipe.name}</h3>
                <p>${recipe.description}</p>
                <p><strong>Ingredients:</strong> ${recipe.ingredients}</p>
                <div class="rating">Rating: ${recipe.rating} ⭐</div>
            `;
            return div;
        }
    </script>
</body>
</html>