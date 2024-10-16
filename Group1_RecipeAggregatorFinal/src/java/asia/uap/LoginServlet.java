package asia.uap;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/do.login"})
public class LoginServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ArrayList<User> users = new ArrayList();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Boolean username_exists = false;
        Boolean is_authenticated = false;
        
        if (username == null || username.isEmpty() || password == null || password.isEmpty()){
            response.sendRedirect("User/login.jsp?error=ERROR: Please input valid inputs.");
            return;
        }
        
        HttpSession session = request.getSession();
        users = (ArrayList) session.getAttribute("user");
        User user = new User();
        
        if (users == null || users.isEmpty()){
            response.sendRedirect("User/login.jsp?error=ERROR: Please create an account first.");
            return;
        } else{
            for (User i : users){
                if(i.getUsername().equals(username)){
                    username_exists = true;
                    user = i;
                    break;
                }
            }
            if (username_exists == false){
                response.sendRedirect("User/login.jsp?error=ERROR: Your username and/or password is invalid.");
                return;
            }
            else {
                if (user.getPassword().equals(password)){
                    is_authenticated = true;
                    session.setAttribute("current", user);
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("password", user.getPassword());
                    session.setAttribute("profileinfo", user.getProfileinfo());
                    session.setAttribute("followers", user.getFollowers());
                    session.setAttribute("following", user.getFollowing());
                    response.sendRedirect("User/user_home.jsp");
                    return;
                }
                else {
                    response.sendRedirect("User/login.jsp?error=ERROR: Your username and/or password is invalid.");
                }
            }
        }
        
        // Mock authentication, replace with real database check
//        if ("admin".equals(username) && "password".equals(password)) {
//            HttpSession session = request.getSession();
//            session.setAttribute("username", username);
//            response.sendRedirect("home.jsp");
//        } else {
//            response.sendRedirect("login.jsp?error=Invalid%20login");
//        }
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
        return "Handles login functionality";
    }
}