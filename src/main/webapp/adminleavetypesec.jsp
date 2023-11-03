<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
* {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Times New Roman', Times, serif;
    }

    body {
      margin: 0;
      padding: 0;
    }

    .leave-type {
      margin-top: 130px;
      padding: 50px;
      background-color: #d7dce6;
      border-radius: 20px;
      margin-left: 300px;
      margin-right: 30px;
    }

    table {
      font-family: Arial, sans-serif;
      border-collapse: collapse;
      width: 100%;

    }

    th,
    td {
      border: 1px solid #dcd3e9;
      text-align: left;
      padding: 8px;
    }

    th {
      background-color: #b4bbc9;
    }

    tr:nth-child(even) {
      background-color: #f2f2f2;
    }

    .add-button {
      display: inline-block;
      background-color: black;
      color: #fff;
      padding: 10px 20px;
      justify-content: center;
      text-decoration: none;
      border-radius: 5px;
      cursor: pointer;
      margin-left: 380px;
      margin-bottom: 30px;
      

}
a.delete-button {
    background-color: #ff3333;
    color: #fff;
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
    margin-right: 5px;
}


a.update-button {
    background-color: #009933;
    color: #fff;
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
}


a.delete-button:hover, a.update-button:hover {
    opacity: 0.8;
}
</style>	
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>
<div class="leave-type">
    <a href="adminaddleave" class="add-button">Add Leave</a>
  <table>
            <tr>
                <th>Leave ID</th>
                <th>Leave Type</th>
                <th>Description</th>
                <th>Created Date</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${leavetypes}" var="leavetype1">
                <tr>
                    <td>${leavetype1.leaveid}</td>
                    <td>${leavetype1.leavetype}</td>
                    <td>${leavetype1.description}</td>
                    <td>${leavetype1.createdDate}</td>
                    <td>
            <a href="<c:url value='deleteLeaveType/${leavetype1.leaveid}' />" class="delete-button">Delete</a>
            <a href="#" class="update-button">Update</a> <!-- Link to update department -->
        </td>
                </tr>
            </c:forEach>
        </table>
</div>
</body>
</html>