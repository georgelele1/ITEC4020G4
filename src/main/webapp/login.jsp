<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    //session authenticator
    HttpSession s = request.getSession(true);

    if(s.getAttribute("username")!=null){
        response.sendRedirect("loggedIn");
    }

%>


<!DOCTYPE html>
<html>
<head>

    <!-- Disables the user from printing the page -->
    <style type="text/css" media="print">
        * { display: none; }
    </style>
    <style>
        #uname{
            width:50%;
            font-weight:bold;
        }
        #pass{
            width:50%;
            font-weight:bold;
        }
        input[type=text], select {
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;

        }

        input[type=submit] {
            width: 50%;
            background-color: #b0951f;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 10px;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #002aa9;
        }

        div {
            border-radius: 10px;
            background-color: #ffffff;
            padding: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="password" i] {
            -webkit-text-security: disc !important;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        h1{
            font-family: "Times New Roman";
            font-weight: bold;
            color: #b0951f;
        }
        h3{
            font-family: "Times New Roman";
            font-weight: bold;
            color: #b0951f;
        }
        #bolder{
            background-color: blue;
        }
    </style>
    <meta charset="ISO-8859-1">
    <title>Login</title>
</head>
<body>

<div id="bolder" align="left">
    <h3>Group 4</h3>
    <h1>ITEC4020 Group4 Assignment2</h1>

</div>

<div style="padding-left:25%; padding-right:25%;">
    <form action="Login" method="post">
        <label for="uname"> Enter username :</label>
        <input type="text" name="username"  id="uname" placeholder="Your username.."> <br>
        <label for="pass"> Enter password :</label>
        <input type="password" name="password" id="pass" placeholder="Your password.."><br>
        <input type="submit" value="Login">
    </form>
</div>

</body>
</html>


