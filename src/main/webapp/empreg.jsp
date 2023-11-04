<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Registration Form</title>
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
        form input[type="date"],
        form select,
        form input[type="email"],
        form input[type="number"],
        form input[type="password"],
        form input[type="tel"] {
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

        form input[type="radio"] {
            display: inline-block;
            margin-right: 10px;
        }

        p {
            text-align: center;
        }

        .login-link {
            color: rgb(224, 63, 34);
            text-decoration: none;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
        .error-message{
           color:red;
           font-weight: bold;
        }
    </style>
</head>

<body>
    <form action="register" method="post" enctype="multipart/form-data">
        <h1>Employee Registration</h1>
        <div style="text-align: center; color: red; ">
        <c:if test="${not empty message}">
    <div class="success-message"><b>${message}</b></div>
</c:if>
</div>
        <table>
            <tr>
                <td>
                    <i class="fa fa-user"></i>
                    <label for="username"><b>Username</b></label>
                </td>
                <td>
                    <input type="text" placeholder="Enter Username" name="username" id="username" required />
                    <span id="usernameError" class="error-message"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-male"></i>
                    <label for="gender"><b>Gender</b></label>
                </td>
                <td>
                    <input type="radio" id="male" name="gender" value="male" />
                    <label for="male">Male</label>

                    <input type="radio" id="female" name="gender" value="female" />
                    <label for="female">Female</label>

                    <input type="radio" id="other" name="gender" value="other" />
                    <label for="other">Other</label>
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-birthday-cake"></i>
                    <label for="dob"><b>Date of Birth</b></label>
                </td>
                <td><input type="date" id="dob" name="dob" /></td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-briefcase"></i>
                    <label for="department"><b>Department</b></label>
                </td>
                <td>
                      <select id="department" name="department">
            <c:forEach items="${departments}" var="department">
                <option value="${department.departmentname}">${department.departmentname}</option>
            </c:forEach>
        </select>
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-dollar"></i>
                    <label for="salary"><b>Salary</b></label>
                </td>
                <td>
                    <input type="number" placeholder="Enter salary" name="salary" id="salary" required />
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-envelope"></i>
                    <label for="email"><b>Email ID</b></label>
                </td>
                <td>
                    <input type="email" placeholder="Enter email" name="email" id="email" required />
                    <span id="emailError" class="error-message"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-lock"></i>
                    <label for="password"><b>Password</b></label>
                </td>
                <td>
                    <input type="password" placeholder="Enter Password" name="password" id="password" required />
                    <span id="passwordError" class="error-message"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-phone"></i>
                    <label for="contact"><b>Contact No</b></label>
                </td>
                <td>
                    <input type="tel" placeholder="Must be 10 digits" name="contact" id="contact" pattern="[0-9]{10}"
                        required />
                        <span id="contactError" class="error-message"></span>
                </td>
            </tr>
            <!--
<tr>
    <td>
        <i class="fa fa-file"></i>
        <label for="file"><b>Upload Image</b></label>
    </td>
    <td>
        <input type="file" name="file" accept="image/*" required />
    </td>
</tr>
-->
        </table>
        <input type="submit" value="Register" />
        <p> Already Have an account?<b><a href="emplogin" class="login-link">Login Here</a></b></p>
    </form>
    
  <script>
    function validateForm() {
        var username = document.getElementById("username").value;
        var email = document.getElementById("email").value;
        var password = document.getElementById("password").value;
        var contact = document.getElementById("contact").value;

        var usernamePattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-])(?=.*\d)/;
        var emailPattern = /@gmail\.com$/;
        var passwordPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*()_+{}\[\]:;<>,.?~\\-])(?=.*\d)/;
        var contactPattern = /^\d{10}$/;

        // Function to set the error message for an input field
        function setError(id, message) {
            const errorElement = document.getElementById(id + "Error");
            if (!message) {
                errorElement.innerText = ""; // Clear the error message
            } else {
                errorElement.innerText = message;
                errorElement.classList.add("error-message-active");
            }
        }

        // Remove any existing error messages
        document.querySelectorAll(".error-message-active").forEach(function (el) {
            el.classList.remove("error-message-active");
        });

        var isUsernameValid = usernamePattern.test(username);
        var isEmailValid = emailPattern.test(email);
        var isPasswordValid = passwordPattern.test(password);
        var isContactValid = contactPattern.test(contact);

        if (!isUsernameValid) {
            setError("username", "Username must contain letters, at least one special symbol, and one number.");
            return false;
        }

        if (!isEmailValid) {
            setError("email", "Email must be a Gmail address (e.g., example@gmail.com).");
            return false;
        }

        if (!isPasswordValid) {
            setError("password", "Password must contain letters, at least one special symbol, and one number.");
            return false;
        }

        if (!isContactValid) {
            setError("contact", "Contact No must be exactly 10 digits.");
            return false;
        }

        return true;
    }

    document.querySelector('form').onsubmit = validateForm;
</script>
</body>
</html>