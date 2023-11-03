<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Update Department</title>
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
        form input[type="date"],
        form input[type="number"] {
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

<form action="/admin/updateDepartment" method="post">
    <h1>Update Department</h1>
    <table>
        <tr>
            <td>
                <i class="fa fa-user"></i>
                <label for="departmentname"><b>Department Name</b></label>
            </td>
            <td>
                <input type="text" placeholder="Enter department name" name="departmentname" id="departmentname" value="${department.departmentname}" required />
            </td>
        </tr>

        <tr>
            <td>
                <i class="fa fa-user"></i>
                <label for="departmentshortform"><b>Department Short Form</b></label>
            </td>
            <td>
                <input type="text" placeholder="Enter department short form" name="departmentshortform" id="departmentshortform" required value="${department.departmentshortform}" />
            </td>
        </tr>

        
        <tr>
            <td>
                <i class="fas fa-calendar"></i>
                <label for="code"><b>Code</b></label>
            </td>
            <td>
                <input type="text" name="code" id="code" required value="${department.code}" />
            </td>
        </tr>
    </table>
    <input type="submit" value="Update" />
</form>

</body>
</html>
