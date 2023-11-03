<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
 .flex-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
        align-items: flex-start;
        padding: 10px;
        margin-top: 100px;
        margin-left: 260px;
      }

      /* Style for individual flex items */
      .flex-item {
        width: calc(30% - 20px); /* Adjust the width as needed */
        margin-top: 10px;
        background-color: #f0f0f0;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
        padding: 20px;
      }

      .flex-item h2,
      p {
        text-align: left;
      }
</style>
</head>
<body>
<jsp:include page="adminnav.jsp"></jsp:include>
 <div class="flex-container">
 <div class="flex-item">
            <h2><i class="fas fa-user"></i> Available Managers</h2>
            <br>
            <p>Total No Of Managers Count: ${noofmanagers}</p>
        </div>
        <div class="flex-item">
           <h2><i class="fas fa-building"></i> Available Departments</h2>
           <br>
            <p>Total No Of Departments Count: ${countDepartments}</p>
        </div>
        <div class="flex-item">
            <h2><i class="fas fa-suitcase"></i> Available Leave Types</h2>
            <br>
             <p>Total No Of Leave Types Count: ${countLeaveTypes}</p>
        </div>
        <div class="flex-item">
            <h2><i class="fas fa-times-circle"></i>Canceled Leaves</h2>
            <br>
            <p>Canceled Leave Count: ${countCanceledLeaves} </p>
        </div>
        <div class="flex-item">
           <h2><i class="fas fa-check-circle"></i> Approved Leaves</h2>
           <br>
            <p>Approved Leave Count: ${countApprovedLeaves}</p>
        </div>
        <div class="flex-item">
            <h2><i class="fas fa-times-circle"></i> Rejected Leaves</h2>
            <br>
             <p>Rejected Leave Count: ${countRejectedLeaves}</p>
        </div>
        </div>
</body>
</html>