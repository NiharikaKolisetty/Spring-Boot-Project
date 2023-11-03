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

    </style>
</head>

<body>
    <nav>
        <div class="custom-navbar">
            <div class="custom-logo"><a href="">ManagerDashBoard</a></div>
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
                <a href="managerdash"><i class="fas fa-file-alt"></i>All Leave requests</a>
            </li>
        </ul>
    </div>
</body>
</html>