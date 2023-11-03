<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>View Leave Request</title>
</head>
<body>
    <jsp:include page="empnav.jsp"></jsp:include>
    <div class="leave-request-details">
        <c:if test="${not empty param.requestId}">
        <h1 style="text-align: center;">hii</h1>
            <h2>Leave Request Details</h2>
            <p><strong>Name:</strong> <c:out value="${leaveRequest.name}" /></p>
            <p><strong>Username:</strong> <c:out value="${leaveRequest.username}" /></p>
            <p><strong>Email:</strong> <c:out value="${leaveRequest.email}" /></p>
            <p><strong>Leave Type:</strong> <c:out value="${leaveRequest.leaveType}" /></p>
            <p><strong>Reason:</strong> <c:out value="${leaveRequest.reason}" /></p>
            <!-- Add more details as needed -->
        </c:if>
    </div>
</body>
</html>
