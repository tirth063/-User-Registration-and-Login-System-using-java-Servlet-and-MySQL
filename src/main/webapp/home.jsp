<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.myjsp.model.ConnectionManager" %>

<!doctype html>
<html lang='en'>

<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css' rel='stylesheet'
        integrity='sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0' crossorigin='anonymous'>
    <title>Home | Apps</title>
    <style>
        body {
            background-color: skyblue;
        }
    </style>
</head>

<body>

<%
if (session != null && session.getAttribute("username") != null) {
    String username = (String) session.getAttribute("username");
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    
    try {
        con = ConnectionManager.getConnection();
        String sql = "SELECT * FROM users WHERE username = ?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, username);
        rs = pstmt.executeQuery();
        
        if (rs.next()) {
%>
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container-fluid">
                    <a class="navbar-brand ms-2" href="home.jsp">My JSP Web App</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a id="home" class="active nav-link" href="home.jsp">Home</a>
                            </li>
                            <li class="nav-item">
                                <a id="contact" class="nav-link" aria-current="page" href="contact.jsp">Contact</a>
                            </li>
                        </ul>
                        <a href="logout" class="btn btn-danger">Logout</a>
                    </div>
                </div>
            </nav>

            <div class="container my-5">
                <h3>Welcome, <%= rs.getString("fullName") %>!</h3>
                <div class="card mt-4">
                    <div class="card-header">
                        User Profile
                    </div>
                    <div class="card-body">
                        <p><strong>Full Name:</strong> <%= rs.getString("fullName") %></p>
                        <p><strong>Age:</strong> <%= rs.getInt("age") %></p>
                        <p><strong>Gender:</strong> <%= rs.getString("gender") %></p>
                        <p><strong>Birthdate:</strong> <%= rs.getDate("birthdate") %></p>
                        <p><strong>Username:</strong> <%= rs.getString("username") %></p>
                        <a href="editProfile.jsp" class="btn btn-primary">Edit Profile</a>
                    </div>
                </div>
            </div>
<%
        } else {
            response.sendRedirect("index.html");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} else {
    response.sendRedirect("index.html");
}
%>

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js'></script>
</body>

</html>