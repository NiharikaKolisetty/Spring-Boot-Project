<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Employee Leave History</title>
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
    a.cancel-button {
    background-color:blue;
    color: #fff; /* White text color */
    padding: 5px 10px;
    border: none;
    border-radius: 5px;
    text-decoration: none;
}

a.cancel-button:hover {
    background-color: dark blue; 
}
   

</style>
</head>
<body>
     <jsp:include page="empnav.jsp"></jsp:include>
    <div class="Employee-list">
        <table>
            <h1 style="text-align: center; color: Blue; font-weight: bold;">LEAVE HISTORY</h1>
            <br>
            <tr>
                <th>Name</th>
                <th>Username</th>
                <th>Email</th>
                <th>Leave Type</th>
                <th>Reason</th>
                <th>Actions</th>
            </tr>
            <c:forEach items="${leaveRequests}" var="request">
                <tr>
                    <td><c:out value="${request.name}" /></td>
                    <td><c:out value="${request.username}" /></td>
                    <td><c:out value="${request.email}" /></td>
                    <td><c:out value="${request.leaveType}" /></td>
                    <td><c:out value="${request.reason}" /></td>
                    <td>
                        <c:choose>
                            <c:when test="${request.canceled}">
                                <span class="canceled-message">Canceled</span>
                            </c:when>
                            <c:when test="${request.status eq 'approved'}">
                                <span class="approved-message">Approved</span>
                            </c:when>
                            <c:when test="${request.status eq 'rejected'}">
                                <span class="rejected-message">Rejected</span>
                            </c:when>
                            <c:otherwise>
                                <a class="cancel-button" href="<c:url value='/employee/cancelLeaveRequest?requestId=${request.leaveformid}' />">Cancel</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
