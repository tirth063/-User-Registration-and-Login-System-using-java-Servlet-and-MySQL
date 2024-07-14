package com.myjsp.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionManager {

    private static final String URL = "jdbc:mysql://localhost:3306/javadb";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "root";

    public static Connection getConnection() {
        Connection con = null;
        try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			
		} catch (ClassNotFoundException e) {
			System.out.println("Database connection is not success!!!");
			e.getMessage();
		}catch (SQLException e) {
			System.out.println("Database connection is not success!!!");
			e.getMessage();
		}
		if (con != null) {
			System.out.println("connection successfull");
		}
		return con;
    }
    
}
