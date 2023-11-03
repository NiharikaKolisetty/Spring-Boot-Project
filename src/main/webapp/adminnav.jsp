<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">

<head>
    <meta charset="UTF-8" />
    <title>Responsive Drop Down Navigation Menu</title>
    <link href="https://unpkg.com/boxicons@2.0.7/css/boxicons.min.css" rel="stylesheet" />
    <!-- Font Awesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
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
            background: #666;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
        }

        .custom-logo a {
            font-size: 30px;
            color: #ccc;
            text-decoration: none;
            font-weight: 600;
            display: block;
        }

        .custom-nav-links {
            line-height: 60px;
            height: 100%;
        }

        .custom-links {
            display: flex;
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
            color: rgb(255, 255, 255);
            font-size: 15px;
            font-weight: 500;
        }

        .custom-links li:hover .custom-arrow {
            transform: rotate(180deg);
        }

        .custom-sub-menu {
            position: absolute;
            top: 60px;
            right: 0;
            line-height: 40px;
            background: #666;
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
            color: white;
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
            background: #666;
            padding-top: 0;
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
            color: #fff;
            display: flex;
            align-items: center;
            padding: 20px 30px;
            transition: background-color 0.2s;
        }

        .sidebar a i {
            margin-right: 10px;
        }

        .sidebar a:hover {
            background-color: #333;
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

        .flex-item {
            width: calc(30% - 20px);
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

        .dropdown {
            list-style: none;
            padding: 0;
        }

        .dropdown a {
            text-decoration: none;
            color: white;
        }

        #dropdown-content {
            display: none;
            position: absolute;
            background: #666;
            border: none;
        }

        #dropdown-content li {
            margin: 0;
            padding: 0;
        }

        #dropdown-content a {
            text-decoration: none;
            color: #fff;
            display: flex;
            align-items: center;
            padding: 20px 49px;
            transition: background-color 0.2s;
        }

        #dropdown-content li:last-child {
            border-bottom: none;
        }

        #dropdown-trigger:hover #dropdown-content {
            display: block;
        }

        .custom-arrow {
            display: inline-block;
            width: 0;
            height: 0;
            border-left: 5px solid transparent;
            border-right: 5px solid transparent;
            border-top: 5px solid white;
            margin-left: 5px;
            transition: transform 0.3s;
        }
    </style>
</head>

<body>
    <nav>
        <div class="custom-navbar">
            <div class="custom-logo"><a href="">AdminDashBoard</a></div>
            <div class="custom-nav-links">
                <ul class="custom-links">
                    <li>
                        <a href="#"><i class="fas fa-sign-out-alt"></i> Log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="sidebar">
        <ul>
            <li>
                <a href="admindash"><i class="bx bxs-home"></i> DashBoard</a>
            </li>
            <li>
                <a href="adminmanagersec"><i class="fas fa-file-alt"></i>Manager Section</a>
            </li>
            <li>
                <a href="admindeptsec"><i class="fas fa-times"></i>Department Section</a>
            </li>
            <li>
                <a href="adminleavetypesec"><i class="fas fa-history"></i>Leave Types</a>
            </li>
        </ul>
        <ul class="dropdown">
            <li>
                <a href="#" id="dropdown-trigger">
                    <i class="fas fa-calendar"></i> Managing Leave&nbsp;&nbsp;&nbsp;&nbsp;<i
                        class="fas fa-chevron-down"></i>
                </a>
                <ul id="dropdown-content">
                    <li><a href="adminapproved"><i class="fas fa-check-circle"></i> Approved Leaves</a></li>
                    <li><a href="adminrejected"><i class="fas fa-times-circle"></i> Rejected Leaves</a></li>
                    <li><a href="admincanceled"><i class="fas fa-clock"></i> Canceled Leaves</a></li>
                    <li><a href="adminleavehis"><i class="fas fa-history"></i> Leave History</a></li>
                </ul>
            </li>
        </ul>
    </div>
</body>
<script>
    const dropdownTrigger = document.getElementById('dropdown-trigger');
    const dropdownContent = document.getElementById('dropdown-content');

    dropdownTrigger.addEventListener('click', function (e) {
        e.preventDefault();
        dropdownContent.style.display = (dropdownContent.style.display === 'block') ? 'none' : 'block';
    });
</script>

</html>