<%@ page language="java" contentType="text/html; charset=UTF-8"  %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> [openCode.jsp]</title>
  <style type="text/css">
    *{font-size:12pt; font-weight:bold;

    }      


  </style>
 <script type="text/javascript">
 <script type="text/javascript"
     src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j7f8jzk31x&submodules=geocoder"></script>

<!-- favicon.ico 404 (Not Found) -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">
<!-- Bulma CSS링크 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
<!-- Font Awesome CSS -->
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<!-- jQuery -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
<style>
 * {
     font-family: 'Jua', sans-serif;
 }

 /* container 영역 */
 .box {
     width: 1000px;
     margin: 0 auto;
 }

 /* header 영역 */

 .navbar {
     border-bottom: 1px solid #e8e8e8;
 }

 .navbar-start {
     padding-left: 400px;
     font-weight: 500;
     font-size: 20px;
 }

 .navbar-item {
     font-size: 25px;
     font-weight: 500;
 }

 /* 배너 영역 */


 /* 로그인 영역 */
 .button {
     font-size: 20px;
 }

 .is-sparta {
     color: #e8344e !important;
 }

 .button.is-sparta {
     background-color: #e8344e;
     border-color: transparent;
     color: #fff !important;
 }

 .button.is-sparta.is-outlined {
     background-color: transparent;
     border-color: #e8344e;
     color: #e8344e !important;
 }

 .help {
     color: gray;
 }

</style>

</head>
<body class=gra>

<%   String data = request.getParameter("idx");  %>


 <p>
 <div class="box" style="max-width: 480px;margin:auto">
  <form name="subform" action="openCodeSave.jsp">
    <font>아이디:</font>
        <input id="input-username" class="input"  type="text" name="userid" value="<%=data%>">
        <input type="submit" class="level-item button is-sparta is-outlined" value="중복확인"> 
  </form>
 </div>	
 
</body>
</html>





