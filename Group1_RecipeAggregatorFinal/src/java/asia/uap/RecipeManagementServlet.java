package asia.uap;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(name = "RecipeManagementServlet", urlPatterns = {"/do.getrecipemanager"})
@MultipartConfig
public class RecipeManagementServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if ("Edit".equals(action)) {
            // Logic to edit the recipe
            String recipeId = request.getParameter("recipeId");
            // Perform edit actions using recipeId
        } else if ("Delete".equals(action)) {
            // Logic to delete the recipe
            String recipeId = request.getParameter("recipeId");
            // Perform delete actions using recipeId
        } else {
            // Logic to add a new recipe
            String recipeName = request.getParameter("recipeName");
            String description = request.getParameter("description");
            Part image = request.getPart("image");

            // Save recipe and image to the database
        }

        response.sendRedirect("admin-recipe-management.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles recipe management actions";
    }
}