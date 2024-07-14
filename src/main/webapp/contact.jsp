<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang='en'>

<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0' crossorigin='anonymous'>
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
	            String usrname = (String) session.getAttribute("username");
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
                        <a id="home" class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a id="contact" class="active nav-link" aria-current="page" href="contact.jsp">Contact</a>
                    </li>
                </ul>
                <a href="logout" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <h3>Welcome, <%= usrname %>!</h3>
        <p>This is the contact page.</p>
    </div>
 		<%
	        } else {
	            response.sendRedirect("index.html");
	        }
    	%>
    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js' integrity='sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8' crossorigin='anonymous'></script>
</body>

</html>