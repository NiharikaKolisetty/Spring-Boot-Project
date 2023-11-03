<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-image: url(https://static.vecteezy.com/system/resources/previews/007/355/448/original/abstract-gray-molecules-structure-background-free-vector.jpg);
            backdrop-filter: blur(3px);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }

        form {
            text-align: left;
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            width: 35%;
            backdrop-filter: blur(2px);
            animation: fadeIn 2s ease;
        }

        form h1 {
            text-align: center;
        }

        form table {
            margin: 0 auto;
            border-collapse: collapse;
        }

        form table td {
            padding: 10px;
        }

        form label {
            display: inline-block;
        }

        form input[type="text"],
        form input[type="password"] {
            width: 100%;
            padding: 6px 8px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            outline: none;
        }

        .fa {
            margin-right: 10px;
        }

        form input[type="submit"] {
            display: block;
            text-align: center;
            margin: 20px auto;
            padding: 10px 20px;
            border: none;
            border-radius: 2px;
            background-color: black;
            color: #fff;
            cursor: pointer;
        }
        
    </style>
</head>

<body>

<br>



    <form action="checkadminlogin" method="post"  onsubmit="return validateForm()">
    
   
    
        <h1>Admin Login</h1>
        
        
        <div id="error-message" style="color: red; text-align: center">
            <c:choose>
                <c:when test="${not empty errorMessage}">
                    ${errorMessage}
                </c:when>
                <c:otherwise>
                    &nbsp; <!-- Use a non-breaking space if you want an empty space without any text -->
                </c:otherwise>
            </c:choose>
        </div>
      

        <table>
            <tr>
                <td>
                    <i class="fa fa-user"></i>
                    <label for="username"><b>Username</b></label>
                </td>
                <td>
                    <input type="text" placeholder="Enter Username" name="username" id="username" required />
                </td>
            </tr>
            
            <tr>
                <td>
                    <i class="fa fa-lock"></i>
                    <label for="password"><b>Password</b></label>
                </td>
                <td>
                    <input type="password" placeholder="Enter Password" name="password" id="password" required />
                </td>
            </tr>
            
        </table>
        <input type="submit" value="Login" />
        
        <div id="username-error" style="color: red; text-align: center"></div>
        <div id="password-error" style="color: red; text-align: center"></div>
        
        
        
        
    </form>
    
    <script>
        function validateForm() {
            var username = document.getElementById("username").value;
            var password = document.getElementById("password").value;
            var usernameRegex = /^(?=.*[a-zA-Z])(?=.*[\d])(?=.*[\W_]).+$/;
            var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[\d])(?=.*[\W_]).+$/;
            var isValid = true;

            if (!usernameRegex.test(username)) {
                document.getElementById("username-error").textContent = "Username must contain letters, at least one number, and at least one special symbol.";
                isValid = false;
            } else {
                document.getElementById("username-error").textContent = "";
            }

            if (!passwordRegex.test(password)) {
                document.getElementById("password-error").textContent = "Password must contain letters, at least one number, and at least one special symbol.";
                isValid = false;
            } else {
                document.getElementById("password-error").textContent = "";
            }

            if (!isValid) {
                document.getElementById("error-message").textContent = "Username or password is incorrect.";
            } else {
                document.getElementById("error-message").textContent = "";
            }

            return isValid;
        }
    </script>
</body>

</html>