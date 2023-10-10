	<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
	<%@ include file = "ssi.jsp" %>
	
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
	    
	    <!-- CSS 코드 추가 -->
<style>
    .container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
        grid-gap: 20px;
    }

    .container img {
        width: 100%;
        height: 200px;
    }
    
	
	   .image-container {
            position: relative; /* 컨테이너를 기준으로 자식 요소들을 배치 */
            display: inline-block; /* 이미지와 텍스트가 한 줄에 표시되도록 함 */
        }

        /* 이미지 */
        .image-container img {
            width: 200px; /* 이미지 너비 */
            height: 200px; /* 이미지 높이 */
        }

        /* 텍스트 */
        .image-text {
            position: absolute; /* 이미지 컨테이너를 기준으로 위치를 조정 */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0; /* 초기에 투명하게 설정 (마우스를 올리기 전까지 보이지 않음) */
            background-color: rgba(0, 0, 0, 0.7); /* 배경색과 투명도 설정 */
            color: #fff; /* 텍스트 색상 */
            font-size: 18px; /* 텍스트 크기 */
            cursor: pointer; /* 클릭 가능한 요소로 설정 */
        }

        /* 이미지 컨테이너에 마우스를 올렸을 때 텍스트 나타나도록 설정 */
        .image-container:hover .image-text {
            opacity: 1; /* 투명도를 1로 변경하여 텍스트가 보이도록 함 */
        }
</style>


	</head>
	<body>
	<% String name = request.getParameter("name"); %> 
	<div class="box">
	    <nav class="navbar" role="navigation" aria-label="main navigation">
	        <div class="navbar-brand">
	            <a class="navbar-item" href="matjibLoginOk.jsp?name=<%=name%>">
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
        
        <a href="temaCafe.jsp?name=<%= name %>" class="image-container">
        <img src="images/01.jpeg" alt="이미지2">
        <div class="image-text">테마 카페 탐방</div>
        
         <a href="temaPark.jsp?name=<%= name %>" class="image-container">
        <img src="images/02.jpeg" alt="이미지2">
        <div class="image-text">테마 공원 데이트</div>
        
         <a href="temaFood.jsp?name=<%= name %>" class="image-container">
        <img src="images/03.jpeg" alt="이미지2">
        <div class="image-text">랜선 요리 클래스</div>
        
         <a href="temaStar.jsp?name=<%= name %>" class="image-container">
        <img src="images/04.png" alt="이미지2">
        <div class="image-text">별보기 데이트</div>
        
         <a href="temaHistory.jsp?name=<%= name %>" class="image-container">
        <img src="images/05.jpeg" alt="이미지2">
        <div class="image-text">역사적인 장소 탐방</div>
        
         <a href="temaMusical.jsp?name=<%= name %>" class="image-container">
        <img src="images/06.jpeg" alt="이미지2">
        <div class="image-text">뮤지컬이나 오페라 감상</div>
        
         <a href="temaAnimal.jsp?name=<%= name %>" class="image-container">
        <img src="images/07.jpeg" alt="이미지2">
        <div class="image-text">야간 동물원 데이트</div>
        
         <a href="temaArt.jsp?name=<%= name %>" class="image-container">
        <img src="images/08.jpeg" alt="이미지2">
        <div class="image-text">예술 클래스</div>
        
         <a href="temaCicycle.jsp?name=<%= name %>" class="image-container">
        <img src="images/09.jpeg" alt="이미지2">
        <div class="image-text">자전거 데이트</div>
        
         <a href="temaFarm.jsp?name=<%= name %>" class="image-container">
        <img src="images/10.jpeg" alt="이미지2">
        <div class="image-text">농장 체험 데이트</div>    
   	 </a>
    </div>

  
    
    
    
</section>

	        
		
	</div>

	    	
	</body>
	</html>
	
