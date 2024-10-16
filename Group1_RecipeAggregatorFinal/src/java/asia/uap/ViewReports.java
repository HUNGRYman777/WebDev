package asia.uap;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet to handle viewing reports submitted by users.
 */
@WebServlet(name = "ViewReports", urlPatterns = {"/do.viewreport"})
public class ViewReports extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        
        // Ensure the user is logged in and is an admin
        if (session == null || !"admin".equals(session.getAttribute("role"))) {
            response.sendRedirect("home.jsp?error=Unauthorized%20Access");
            return;
        }

        // Simulate fetching reports (replace with actual database logic in the future)
        List<String[]> reports = new ArrayList<>();
        reports.add(new String[]{"1", "Report 1", "This is the first report from user1."});
        reports.add(new String[]{"2", "Report 2", "This is the second report from user2."});
        reports.add(new String[]{"3", "Report 3", "This is the third report from user3."});

        // Set the reports as a request attribute and forward to the JSP
        request.setAttribute("reports", reports);
        request.getRequestDispatcher("admin-view-reports.jsp").forward(request, response);
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
        return "Servlet for viewing reports submitted by users";
    }
}