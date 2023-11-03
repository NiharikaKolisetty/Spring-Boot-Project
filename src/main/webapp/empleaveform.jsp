<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
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
            margin-top:150px;
            
        }

        form h1 {
            margin-top:20px;
            margin-bottom:20px;
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
        form input[type="tel"],form textarea {
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
    </style>
</head>

<body>
<jsp:include page="empnav.jsp"></jsp:include>
    <form action="submitLeaveForm" method="post">
        <h1>Employee Leave Form</h1>
         <div class="message" style="color: green; text-align: center; font-weight: bold">
        ${message}
        <br>
        <a href="empleaveform" style="color: Blue; text-align: center; font-weight: Italic" >${goback}</a>
    </div>
        <table>
            <tr>
                <td>
                    <i class="fa fa-user"></i>
                    <label for="name"><b>Name</b></label>
                </td>
                <td>
                    <input type="text" placeholder="Enter name" name="name" id="name" required />
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-user"></i>
                    <label for="username"><b>Username</b></label>
                </td>
                <td>
                    <input type="text" placeholder="Enter Username" name="username" id="username" required value="${loggedInUsername}" readonly="readonly" />
                    <span id="usernameError" class="error-message"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fa fa-envelope"></i>
                    <label for="email"><b>Email ID</b></label>
                </td>
                <td>
                    <input type="email" placeholder="Enter email" name="email" id="email" required />
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fas fa-clipboard"></i>
                    <label for="leaveType"><b>Leave Type</b></label>
                </td>
                <td>
                    <select id="leaveType" name="leaveType">
                        <c:forEach items="${leavetypes}" var="leavetype1">
                <option value="${leavetype1.leavetype}">${leavetype1.leavetype}</option>
            </c:forEach> 
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fas fa-calendar"></i">
                    <label for="startDate"><b>Start Date</b></label>
                </td>
                <td>
                    <input type="date"  name="startDate" id="startDate" required />
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fas fa-calendar"></i">
                    <label for="endDate"><b>End Date</b></label>
                </td>
                <td>
                    <input type="date"  name="endDate" id="endDate" required />
                </td>
            </tr>
            <tr>
                <td>
                    <i class="fas fa-comment"></i>
                    <label for="reason"><b>Reason For Leave</b></label>
                </td>
                <td>
                    <textarea name="reason" placeholder="Reason for Leave" rows="4" required></textarea>
                </td>
            </tr>
            
            
        </table>
        <input type="submit" value="Submit" />
        
    </form>
</body>

</html>