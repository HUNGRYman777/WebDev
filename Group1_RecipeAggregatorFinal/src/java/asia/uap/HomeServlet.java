package asia.uap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(HomeServlet.class.getName());
    private List<Recipe> recipeList;

    @Override
    public void init() throws ServletException {
        recipeList = new ArrayList<>();
        // Initialize with some dummy data
        recipeList.add(new Recipe("Spaghetti Carbonara", "A classic Italian pasta dish made with eggs, cheese, pancetta, and pepper.", "food1.jpg"));
        recipeList.add(new Recipe("Chicken Curry", "A spicy and flavorful dish made with chicken, tomatoes, and a blend of spices.", "food2.jpg"));
        logger.log(Level.INFO, "Initialized recipe list with {0} recipes.", recipeList.size());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.log(Level.INFO, "Fetching recipes for display.");
        request.setAttribute("recipeList", recipeList);
        request.getRequestDispatcher("/User/user_home.jsp").forward(request, response);
    }
}
