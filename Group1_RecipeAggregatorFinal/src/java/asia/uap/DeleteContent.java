package asia.uap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/DeleteContent")
public class DeleteContent extends HttpServlet {
    private List<Recipe> recipeList;

    @Override
    public void init() throws ServletException {
        recipeList = new ArrayList<>();
        // Initialize with some dummy data
        recipeList.add(new Recipe("Spaghetti Carbonara", "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.", "food1.jpg"));
        recipeList.add(new Recipe("Chicken Curry", "A spicy and flavorful dish made with chicken, tomatoes, and a blend of spices.", "food2.jpg"));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int index = Integer.parseInt(request.getParameter("index"));
        if (index >= 0 && index < recipeList.size()) {
            recipeList.remove(index);
        }

        response.sendRedirect("admin_recipe_management.jsp");
    }
}
