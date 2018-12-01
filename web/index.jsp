<%--
  Created by IntelliJ IDEA.
  User: Anh Duy
  Date: 11/29/2018
  Time: 10:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="true" %>
<%String login = (String)session.getAttribute("login");%>


<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
  <title>Duy Testing</title>
  <!--Bootstrap 4 & Import CSS-->
  <link href='https://fonts.googleapis.com/css?family=Aldrich' rel='stylesheet'>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

  <!--Custom CSS & Scripts-->
  <link rel="stylesheet" href="CSS/duy.css"></link>
  <script src="Scripts/MyScript"></script>

</head>





<body onload="startTime()">

<SCRIPT>
    var loginStatus = '<%=login%>';
    if(loginStatus !== 'ok'){
        window.location.href = "/Login.jsp";
    }
</SCRIPT>


<div id="LAYOUT">
  <p id="TimeBar"></p>
  <header class="imgHeader">
    <h1>So, This is a Header !</h1></header>
  <section>

    <!------------------------------------NAV-->

    <nav class="imgNav">
      <ul>
        <li><button id="buttonTEXT" onclick="showStuff('TEXT')";onmouseover="var a = document.getElementById('infoTEXT'); a.style.display = block;">Show TEXT</button></li>
        <li><button id="buttonIMAGE" onclick="showStuff('IMAGE')">Show IMAGE</button></li>
        <li><button id="buttonTABLE" onclick="showStuff('TABLE')">Show TABLE</button></li>
        <li><button id="buttonLIST" onclick="showStuff('LIST')">Show LIST</button></li>
        <li><button id="buttonURL" onclick="showStuff('URL')">Show URL</button></li>
        <li><button id="buttonTIME" onclick="showStuff('TIME'); if(Notification.permission !== 'granted')Notification.requestPermission();">Show TIME</button></li>
        <li><button id="buttonFUNBUTTON" onclick="showStuff('FUNBUTTON')">Show FUNBUTTON</button></li>
        <li><button id="buttonINFINITYBUTTON" onclick="showStuff('INFINITYBUTTON')">Show INFINITYBUTTON</button></li>
        <!--<li><button id="buttonLAYOUT" onclick="showStuff('LAYOUT')">Show LAYOUT</button></li>-->
        <!--<li><button id="buttonLOGINFORM" onclick="showStuff('LOGINFORM')">Show LOGINFORM</button></li>-->
        <li><form action="Logout" method="post">
          <input id="logoutButton" type="submit" value="LOG OUT">
        </form></li>
      </ul>
    </nav>




    <!------------------------------------ARTICLE-->


    <article class="imgArticle">
      <div id="infoTEXT" style="display:none; width: 100px; height: 100px;">
        <p>Showing text example</p>
      </div>



      <div class="center" id="TEXT">
        <a target="_parent" href="http://localhost/"><p id="duy">Hello</p></a>
        Size: <input type="number" name="textSize" id="form" value="5"><br>
        <button onclick="changeText()">TEST</button>
        <button onclick="test()" onmouseover="test()">Change text size</button>
        <hr />
      </div>



      <div class="center" id="IMAGE">
        <img id="image" src="Drawable/0.jpg" width="30%"></img> <br>
        <button onclick="changeImage()">Change image</button>
      </div>



      <div id="TABLE">
        <div style="height: 70px; width: auto;height:auto;float:left;">
          <div style="height: 70px; width: 50px; float: left;">Ho<br />Ten<br />MSSV</div>
          <div style="float: left;">
            <input id="ho" type="text" value="a" /><br />
            <input id="ten" type="text" value="b" /><br />
            <input id="mssv" type="text" value="c" />
          </div>
        </div>

        <div style="clear:both; padding-top:20px;"><button onclick="AddRow()">Add Row</button></div>

        <div style="clear:both;padding-top:30px;">
          <table style="margin:auto" id="sinhvien">
            <tbody>
            <tr>
              <th>Ho</th>
              <th>Ten</th>
              <th>MSSV</th>
            </tr>
            <tr>
              <td>Tran</td>
              <td>Anh Duy</td>
              <td>2152160</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>




      <div id="LIST">
        <ul class="list">
          <li><a href="#">Mot</a></li>
          <li><a href="#">Hai</a></li>
          <li><a href="#">Ba</a></li>
          <li><a href="#">Bon</a></li>
        </ul>
        <hr />
      </div>




      <div id="URL">
        <span>http://</span>
        <input type="text" id="path"></input><br>
        <button onclick="changeURL()">Change Url</button>
        <iframe width="100%" height="70%" name="iframe_test" id="duyf" src="http://projectweb.gearhostpreview.com/"></iframe>
        <hr />
      </div>




      <div id="TIME">
        <audio id="sound">
          <source src="Drawable/good.mp3" type="audio/mpeg">
          Your browser does not support the audio element.
        </audio>
        H:<input type="text" id="hour" /><br />
        M:<input type="text" id="min" /><br />
        <button onclick="isBoong = false;document.getElementById('time').innerHTML = 'Alarm set!';">Set Alarm</button>
        <p id="time">TIME</p>
      </div>



      <div id="FUNBUTTON">
        <button id="bt1" onmouseover="document.getElementById('bt1').style.display = 'none'; document.getElementById('bt2').style.display = 'block';" onclick="    document.getElementById('funbuttontext').innerHTML = 'Well you use Console you little CHEATER';">Click if you're not gay</button>
        <button id="bt2" style="margin-left:200px;display:none" onmouseover="document.getElementById('bt1').style.display = 'block'; document.getElementById('bt2').style.display = 'none';" onclick="document.getElementById('funbuttontext').innerHTML = 'Well you use Console you little CHEATER';">Click if you're not gay</button>
        <p id="funbuttontext"></p>
      </div>



      <div id="INFINITYBUTTON">
        <button id="infb_b0" onclick="InfinityButton(this)">Click me</button>
        <p id="infb_0"></p>
      </div>




    </article>
  </section>


  <!------------------------------------FOOTER-->


  <footer class="imgFooter"><p>...and This is a Footer</p></footer>
</div>

<script>
    document.getElementById('TEXT').style.display = 'none';
    document.getElementById('IMAGE').style.display = 'none';
    document.getElementById('TABLE').style.display = 'none';
    document.getElementById('LIST').style.display = 'none';
    document.getElementById('URL').style.display = 'none';
    document.getElementById('TIME').style.display = 'none';
    document.getElementById('FUNBUTTON').style.display = 'none';
    document.getElementById('INFINITYBUTTON').style.display = 'none';
    //document.getElementById('LAYOUT').style.display = 'none';
    //document.getElementById('LOGINFORM').style.display = 'none';
</script>
</body>
</html>
