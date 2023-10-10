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
        /* 기존 스타일들 유지하고 추가/수정할 부분 */
        .cafe-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
        }

        .cafe-section {
            width: 100%; /* 한 줄에 한 개의 섹션 */
            margin-bottom: 30px;
            padding: 10px;
            border: 1px solid #ddd;
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            align-items: center;
        }

        .cafe-image {
            max-width: 420px; /* 이미지의 최대 너비를 50%로 설정 */
            max-height: 400px; /* 이미지의 최대 높이를 50%로 설정 */
            object-fit: cover;
            cursor: pointer; /* 커서를 포인터로 변경하여 클릭 가능함을 나타냄 */
        }

        .cafe-info {
            max-width: 40%; /* 카페 설명 영역의 최대 너비를 45%로 설정 */
            display: none; /* 처음에는 설명을 숨김 */
            animation: slideDown 0.5s ease; /* 슬라이드 애니메이션 적용 */
        }
		
		.cafe-info.show {
            display: block;
        }
		
        /* 슬라이드 애니메이션을 위한 키프레임 */
        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
	
	
	        
	<script>
	       
	    </script>

</head>
<body>
<div class="box">
     <% String name = request.getParameter("name"); %>
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="matjibLoginOk.jsp?name=<%= name %>">
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

<!-- temaFarm 1 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe1" onclick="sign_up(1); toggleDescription(1);">
        <img src="images/temaFarm1.jpeg" alt="카페 1" class="cafe-image">
        <p id="cafe1-text" style="margin-right: 200px;">팜랜드</p> <!-- 이미지를 클릭하기 전에 보이는 텍스트 -->
        <div class="cafe-info" id="cafe1-info" style="margin-right: 100px">
            <p id="cafe1-gname">팜랜드</p>
            <p id="cafe1-gplace">서울 농업기술센터</p>
            <p id="cafe1-gcontent">팜랜드 테마 농장입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 2 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe2" onclick="sign_up(2); toggleDescription(2);">
        <img src="images/temaFarm2.jpeg" alt="카페 2" class="cafe-image">
        <p id="cafe2-text" style="margin-right: 200px;">서울 농업기술센터</p> <!-- 이미지를 클릭하기 전에 보이는 텍스트 -->
        <div class="cafe-info" id="cafe2-info" style="margin-right: 100px">
            <p id="cafe2-gname">서울 농업기술센터</p>
            <p id="cafe2-gplace">서울시 농업기술센터</p>
            <p id="cafe2-gcontent">농촌 체험을 할 수 있는 곳입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 3 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe3" onclick="sign_up(3); toggleDescription(3);">
        <img src="images/temaFarm3.jpeg" alt="카페 3" class="cafe-image">
        <p id="cafe3-text" style="margin-right: 200px;">종로 농협 체험농장</p>
        <div class="cafe-info" id="cafe3-info" style="margin-right: 100px">
            <p id="cafe3-gname">종로 농협 체험농장</p>
            <p id="cafe3-gplace">서울시 종로구 농협 체험농장</p>
            <p id="cafe3-gcontent">농업 체험을 즐길 수 있는 곳입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 4 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe4" onclick="sign_up(4); toggleDescription(4);">
        <img src="images/temaFarm4.jpeg" alt="카페 4" class="cafe-image">
        <p id="cafe4-text" style="margin-right: 200px;">허브나라</p>
        <div class="cafe-info" id="cafe4-info" style="margin-right: 100px">
            <p id="cafe4-gname">허브나라</p>
            <p id="cafe4-gplace">허브나라 위치</p>
            <p id="cafe4-gcontent">허브농원과 체험을 즐길 수 있는 장소입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 5 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe5" onclick="sign_up(5); toggleDescription(5);">
        <img src="images/temaFarm5.jpeg" alt="카페 5" class="cafe-image">
        <p id="cafe5-text" style="margin-right: 200px;">한국농어촌공사 청송사업지원단</p>
        <div class="cafe-info" id="cafe5-info" style="margin-right: 100px">
            <p id="cafe5-gname">한국농어촌공사 청송사업지원단</p>
            <p id="cafe5-gplace">한국농어촌공사 위치</p>
            <p id="cafe5-gcontent">농어촌 체험과 농촌 활동을 지원하는 곳입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 6 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe6" onclick="sign_up(6); toggleDescription(6);">
        <img src="images/temaFarm6.jpeg" alt="카페 6" class="cafe-image">
        <p id="cafe6-text" style="margin-right: 200px;">안성 양떼목장</p>
        <div class="cafe-info" id="cafe6-info" style="margin-right: 100px">
            <p id="cafe6-gname">안성 양떼목장</p>
            <p id="cafe6-gplace">안성시 양떼목장</p>
            <p id="cafe6-gcontent">양떼목장과 양떼체험을 즐길 수 있는 장소입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 7 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe7" onclick="sign_up(7); toggleDescription(7);">
        <img src="images/temaFarm7.jpeg" alt="카페 7" class="cafe-image">
        <p id="cafe7-text" style="margin-right: 200px;">두물머리 양떼목장</p>
        <div class="cafe-info" id="cafe7-info" style="margin-right: 100px">
            <p id="cafe7-gname">두물머리 양떼목장</p>
            <p id="cafe7-gplace">두물머리 양떼목장 위치</p>
            <p id="cafe7-gcontent">두물머리 양떼목장과 양떼체험을 즐길 수 있는 장소입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 8 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe8" onclick="sign_up(8); toggleDescription(8);">
        <img src="images/temaFarm8.jpeg" alt="카페 8" class="cafe-image">
        <p id="cafe8-text" style="margin-right: 200px;">더풍성목장</p>
        <div class="cafe-info" id="cafe8-info" style="margin-right: 100px">
            <p id="cafe8-gname">더풍성목장</p>
            <p id="cafe8-gplace">더풍성목장 위치</p>
            <p id="cafe8-gcontent">농장과 농촌 체험을 즐길 수 있는 장소입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 9 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe9" onclick="sign_up(9); toggleDescription(9);">
        <img src="images/temaFarm9.jpeg" alt="카페 9" class="cafe-image">
        <p id="cafe9-text" style="margin-right: 200px;">백호농장</p>
        <div class="cafe-info" id="cafe9-info" style="margin-right: 100px">
            <p id="cafe9-gname">백호농장</p>
            <p id="cafe9-gplace">백호농장 위치</p>
            <p id="cafe9-gcontent">농촌 활동과 체험을 즐길 수 있는 장소입니다.</p>
        </div>
    </div>
    <!-- 다른 이미지들도 동일한 방식으로 수정 -->
</div>

<!-- temaFarm 10 -->
<div class="cafe-container">
    <div class="cafe-section" id="cafe10" onclick="sign_up(10); toggleDescription(10);">
        <img src="images/temaFarm10.jpeg" alt="카페 10" class="cafe-image">
        <p id="cafe10-text" style="margin-right: 200px;">파주 채소체험농장</p>
        <div class="cafe-info" id="cafe10-info" style="margin-right: 100px">
            <p id="cafe10-gname">파주 채소체험농장</p>
            <p id="cafe10-gplace">파주시 채소체험농장</p>
            <p id="cafe10-gcontent">파주 지역의 채소체험을 할 수 있는 농장입니다.</p>
        </div>
    </div>
   


    
     

<!-- ... 이전 코드 ... -->

<script>
    function sign_up(cafe) {
        // JavaScript 코드
        let name = document.getElementById("cafe" + cafe + "-text").textContent;
        console.log(name); // 해당 카페 이름이 출력됩니다.

        $.getJSON({
            type: "POST",
            url: "temaCheck.jsp",
            data: {
                name_give: name
            },
            success: function (response) {
                document.getElementById("cafe" + cafe + "-gname").textContent = response.Gname;
                document.getElementById("cafe" + cafe + "-gplace").textContent = response.Gplace;
                document.getElementById("cafe" + cafe + "-gcontent").textContent = response.Gcontent;
            }
        });
    }

    function toggleDescription(cafe) {
        var description = document.getElementById("cafe" + cafe + "-info");
        var text = document.getElementById("cafe" + cafe + "-text");
        if (description.classList.contains("show")) {
            description.classList.remove("show");
            text.style.display = "block";
        } else {
            description.classList.add("show");
            text.style.display = "none";
        }
    }
</script>

<!-- ... 이후 코드 ... -->

 
</body>
</html>
