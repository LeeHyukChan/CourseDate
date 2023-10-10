
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<title>K-Koding 맛집 리스트도 | Main</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j7f8jzk31x&submodules=geocoder"></script>

<!-- favicon.ico 404 (Not Found) -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<!-- Bulma CSS링크 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
<!-- Font Awesome CSS --><%@ page language="java"
	contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<title>K-Koding 맛집 리스트도 | Main</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j7f8jzk31x&submodules=geocoder"></script>

<!-- favicon.ico 404 (Not Found) -->
<link rel="icon" href="data:;base64,iVBORw0KGgo=">

<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap"
	rel="stylesheet">
<!-- Bulma CSS링크 -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
<!-- Font Awesome CSS -->
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- jQuery -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
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
<body>
		<div class="box">
		   <nav class="navbar" role="navigation" aria-label="main navigation">
	        <div class="navbar-brand">
	            <a class="navbar-item" href="matjibLoginOk2.jsp" >
	                너가 좋아
	            </a>
	        </div>
	        <div id="navbarBasicExample" class="navbar-menu">
	            <div class="navbar-start">
	                <a href="placeList2.jsp" class="navbar-item">
	                    맛집 찾기
	                </a>
	                <a href="matjibPost.jsp" class="navbar-item">
	                    맛집 추천
	                </a>
	            </div>
	        </div>
	    </nav>
	    <section class="section is-medium">
	        <h1 class="title">서로서로 공유하는 데이트코스</h1>
	        <h2 class="subtitle">
	            특별한 <strong>데이트 코스</strong>가 있다면 모두에게 공유해주세요!
	        </h2>
	    </section>
	    <section class="section">
	        <div class="container">
	            <div class="box" style="max-width: 480px;margin:auto">
	          	<%
	

		
	%>
	<h2>
		회원님 환영합니다.
	</h2>
	<hr>
	<a href="service01.jsp">다른 유저를 팔로우하고 데이트 코스 공유 !</a>
	<br><br>
	<a href="service02.jsp">나만의 데이트 코스 만들기 ! </a>
	<br><br>
	<a href="service03.jsp">현재 유행하는 전시확인 !</a>
	<br><br>
	<a href="service04.jsp">이색 데이트코스 ! </a>
	<br><br>
	<a href="review.jsp">후기 & 리뷰 </a>
	<br>
	<br><br><br><br>
	<a href="matjibLogin.jsp">로그아웃</a>
	<br>
	
     
	               
	            </div>
	        </div>
	    </section>
	    </div>    
	
	
</body>
</html>