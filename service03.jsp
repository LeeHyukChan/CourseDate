<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
<%@ include file = "ssi.jsp" %>
<%@ page import="net.hb.common.*" %>
<%@ page import="net.hb.login.*"  %>		


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
	        
	        /* 슬라이드 쇼 컨테이너 스타일 */
	.slideshow-container {
	  max-width: 1000px;
	  position: relative;
	  margin: auto;
	}
	
	/* 이미지 슬라이드 스타일 */
	.mySlides {
	  display: none;
	}
	
	/* 이미지에 텍스트 위치 및 스타일 */
	.text {
	    color: #f2f2f2;
	    font-size: 15px;
	    padding: 8px 12px;
	    position: absolute;
	    bottom: 0; /* 이 부분을 조정하여 텍스트가 그림 아래쪽에서 얼마나 떨어져서 보일지 결정합니다. */
	    width: 100%;
	    text-align: center;
	}
	
	
	/* 이미지가 아닌 div 요소를 캡션으로 사용 */
	.caption {
	  display: none;
	}
	        
	</style>
	  <!-- 추가된 CSS 코드 -->
	    <style>
	        .slideshow-container {
	            max-width: 2000px;
	            position: relative;
	            margin: auto;
	        }
	
	        .mySlides {
	            display: none;
	        }
	
	        .prev, .next {
	            cursor: pointer;
	            position: absolute;
	            top: 50%;
	            width: auto;
	            margin-top: -22px;
	            padding: 16px;
	            color: white;
	            font-weight: bold;
	            font-size: 18px;
	            transition: 0.6s ease;
	            border-radius: 0 3px 3px 0;
	        }
	
	        .next {
	            right: 0;
	            border-radius: 3px 0 0 3px;
	        }
	
	        .prev:hover, .next:hover {
	            background-color: rgba(0,0,0,0.8);
	        }
	
	        .text {
	            color: #f2f2f2;
	            font-size: 15px;
	            padding: 8px 12px;
	            position: absolute;
	            bottom: 8px;
	            width: 100%;
	            text-align: center;
	        }
	
	        .numbertext {
	            color: #f2f2f2;
	            font-size: 12px;
	            padding: 8px 12px;
	            position: absolute;
	            top: 0;
	        }
	
	        .dot {
	            cursor: pointer;
	            height: 15px;
	            width: 15px;
	            margin: 0 2px;
	            background-color: #bbb;
	            border-radius: 50%;
	            display: inline-block;
	            transition: background-color 0.6s ease;
	        }
	
	        .active, .dot:hover {
	            background-color: #717171;
	        }
	
	        .fade {
	            -webkit-animation-name: fade;
	            -webkit-animation-duration: 1.5s;
	            animation-name: fade;
	            animation-duration: 1.5s;
	        }
	
	        @-webkit-keyframes fade {
	            from {opacity: .4} 
	            to {opacity: 1}
	        }
	
	        @keyframes fade {
	            from {opacity: .4} 
	            to {opacity: 1}
	        }
	        
	         .mySlides img {
	    width: 800px; /* 이미지 너비 */
	    height: 300px; /* 이미지 높이 */
	}
	  .image-container img {
        width: 100%;
    }
	    </style>
	<style>
    /* gname 스타일 */
    .description-container p[id^="cafe"][id$="-gname"] {
        font-size: 18px;
        color: #6B1FBB;
    }

    /* gplace 스타일 */
    .description-container p[id^="cafe"][id$="-gplace"] {
        font-size: 24px;
        font-weight: bold;
        color: #333;
    }

    /* gcontent 스타일 */
    .description-container p[id^="cafe"][id$="-gcontent"] {
        font-size: 14px;
        color: #888;
    }

    /* gdate 스타일 */
    .description-container p[id^="cafe"][id$="-gdate"] {
        font-size: 12px;
        color: #555;
    }
   </style>
	<style>
</style>
	<style>
    .slide-content {
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
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
	    <div class="container">
<% 
msg = "select pname, ptype, pplace, pdate from present where pcode < 2011 ";
RS = ST.executeQuery(msg); 
int slideIndex = 1; // 슬라이드 인덱스 초기화 

while (slideIndex <= 10) {
    String pname, ptype, pplace, pdate;
    
    if (RS.next()) {
        pname = RS.getString("pname"); 
        ptype = RS.getString("ptype"); 
        pplace = RS.getString("pplace"); 
        pdate = RS.getString("pdate");
        
        String imageExtension = "jpeg"; // 기본 확장자

        String imagePath = "/images/presentImage" + slideIndex + ".png"; 
        if (application.getResource(imagePath) == null) { 
            imagePath = "/images/presentImage" + slideIndex + ".jpeg"; 
        }
        
        %>
        <div class="mySlides fade">
            <div class="slide-content">
                <img src="<%= request.getContextPath() %><%= imagePath %>" alt="<%= pname %> 이미지">
                <div class="텍스트">
                    <span style="color: #8a63d2; font-weight: bold; font-size: 18px;"><%= ptype %></span> <br>
                    <span style="font-weight: bold; font-size: 24px;"><%= pname %></span> <br>
                    <span style="color: #8a63d2; font-size: 16px;"><%= pplace %></span> <br>
                    <span style="font-size: 15px;"><%= pdate %></span>
                </div>
            </div>
        </div>
        <%
    }
    
    slideIndex++; 
} 
%>

<% 
// 나머지 슬라이드를 pname을 반복하여 출력
while (slideIndex <= 11) {
    String imagePath = "/images/presentImage" + slideIndex + ".jpeg"; 
    %>
    <div class="mySlides fade">
        <div class="slide-content">
            <img src="<%= request.getContextPath() %><%= imagePath %>" alt="Image <%= slideIndex %>" style="width: 100%;">
            <!-- 추가적인 내용을 이곳에 배치하거나 유지할 수 있습니다 -->
        </div>
    </div>
    <%
    slideIndex++; 
} 
%>


	 


				</div>
	        
	        <!-- 이전/다음 버튼 -->
	        <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
	        <a class="next" onclick="plusSlides(1)">&#10095;</a>
	    </div>
	    
	    <!-- 도트들이 여기에 생성될 것입니다. -->
	<div style="text-align: center" id="dotsContainer">
		<!-- 나머지 점들도 동일하게 추가 -->
	</div>

	</div>
			
			     <div style="display: flex; flex-direction: column; align-items: center; justify-content: center; height: 100vh;">
	        <section class="section is-medium">
	            <h1 class="title">현재 유행하는 전시: 축제: 정보를 확인해보세요 !</h1>
	            <h2 class="subtitle">
	                사랑하는  <strong>연인에게 </strong> 특별한 하루를 만들어 주세요 ! 
	            </h2>
	        </section>

		</div>
		</div>
		

<div class="container">
    <div class="image-container">
        <img src="images/presentImage1.png" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2001" class="description-container">
	        <p id="cafe2001-gname"></p>
            <p id="cafe2001-gplace"></p>
            <p id="cafe2001-gcontent"></p>
            <p id="cafe2001-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage2.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2002" class="description-container">
             <p id="cafe2002-gname"></p>
            <p id="cafe2002-gplace"></p>
            <p id="cafe2002-gcontent"></p>
            <p id="cafe2002-gdate"></p>
    </div>
</div>
<div class="container">
    <div class="image-container">
        <img src="images/presentImage3.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2003" class="description-container">
	        <p id="cafe2003-gname"></p>
            <p id="cafe2003-gplace"></p>
            <p id="cafe2003-gcontent"></p>
            <p id="cafe2003-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage4.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2004" class="description-container">
             <p id="cafe2004-gname"></p>
            <p id="cafe2004-gplace"></p>
            <p id="cafe2004-gcontent"></p>
            <p id="cafe2004-gdate"></p>
    </div>
</div>

<div class="container">
    <div class="image-container">
        <img src="images/presentImage5.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2005" class="description-container">
	        <p id="cafe2005-gname"></p>
            <p id="cafe2005-gplace"></p>
            <p id="cafe2005-gcontent"></p>
            <p id="cafe2005-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage6.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2006" class="description-container">
             <p id="cafe2006-gname"></p>
            <p id="cafe2006-gplace"></p>
            <p id="cafe2006-gcontent"></p>
            <p id="cafe2006-gdate"></p>
    </div>
</div>

<div class="container">
    <div class="image-container">
        <img src="images/presentImage7.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2007" class="description-container">
	        <p id="cafe2007-gname"></p>
            <p id="cafe2007-gplace"></p>
            <p id="cafe2007-gcontent"></p>
            <p id="cafe2007-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage8.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2008" class="description-container">
             <p id="cafe2008-gname"></p>
            <p id="cafe2008-gplace"></p>
            <p id="cafe2008-gcontent"></p>
            <p id="cafe2008-gdate"></p>
    </div>
</div>

<div class="container">
    <div class="image-container">
        <img src="images/presentImage9.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2009" class="description-container">
	        <p id="cafe2009-gname"></p>
            <p id="cafe2009-gplace"></p>
            <p id="cafe2009-gcontent"></p>
            <p id="cafe2009-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage10.png" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2010" class="description-container">
             <p id="cafe2010-gname"></p>
            <p id="cafe2010-gplace"></p>
            <p id="cafe2010-gcontent"></p>
            <p id="cafe2010-gdate"></p>
    </div>
</div>

<div class="container">
    <div class="image-container">
        <img src="images/presentImage11.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2011" class="description-container">
	        <p id="cafe2011-gname"></p>
            <p id="cafe2011-gplace"></p>
            <p id="cafe2011-gcontent"></p>
            <p id="cafe2011-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage12.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2012" class="description-container">
             <p id="cafe2012-gname"></p>
            <p id="cafe2012-gplace"></p>
            <p id="cafe2012-gcontent"></p>
            <p id="cafe2012-gdate"></p>
    </div>
</div>


<div class="container">
    <div class="image-container">
        <img src="images/presentImage13.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2013" class="description-container">
	        <p id="cafe2013-gname"></p>
            <p id="cafe2013-gplace"></p>
            <p id="cafe2013-gcontent"></p>
            <p id="cafe2013-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage14.png" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2014" class="description-container">
             <p id="cafe2014-gname"></p>
            <p id="cafe2014-gplace"></p>
            <p id="cafe2014-gcontent"></p>
            <p id="cafe2014-gdate"></p>
    </div>
</div>


<div class="container">
    <div class="image-container">
        <img src="images/presentImage15.png" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2015" class="description-container">
	        <p id="cafe2015-gname"></p>
            <p id="cafe2015-gplace"></p>
            <p id="cafe2015-gcontent"></p>
            <p id="cafe2015-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage16.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2016" class="description-container">
             <p id="cafe2016-gname"></p>
            <p id="cafe2016-gplace"></p>
            <p id="cafe2016-gcontent"></p>
            <p id="cafe2016-gdate"></p>
    </div>
</div>

<div class="container">
    <div class="image-container">
        <img src="images/presentImage17.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
	    <div id="2017" class="description-container">
	        <p id="cafe2017-gname"></p>
            <p id="cafe2017-gplace"></p>
            <p id="cafe2017-gcontent"></p>
            <p id="cafe2017-gdate"></p>
            
    </div>
    
    <!-- 다른 이미지와 설명도 동일하게 추가할 수 있습니다. -->
    
    <div class="image-container">
        <img src="images/presentImage18.jpeg" alt="이미지2">
        <div class="image-text">자세히 보려면 눌러주세요.</div>
    </div>
    
        <div id="2018" class="description-container">
             <p> <strong> 너가 좋아를 이용해주셔서 감사합니다 ! </strong> </p>
    </div>
</div>

 	
</div>
	
	<!-- 슬라이드 스크립트와 함수들 -->
	<script>
	//슬라이드 스크립트와 함수들
	let slideIndex = 1;
	showSlides(slideIndex);
	
	function plusSlides(n) {
	    showSlides(slideIndex += n);
	}
	
	function currentSlide(n) {
	    showSlides(slideIndex = n);
	}
	
	function showSlides(n) {
	    let i;
	    let slides = document.getElementsByClassName("mySlides");
	    let dots = document.getElementsByClassName("dot");
	    
	    if (n > slides.length) {
	        slideIndex = 1;
	    }
	    if (n < 1) {
	        slideIndex = slides.length;
	    }
	    
	    for (i = 0; i < slides.length; i++) {
	        slides[i].style.display = "none";
	    }
	    
	    for (i = 0; i < dots.length; i++) {
	        dots[i].classList.remove("active"); // Remove 'active' class from all dots
	    }
	    
	    slides[slideIndex - 1].style.display = "block";
	    dots[slideIndex - 1].classList.add("active"); // Add 'active' class to the current dot
	}
	

	</script>

	  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        window.onload = function() {
            // 이미지와 설명의 개수
            var numImages = 18; // 예시로 2개 사용
            var currentIndex = 1; // 현재 인덱스

            function fetchData(index) {
                var cafe = "200" + index;
                if(index>9){
                	cafe = "20" + index;
                }
                var code = document.getElementById(cafe).id;

                // 서버로 데이터 요청
                $.getJSON({
                    type: "POST",
                    url: "service03Save.jsp",
                    data: {
                        code_give: code
                    },
                    success: function (response) {
                    	var gplaceElement = document.getElementById("cafe" + code + "-gplace");
                    	
                        // gplace 값에 따라 다른 색상 적용
                        if (response.ptype === "축제") {
                            gplaceElement.style.color = "yellow"; // 축제 - 노란색
                        } else if (response.ptype === "호텔") {
                            gplaceElement.style.color = "pink"; // 호텔 - 분홍색
                        }

                        document.getElementById("cafe" + code + "-gname").textContent = response.pname;
                        gplaceElement.textContent = response.ptype;
                        document.getElementById("cafe" + code + "-gcontent").textContent = response.pplace;
                        document.getElementById("cafe" + code + "-gdate").textContent = response.pdate;
                        
                        // 다음 이미지와 설명 가져오기
                        currentIndex++;
                        if (currentIndex <= numImages) {
                            fetchData(currentIndex);
                        }
                    }
                });
            }

            // 시작
            fetchData(currentIndex);
        };
        
     // 이미지 슬라이드 개수를 가져옵니다.
        let totalSlides = document.getElementsByClassName("mySlides").length -1   ;

        // 도트들을 생성합니다.
        let dotsContainer = document.getElementById("dotsContainer");
        for (let i = 0; i < totalSlides; i++) {
            let dot = document.createElement("span");
            dot.className = "dot";
            dot.onclick = function() {
                currentSlide(i + 1);
            };
            dotsContainer.appendChild(dot);
        }

    </script>
	
		</body>
		</html>
		
