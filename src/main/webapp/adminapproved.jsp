<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Approved Leaves</title>
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

        .approved-list {
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

        th, td {
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
        
         .approved-status {
            color: green;
            font-weight: bold;
        }
    </style>
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>

<div class="approved-list">
<h1 style="color:green; text-align: center;">Approved Leaves</h1>
<br>
    <table>
        <thead>
            <tr>
                <th>Name</th>
                <th>Email</th>
                <th>Leave Type</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Reason</th>
                <th>Status</th>
            </tr>
        </thead>
        <tbody>
             <c:forEach items="${approvedLeaves}" var="leave">
                <tr>
                    <td>${leave.name}</td>
                    <td>${leave.email}</td>
                    <td>${leave.leaveType}</td>
                    <td>${leave.startDate}</td>
                    <td>${leave.endDate}</td>
                    <td>${leave.reason}</td>
                     <td class="${leave.approved == true ? 'approved-status' : ''}">
                        ${leave.approved == true ? 'Approved' : ''}
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>