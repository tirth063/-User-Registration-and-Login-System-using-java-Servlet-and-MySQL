<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!doctype html>
<html lang='en'>

<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <!-- Bootstrap CSS -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0' crossorigin='anonymous'>
    <title>Register | App</title>
    <style>
        body {
            background-color: skyblue;
        }
        @media only screen and (min-width: 960px) {
            .navbar .navbar-nav .nav-item .nav-link {
                padding: 0 0.5em;
            }
    
            .navbar .navbar-nav .nav-item:not(:last-child) .nav-link {
                border-right: 1px solid #f8efef;
            }
        }
    </style>
</head>

<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand ms-2" href="home.jsp">My JSP Web App</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a id="login" class="nav-link" href="index.html">Login</a>
                    </li>
                    <li class="nav-item">
                        <a id="register" class="active nav-link" href="register.jsp">Register</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <h3>Register</h3>
        <form id="registrationForm" action="Register" method="POST">
            <div class="mb-3">
                <label for="fullName" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="fullName" name="fullName" required>
            </div>
            <div class="mb-3">
                <label for="age" class="form-label">Age</label>
                <input type="number" class="form-control" id="age" name="age" required min="1" max="120">
            </div>
            <div class="mb-3">
                <label class="form-check-label">Gender</label>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="male" value="Male" required>
                    <label class="form-check-label" for="male">Male</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="gender" id="female" value="Female" required>
                    <label class="form-check-label" for="female">Female</label>
                </div>
            </div>
            <div class="mb-3">
                <label for="birthdate" class="form-label">Birthdate</label>
                <input type="date" class="form-control" id="birthdate" name="birthdate" required>
            </div>
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required minlength="4" maxlength="20">
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required minlength="8">
            </div>
            <button type="submit" class="btn btn-primary">Register</button>
        </form>
    </div>

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js' integrity='sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8' crossorigin='anonymous'></script>

    <!-- Custom validation script -->
    <script>
        document.getElementById('registrationForm').addEventListener('submit', function(event) {
            let isValid = true;

            // Validate Full Name
            const fullName = document.getElementById('fullName').value.trim();
            if (fullName.length < 2) {
                alert('Full Name must be at least 2 characters long.');
                isValid = false;
            }

            // Validate Age
            const age = document.getElementById('age').value;
            if (age < 1 || age > 120) {
                alert('Age must be between 1 and 120.');
                isValid = false;
            }

            // Validate Birthdate
            const birthdate = new Date(document.getElementById('birthdate').value);
            const today = new Date();
            const minDate = new Date(today.getFullYear() - 120, today.getMonth(), today.getDate());
            if (birthdate > today || birthdate < minDate) {
                alert('Please enter a valid birthdate.');
                isValid = false;
            }

            // Validate Username
            const username = document.getElementById('username').value.trim();
            if (username.length < 4 || username.length > 20) {
                alert('Username must be between 4 and 20 characters long.');
                isValid = false;
            }

            // Validate Password
            const password = document.getElementById('password').value;
            if (password.length < 8) {
                alert('Password must be at least 8 characters long.');
                isValid = false;
            }

            if (!isValid) {
                event.preventDefault();
            }
        });
    </script>
</body>

</html>