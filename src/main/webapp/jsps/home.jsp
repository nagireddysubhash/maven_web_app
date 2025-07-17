<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>KK FUNDA Home Page</title>
    <link href="images/kkfunda.jpg" rel="icon">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #dfe9f3, #ffffff);
            color: #333;
            margin: 0;
            padding: 0;
        }

        header {
            background: linear-gradient(to right, #0072ff, #00c6ff);
            color: white;
            padding: 20px;
            text-align: center;
            border-bottom: 5px solid #005f99;
        }

        h1, h2, h3 {
            margin: 10px 0;
        }

        .content {
            padding: 30px;
            max-width: 900px;
            margin: auto;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 12px;
            margin-top: 20px;
        }

        .info-box {
            background-color: #f0f9ff;
            border: 1px solid #cfe2f3;
            padding: 15px;
            margin-top: 20px;
            border-radius: 8px;
        }

        .info-box h3 {
            color: #0072ff;
        }

        .footer {
            text-align: center;
            background-color: #e0f0ff;
            padding: 20px;
            font-size: 14px;
            border-top: 3px solid #0072ff;
            margin-top: 40px;
        }

        .contact {
            text-align: center;
            margin-top: 30px;
        }

        .contact img {
            width: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        a {
            color: #0056b3;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        hr {
            border: 0;
            height: 2px;
            background: #0072ff;
            margin: 30px 0;
        }
    </style>
</head>
<body>

<header>
    <h1>Welcome to KK DevOps Telugu & English </h1>
    <h2>KK FUNDA</h2>
</header>

<div class="content">

    <div class="info-box">
        <h3>Server Side IP Address</h3>
        <% 
        String ip = "";
        InetAddress inetAddress = InetAddress.getLocalHost();
        ip = inetAddress.getHostAddress();
        out.println("Server Host Name: <strong>" + inetAddress.getHostName() + "</strong><br>"); 
        out.println("Server IP Address: <strong>" + ip + "</strong>"); 
        %>
    </div>

    <div class="info-box">
        <h3>Client Side IP Address</h3>
        <% 
        out.println("Client IP Address: <strong>" + request.getRemoteAddr() + "</strong><br>");
        out.println("Client Host Name: <strong>" + request.getRemoteHost() + "</strong>"); 
        %>
    </div>

    <hr>

    <div class="contact">
        <img src="images/kkfunda.jpg" alt="KK FUNDA Logo">
        <p>
            <strong>KK FUNDA</strong><br>
            Martha Halli, Bangalore<br>
            +91-9676831734<br>
            <a href="mailto:kkeducationblr@gmail.com">kkeducationblr@gmail.com</a><br>
            <a href="mailto:kkeducation@gmail.com">Mail to KK FUNDA</a>
        </p>
    </div>

    <hr>

    <p><strong>Service:</strong> <a href="services/employee/getEmployeeDetails">Get Employee Details</a></p>
</div>

<div class="footer">
    <p>KK FUNDA Training & Development Center</p>
    <p><small>&copy; 2024 by <a href="https://www.google.com/">KK FUNDA</a></small></p>
</div>

</body>
</html>
