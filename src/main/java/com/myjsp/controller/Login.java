package com.myjsp.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.myjsp.model.ConnectionManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/login", name = "LoginServlet")
public class Login extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Connection con = ConnectionManager.getConnection();
        if (con != null) {
        	try {
        	    String sql = "SELECT * FROM active_users WHERE username=? AND password=?";
        	    PreparedStatement stmt = con.prepareStatement(sql);
        	    stmt.setString(1, username);
        	    stmt.setString(2, password);
        	    
        	    // Logging the SQL query being executed
        	    System.out.println("Executing SQL query: " + sql);
        	    
        	    ResultSet rs = stmt.executeQuery();
        	    if (rs.next()) {
        	        // Login successful, create a session and redirect to the home page
        	        HttpSession session = req.getSession();
        	        session.setAttribute("username", username);
        	        System.out.println("Login successful for username: " + username);
        	        resp.sendRedirect("home.jsp");
        	    } else {
        	        // Login failed, set an error message and redirect to the login page
        	        System.out.println("Login failed for username: " + username);
        	        req.setAttribute("error", "Invalid username or password. Please try again.");
        	        req.getRequestDispatcher("index.html").forward(req, resp);
        	    }
        	} catch (SQLException e) {
        	    e.printStackTrace();
        	    req.setAttribute("error", "An error occurred while logging in. Please try again later.");
        	    req.getRequestDispatcher("index.html").forward(req, resp);
        	}


        }
    }
}