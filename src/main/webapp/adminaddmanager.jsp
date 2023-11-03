<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
            background-color: rgba(255, 255, 255, 0.7);
            border-radius: 10px;
            width: 35%;
            margin-top: 50px;
            backdrop-filter: blur(2px);
        }

        form h1 {
            margin: 20px 0;
            text-align: center;
        }

        form table {
            margin: 0 auto;
            border-collapse: collapse;
        }

        form table td {
            padding: 10px;
        }

        form input[type="text"],
        form input[type="password"]
        {
            width: 100%;
            padding: 6px 8px;
            border-radius: 3px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            outline: none;
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
        .alert {
             text-align: center;
             margin-bottom: 10px; 
        }
</style>
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>

<form action="addManager" method="post">
    <h1>Manager Form</h1>
    <c:if test="${not empty successMessage}">
    <div class="alert alert-success" style="color: green; font-weight: bold;">
        ${successMessage}
        <br>
        <b><a href="adminmanagersec" style="color: red; text-decoration: none;">${goback}</a></b>
    </div>
</c:if>
    
    <table>
        <tr>
            <td>
                <i class="fa fa-user"></i>
                <label for="managerid"><b>Manager ID</b></label>
            </td>
            <td>
                <input type="text" placeholder="Enter Manager ID" name="managerid" id="managerid" required />
            </td>
        </tr>

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
    <input type="submit" value="Submit" />
</form>

</body>
</html>