package asia.uap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/recipes")
public class RecipeServlet extends HttpServlet {
    private List<Recipe> recipeList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // Initialize hardcoded recipes
        recipeList.add(new Recipe("Spaghetti Carbonara", "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.", "food1.jpg"));
        recipeList.add(new Recipe("Chicken Curry", "A spicy and flavorful dish made with chicken, tomatoes, and a blend of spices.", "food2.jpg"));
        recipeList.add(new Recipe("Vegetable Stir Fry", "A quick and healthy dish featuring seasonal vegetables and soy sauce.", "food3.jpg"));
        recipeList.add(new Recipe("Chocolate Cake", "A rich and moist chocolate cake topped with creamy chocolate frosting.", "food4.jpg"));
        recipeList.add(new Recipe("Caesar Salad", "A fresh salad made with romaine lettuce, croutons, and Caesar dressing.", "food5.jpg"));
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("recipeList", recipeList);
        request.getRequestDispatcher("User/user_home.jsp").forward(request, response);
    }

    // Method to handle adding a recipe
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String image = request.getParameter("image");

        Recipe newRecipe = new Recipe(title, description, image);
        recipeList.add(newRecipe);

        response.sendRedirect("recipes");
    }

    // Method to handle editing a recipe
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String image = request.getParameter("image");

        if (index >= 0 && index < recipeList.size()) {
            Recipe recipe = recipeList.get(index);
            recipe.setTitle(title);
            recipe.setDescription(description);
            recipe.setImage(image);
        }

        response.sendRedirect("recipes");
    }

    // Method to handle deleting a recipe
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < recipeList.size()) {
            recipeList.remove(index);
        }

        response.sendRedirect("recipes");
    }
}
