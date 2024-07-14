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
    <title>Edit Profile | Apps</title>
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
                <h3>Edit Profile</h3>
                <form action="updateProfile" method="POST">
                    <div class="mb-3">
                        <label for="fullName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" value="<%= rs.getString("fullName") %>" required>
                    </div>
                    <div class="mb-3">
                        <label for="age" class="form-label">Age</label>
                        <input type="number" class="form-control" id="age" name="age" value="<%= rs.getInt("age") %>" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Gender</label>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" id="male" value="Male" <%= rs.getString("gender").equals("Male") ? "checked" : "" %> required>
                            <label class="form-check-label" for="male">Male</label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="gender" id="female" value="Female" <%= rs.getString("gender").equals("Female") ? "checked" : "" %> required>
                            <label class="form-check-label" for="female">Female</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="birthdate" class="form-label">Birthdate</label>
                        <input type="date" class="form-control" id="birthdate" name="birthdate" value="<%= rs.getDate("birthdate") %>" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update Profile</button>
                </form>
            </div>
<%
        } else {
            response.sendRedirect("index.html");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // (Close resources)
    }
} else {
    response.sendRedirect("index.html");
}
%>
<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js'></script>

</body>
</html>