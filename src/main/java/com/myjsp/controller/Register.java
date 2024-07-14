package com.myjsp.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.myjsp.model.ConnectionManager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/Register", name = "RegisterServlet")
public class Register extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        int age = Integer.parseInt(req.getParameter("age"));
        String gender = req.getParameter("gender");
        String birthdate = req.getParameter("birthdate");
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        Connection con = ConnectionManager.getConnection();
        if (con != null) {
            try {
                String sql = "INSERT INTO users (fullName, age, gender, birthdate, username, password) VALUES (?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, fullName);
                stmt.setInt(2, age);
                stmt.setString(3, gender);
                stmt.setString(4, birthdate);
                stmt.setString(5, username);
                stmt.setString(6, password);

                int rowsAffected = stmt.executeUpdate();
                if (rowsAffected > 0) {
                	req.setAttribute("success", "Registration successful! You can now log in.");
                    resp.sendRedirect("index.html");
                } else {
                    req.setAttribute("error", "Registration failed. Please try again.");
                    req.getRequestDispatcher("register.jsp").forward(req, resp);
                }
            } catch (SQLException e) {
                e.printStackTrace();
                req.setAttribute("error", "An error occurred while registering. Please try again later.");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("error", "Failed to connect to the database. Please try again later.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}