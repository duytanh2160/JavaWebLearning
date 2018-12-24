<%--
  Created by IntelliJ IDEA.
  User: Anh Duy
  Date: 11/30/2018
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String login = (String)session.getAttribute("login");
    String user = request.getParameter("user");
%>

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
    <form id= "form" action="Login" method="post" class="container">
        <label for="user"><b>UserName</b></label>
        <input type="text" name="user" required><br>

        <label for="pass"><b>Password</b></label>
        <input type="password" name="pass" autocomplete="new-password" required><br>

        <div id="register_div" style="display:none">
            <label for="repeat_pass"><b>Repeat Password</b></label>
            <input type="password" name="repeat_pass"><br>
        </div>

        <input type="submit" value="Login" class="btn">
        <p id="register_text" style="padding-top: 20px; text-align: center">Dont have an account ? <a href="javascript:register()">Register</a></p>
    </form>

</div>
</body>

<script>
    function register(){
        var but = document.getElementsByClassName('btn');
        var form = document.getElementById('form')
        var text = document.getElementById('register_text');
        var regDiv = document.getElementById('register_div')
        var repeatPass_field = document.getElementsByName('repeat_pass');

        text.innerHTML = "Already have an account ? <a href=\"javascript:login()\">Login</a>";
        but[0].value = "Register";
        form.action = "Register";
        regDiv.style.display = "block";
        repeatPass_field[0].required = true;
    }


    function login(){
        var but = document.getElementsByClassName('btn');
        var form = document.getElementById('form')
        var text = document.getElementById('register_text');
        var regDiv = document.getElementById('register_div')
        var repeatPass_field = document.getElementsByName('repeat_pass');


        text.innerHTML = "Dont have an account ? <a href=\"javascript:register()\">Register</a>";
        but[0].value = "Login";
        form.action = "Login";
        text.style.display = "block";
        regDiv.style.display = "none";
        repeatPass_field[0].required = false;
    }


    setTimeout(function(){
        if('<%=user%>' != "null"){
            alert("Register Complete !")
            var a = document.querySelectorAll('input');
            a[0].value = '<%=user%>';
            a[1].value = "";
        }
    }, 500);



</script>



</html>
