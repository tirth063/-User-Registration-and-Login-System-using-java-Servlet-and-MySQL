package com.myjsp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import com.myjsp.model.ConnectionManager; // Assuming ConnectionManager provides connection

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet class to handle profile update requests.
 */
@WebServlet("/updateProfile")
public class UpdateProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fullName = request.getParameter("fullName");
        int age = Integer.parseInt(request.getParameter("age"));
        String gender = request.getParameter("gender");
        String birthdate = request.getParameter("birthdate"); // Assuming date format is handled correctly

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ConnectionManager.getConnection();

            String sql = "UPDATE users SET fullName = ?, age = ?, gender = ?, birthdate = ? WHERE username = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, fullName);
            pstmt.setInt(2, age);
            pstmt.setString(3, gender);
            pstmt.setDate(4, java.sql.Date.valueOf(birthdate)); // Assuming valid date format

            // Retrieve username from session (assuming it's set correctly)
            String username = (String) request.getSession().getAttribute("username");
            pstmt.setString(5, username);

            int rowsUpdated = pstmt.executeUpdate();

            if (rowsUpdated > 0) {
                // Profile update successful, redirect to home.jsp
                response.sendRedirect("home.jsp");
            } else {
                // Update failed, handle error (e.g., display error message)
                PrintWriter out = response.getWriter();
                out.println("<html><body>");
                out.println("<b>Error: Profile update failed!</b>");
                out.println("</body></html>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database errors appropriately (e.g., log the error)
            response.sendRedirect("error.jsp"); // Or display a generic error page
        } finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                // Handle resource closing errors (log or ignore)
            }
        }
    }
}
