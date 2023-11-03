<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
h1{
text-align : center;
margin-top : 200px;
}
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

    .Employee-list {
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
</style>
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>
<div class="Employee-list">
    <a href="adminaddmanager" class="add-button">Add Manager</a>
    
    <table>
        <tr>
            <th>Manager ID</th>
            <th>UserName</th>
            <th>Password</th>
        </tr>
        <c:forEach items="${managers}" var="managerItem">
            <tr>
                <td>${managerItem.managerid}</td>
                <td>${managerItem.username}</td>
                <td>${managerItem.password}</td>
            </tr>
        </c:forEach>
    </table>
</div>

</body>
</html>