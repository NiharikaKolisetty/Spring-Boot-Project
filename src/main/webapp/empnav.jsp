	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8" />
    <title>Responsive Drop Down Navigation Menu</title>
    <link
      href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css"
      rel="stylesheet"
    />
    <!-- Font Awesome CDN Link -->
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: "Poppins", sans-serif;
      }

      body {
        min-height: 100vh;
         background-image: url(https://static.vecteezy.com/system/resources/previews/007/355/448/original/abstract-gray-molecules-structure-background-free-vector.jpg);	
      }

      .custom-navbar {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 60px;
        background: #666; /* Grey background */
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 0 20px; /* Adjust padding as needed */
      }

      .custom-logo a {
        font-size: 30px;
        color: #ccc; /* Light grey text color */
        text-decoration: none;
        font-weight: 600;
        display: block; /* To align the title */
      }

      .custom-nav-links {
        line-height: 60px;
        height: 100%;
      }

      .custom-links {
        display: flex; /* Display links in a row */
        list-style: none;
        padding: 0;
        margin: 0;
      }

      .custom-links li {
        position: relative;
        display: flex;
        align-items: center;
        list-style: none;
        padding: 0 40px;
      }

      .custom-links a {
        height: 100%;
        text-decoration: none;
        white-space: nowrap;
        color: rgb(255, 255, 255); /* Light grey text color */
        font-size: 15px;
        font-weight: 500;
      }

      .custom-links li:hover .custom-arrow {
        transform: rotate(180deg);
      }

      .custom-sub-menu {
        position: absolute;
        top: 60px;
        right: 0; /* Move the dropdown to the right */
        line-height: 40px;
        background: #666; /* Grey background */
        box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
        border-radius: 0 0 4px 4px;
        display: none;
        z-index: 2;
      }

      .custom-sub-menu li {
        padding: 0 22px;
        border-bottom: 1px solid rgba(255, 255, 255, 0.1);
      }

      .custom-sub-menu a {
        color: white; /* Light grey text color */
        font-size: 15px;
        font-weight: 500;
      }

      .custom-links li:hover .custom-sub-menu {
        display: block;
      }

      .sidebar {
        position: fixed;
        top: 60px;
        left: 0;
        width: 250px;
        height: 100%;
        background: #666; /* Grey background color */
        padding-top: 0px; /* Adjust for the height of your navbar */
        display: flex;
        flex-direction: column;
      }

      .sidebar ul {
        list-style: none;
      }

      .sidebar li {
        margin: 0;
        padding: 0;
      }

      .sidebar a {
        text-decoration: none;
        color: #fff; /* Text color white */
        display: flex;
        align-items: center;
        padding: 20px 30px;
        transition: background-color 0.2s;
      }

      .sidebar a i {
        margin-right: 10px;
      }

      .sidebar a:hover {
        background-color: #333; /* Darker grey on hover */
      }

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
    <nav>
      <div class="custom-navbar">
        <div class="custom-logo"><a href="empdashboard">EmployeeLeave</a></div>
        <div class="custom-nav-links">
          <ul class="custom-links">
            <li>
               <a href="#">${loggedInUsername}</a>
              <i class="bx bxs-chevron-down custom-arrow arrow"></i>
              <ul class="custom-sub-menu custom-menu">
                <li>
                  <a href="empprofile"
                    ><i class="fas fa-user-edit"></i> Update Profile</a
                  >
                </li>
                <li>
                  <a href="#"><i class="fas fa-sign-out-alt"></i> Log out</a>
                </li>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="sidebar">
      <ul>
        <li>
          <a href="empdashboard"><i class="bx bxs-home"></i> DashBoard</a>
        </li>
        <li class="dropdown">
          <ul class="dropdown-content">
            <li>
              <a href="empleaveform"
                ><i class="fas fa-file-alt"></i> Apply for A Leave</a
              >
            </li>
            <li>
              <a href="emphistory"><i class="fas fa-history"></i> Leave History</a>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </body>
</html>