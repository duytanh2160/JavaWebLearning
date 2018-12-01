<%--
  Created by IntelliJ IDEA.
  User: Anh Duy
  Date: 11/30/2018
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%String login = (String)session.getAttribute("login");%>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
    <title>Login</title>
    <link href='https://fonts.googleapis.com/css?family=Aldrich' rel='stylesheet'>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <!--Custom CSS & Scripts-->
    <link rel="stylesheet" href="/CSS/Login.css"></link>
</head>
<body>
<SCRIPT>
    var login = '<%=login%>';
    if(login == 'ok'){
        window.location.href = "/"
    }
</SCRIPT>

<div class="bg-img">
    <form action="Login" method="post" class="container">
        <label for="user"><b>UserName</b></label>
        <input type="text" name="user" required><br>

        <label for="pass"><b>Password</b></label>
        <input type="password" name="pass" required><br>

        <input type="submit" value="Login" class="btn">
    </form>

</div>
</body>
</html>
