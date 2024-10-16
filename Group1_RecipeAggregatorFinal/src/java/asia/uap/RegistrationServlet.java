package asia.uap;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RegistrationServlet", urlPatterns = {"/do.register"})
public class RegistrationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<User> Users = new ArrayList<User>();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String profileinfo = "";
        int following = 0;
        int followers = 0;
        
        if (username == null || username.isEmpty() || password == null || password.isEmpty()){
            response.sendRedirect("User/register.jsp?error=ERROR: Please input valid inputs.");
            return;
        }
        
        // Add logic to insert new user into the database
        
        HttpSession session = request.getSession(); 
        Users = (ArrayList) session.getAttribute("user");
        
        if (Users == null || Users.isEmpty()){
            Users = new ArrayList();
        }
        for (User i : Users){
                if (i.getUsername().equals(username)){
                    response.sendRedirect("User/register.jsp?error=ERROR: This username has been taken.");
                    return;
                }
            }
        
        User user = new User();
        user.setUser(username, password, profileinfo, following, followers);
        Users.add(user);        
        session.setAttribute("user", Users);
        
        response.sendRedirect("User/login.jsp?success=Account created.");
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
        return "Handles user registration";
    }
}