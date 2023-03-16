<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>

<%@ page import="java.io.*,java.util.*" %>

<%
    //Security code to prevent caching
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    //Authentication code
    HttpSession s = (HttpSession) request.getSession(true);

    if(s.getAttribute("username")==null){
        response.sendRedirect("login");
    }
    else if(s.getAttribute("username")!= null){
        //Set Session Max time limit in Seconds starting when page is visited
        session.setMaxInactiveInterval(120);
    }
%>

<%
    // Set refresh, autoload time as 120 seconds
    response.setIntHeader("Refresh", 120);

%>
<!DOCTYPE html>
<html>
<head>

    <!-- If you disable JavaScript you cannot enter system and this disable events such as right click -->
    <script> document.addEventListener('contextmenu', event => event.preventDefault());
    document.addEventListener('keyup', (e) => {
        if (e.key == 'PrintScreen') {
            navigator.clipboard.writeText('');
            alert('Screenshots disabled!');
        }
    });

    /** TO DISABLE PRINTS WHIT CTRL+P **/
    document.addEventListener('keydown', (e) => {
        if (e.ctrlKey && e.key == 'p') {
            alert('This section is not allowed to print or export to PDF');
            e.cancelBubble = true;
            e.preventDefault();
            e.stopImmediatePropagation();
        }
    });
    </script>

    <style>
        ::selection {
            color: none;
            background: none;
        }
        /* For Mozilla Firefox */
        ::-moz-selection {
            color: none;
            background: none;
        }
        iframe{
            max-height:400px;
            height:400px;
        }
    </style>

    <!-- Disables the user from printing the page -->
    <style type="text/css" media="print">
        * { display: none; }
    </style>

    <!-- CSS for Navigation Bar -->
    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #b0951f;
        }

        li {
            float: left;
        }

        li a {
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover {
            background-color: #002aa9;
        }

        li button{
            display: block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }
        p{
            font-size: 14px;
            margin-left: 95%;
            font-family: "Times New Roman";
            font-weight: bold;
        }
    </style>

    <meta charset="ISO-8859-1">
    <title>LoggedIn</title>
</head>
<body>
<div id="page"
     style="-moz-user-select: none; -webkit-user-select: none; -ms-user-select:none; user-select:none;-o-user-select:none;"
     unselectable="on"
     onselectstart="return false;"
     onmousedown="return false;">

    <ul>

        <li><a class="active" href="/ITEC4020G4/loggedIn">Productinfo</a></li>
        <li><a class="active" href="/ITEC4020G4/account">Accountsinfo</a></li>
        <li style="float:right">
            <form action="Logout" method="post" id="logout">
                <a class="active" href="javascript:{}" onclick="document.getElementById('logout').submit(); return false;">Log Out</a>
            </form>
        </li>

    </ul>

    <div>
        <img src="/ITEC4020G4/Images?id=1" align="left"> <!-- You need to change the location to /your.package/image -->

        <br>
        <p> <% String name=(String)s.getAttribute("username"); out.print(name); %></p>
        </form>
        <br><br>
    </div>
    <br>
    <br>
    <br>
    <br>
    <iframe src="/ITEC4020G4/xmlHandler?id=2" align="center" alt="Error in loading xml" width="100%"></iframe>

    <br>
    <br>

</div>

</body>
</html>