<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</style>
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>

    <form action="addLeaveType" method="post">
        <h1>Add Leave Form</h1>
        
        <div style="text-align: center;">
        <c:choose>
            <c:when test="${not empty successMessage}">
                <div class="alert alert-success" style="color: green; font-weight: bold;">
                    ${successMessage}
                    <br>
                    <b><a href="${goBackLink}" style="color: red; text-decoration: none;">Go back</a></b>
                </div>
            </c:when>
            <c:otherwise>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger" style="color: red; font-weight: bold;">
                        ${errorMessage}
                    </div>
                </c:if>
            </c:otherwise>
        </c:choose>
    </div>
        <table>
            <tr>
                <td>
                    <i class="fa fa-user"></i>
                    <label for="leavetype"><b>Leave Type</b></label>
                </td>
                <td>
                    <input type="text" placeholder="Enter leavetype " name="leavetype" id="leavetype" required />
                </td>
            </tr>

            <tr>
                <td>
                    <i class="fa fa-user"></i>
                    <label for="Description"><b>Description</b></label>
                </td>
                <td>
                    <input type="text" placeholder="Enter Description" name="description" id="Description" required />
                </td>
            </tr>

            <tr>
                <td>
                    <i class="fas fa-calendar"></i>
                    <label for="createdDate"><b>Created Date</b></label>
                </td>
                <td>
                    <input type="date" name="createdDate" id="createdDate" required />
                </td>
            </tr>

            
        </table>
        <input type="submit" value="Submit" />
    </form>
</body>
</html>