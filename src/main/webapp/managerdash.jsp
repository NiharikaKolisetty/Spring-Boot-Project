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

    .Manager-List {
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

     .action-buttons {
            display:inline-flex;
            border: none;
        }

        .action-buttons a {
            text-align: center;
            padding: 5px 10px;
            margin-right: 5px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
        }

        .approved-button {
            background-color: #009933;
        }

        .rejected-button {
            background-color: #ff3333;
        }

        .approved-button:hover, .rejected-button:hover {
            opacity: 0.8;
        }
</style>
</head>
<body>
<jsp:include page="managernav.jsp"></jsp:include>
<div class="Manager-List">
 <h1 style="color: Green; text-align: center;">Pending Leave Requests</h1>
 <br>
    <table>
        <thead>
            <tr>
                <th>Leave Request ID</th>
                <th>Name</th>
                <th>Leave Type</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Reason</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pendingLeaveRequests}" var="leaveRequest">
                <tr>
                    <td>${leaveRequest.leaveformid}</td>
                    <td>${leaveRequest.name}</td>
                    <td>${leaveRequest.leaveType}</td>
                    <td>${leaveRequest.startDate}</td>
                    <td>${leaveRequest.endDate}</td>
                    <td>${leaveRequest.reason}</td>
                   <td class="action-buttons">
                        <c:choose>
                            <c:when test="${leaveRequest.canceled}">
                                <span class="canceled-message">Canceled</span>
                            </c:when>
                            <c:when test="${leaveRequest.approved}">
                                <span class="approved-message">Approved</span>
                            </c:when>
                            <c:when test="${leaveRequest.rejected}">
                                <span class="approved-message">Rejected</span>
                            </c:when>
                            <c:otherwise>
                                <a class="approved-button"
                                    href="<c:url value='/manager/approveLeaveRequest?requestId=${leaveRequest.leaveformid}'/>">Approve</a>
                               <a class="rejected-button"
                                    href="<c:url value='/manager/rejectLeaveRequest?requestId=${leaveRequest.leaveformid}'/>">Reject</a>
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
</body>
</html>