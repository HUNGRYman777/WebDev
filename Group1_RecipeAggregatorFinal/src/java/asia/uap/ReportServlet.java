package asia.uap;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ReportServlet", urlPatterns = {"/do.getreport"})
public class ReportServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        String reportId = request.getParameter("reportId");

        if ("Resolve".equals(action)) {
            // Logic to resolve the report
            resolveReport(reportId);
        }

        // After action is performed, redirect back to the report management page
        response.sendRedirect("admin-reports.jsp");
    }

    /**
     * Logic to resolve a report. Replace this with actual database handling code.
     */
    private void resolveReport(String reportId) {
        // Placeholder for actual report resolution logic
        // You could update a database entry for the report using the reportId
        System.out.println("Resolved report with ID: " + reportId);
        // Implement the update to mark the report as resolved in the database
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
        return "Handles report management actions";
    }
}