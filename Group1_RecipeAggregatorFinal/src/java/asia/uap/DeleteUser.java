package asia.uap;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet to handle user deletion by an administrator.
 */
@WebServlet(name = "DeleteUser", urlPatterns = {"/do.delete"})
public class DeleteUser extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Check if the user is logged in and has admin privileges
        if (session == null || session.getAttribute("role") == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("login.jsp?error=Please%20login%20as%20an%20administrator");
            return;
        }

        // Get the username or user ID from the request
        String username = request.getParameter("username");

        // Validate if the username is provided
        if (username == null || username.isEmpty()) {
            response.sendRedirect("do.deleteUser?error=Please%20enter%20a%20valid%20username");
            return;
        }

        // Simulated user deletion (in the future, this will interact with a database)
        // For now, just pretend the user was deleted
        // Example: `UserDAO.deleteUserByUsername(username);` in a real-world scenario
        
        // Simulate success
        session.setAttribute("successMessage", "User '" + username + "' has been successfully deleted.");
        
        // Redirect to the admin dashboard or home page after successful deletion
        response.sendRedirect("admin-dashboard.jsp?success=User%20deleted%20successfully");
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
        return "Servlet for Admin to Delete Users";
    }
}