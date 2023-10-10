<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tti.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>K-Koding 맛집 리스트</title>


    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">
    <!-- Bulma CSS링크 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
    <!-- Font Awesome CSS -->
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    
    <!-- sylesheet -->
      <style>


        /* container */
        .box {
            width: 1000px;
            height: auto;
            margin: 0 auto;
        }

        /* header 영역 */
        .navbar-start {
            padding-left: 250px;
            font-weight: 500;
            font-size: 20px;
        }

        .navbar {
            border-bottom: 1px solid #e8e8e8;
        }

        .navbar-item {
            font-size: 25px;
            font-weight: 500;
        }

        .button {
            font-size: 20px;
            margin: 0 auto;
        }

        /* 지도 영역 */
        #map {
            width: 900px;
            height: 50vh;
            margin: 20px auto 20px auto;
        }

        /* contents 영역 */
        .matjip-list {
            overflow: scroll;
            width: 100%;
            height: calc(20vh - 20px);
            position: relative;
        }

        .card-title {
            display: inline;
        }

        .matjip-title {
            font-size: 30px;
        }

        .card-text {
            margin-top: 10px;
        }

        .card-body {
            border: 1px solid rgba(255, 0, 0, 0.5);
            padding: 1.25rem;
        }

        .iw-inner {
            padding: 10px;
            font-size: smaller;
        }

        .buttons {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 1000;
            padding: 5px;
        }

        .buttons .control-btn {
            margin: 0 15px 5px 0;
            padding: 10px;
        }

        .buttons .control-btn:hover {
            color: rgba(30, 22, 54, 0.6);
        }
    </style>
</head>
<body>
	
	
<div class="box">
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="/">
                현지인 추천 맛집탐방
            </a>
        </div>
        <div id="navbarBasicExample" class="navbar-menu">
            <div class="navbar-start">
                <a href="placeList3.jsp" class="navbar-item">
                    맛집 찾기
                </a>
                <a href="placeList2.jsp" class="navbar-item">
                    핫플 찾기
                </a>
                <a href="/input" class="navbar-item">
                    맛집 추천
                </a>
            </div>
        </div>
    </nav>
    <div id="map">
        <div class="buttons">
		    <!-- 각 버튼에 onclick 속성을 추가하여 해당 함수를 호출하도록 설정 -->
		    <input id="to-seoul" type="button" value="서울" class="control-btn" onclick="moveToSeoul()">
		    <input id="to-kangwon" type="button" value="강원도" class="control-btn" onclick="moveToKangwon()">
		    <input id="to-jeonlla" type="button" value="전라도" class="control-btn" onclick="moveToJeonlla()">
		    <input id="to-busan" type="button" value="경상도" class="control-btn" onclick="moveToBusan()">
		    <input id="to-jeju" type="button" value="제주도" class="control-btn" onclick="moveToJeju()">
		</div>
    </div>
    <div class="matjip-list" id="card-box">
    </div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8cc96c2f9fa5e88344a6930e199645a1"></script>
<script>
        var map;
      
        var infowindow = new kakao.maps.InfoWindow({zIndex:1});

        var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
        mapOption = { 
            center: new kakao.maps.LatLng(37.590670027472, 126.69957662091), // 지도의 중심좌표
            level: 9 // 지도의 확대 레벨
        };

    var map = new kakao.maps.Map(mapContainer, mapOption);
    
    <%
    List<PlaceVO> list = dao.restSelectAll(); 
    int listSize = list.size();
%>

var positions = [];

<%
    for (int i = 0; i < listSize; i++) {
    	Gcode = list.get(i).getCode();
        double latitude = Double.parseDouble(list.get(i).getGlat());
        double longitude = Double.parseDouble(list.get(i).getGlon());
%>
    var location<%= i %> = {
    	
        title: '<%= list.get(i).getName
        		().replace("'", "\\'") %>',
        latlng: new kakao.maps.LatLng(<%= latitude %>, <%= longitude %>),
        Gcode:'<%=Gcode%>'
    };
    positions.push(location<%= i %>);
<%
    }
%>
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    var openInfowindow = null;
for (var i = 0; i < positions.length; i ++) {
	   
        // 마커 이미지의 이미지 크기 입니다
        var imageSize = new kakao.maps.Size(24, 35); 
        
        // 마커 이미지를 생성합니다    
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
        
        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            map: map, // 마커를 표시할 지도
            position: positions[i].latlng, // 마커를 표시할 위치
            title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage // 마커 이미지 
        });
        
        // 마커에 표시할 인포윈도우를 생성합니다 
        var infowindow = new kakao.maps.InfoWindow({
            content: '<p align=center ><br><img style = "width:120px"src ="images/'+positions[i].Gcode+'.jpeg"><br><a href = https://map.kakao.com/link/map/'+positions[i].title+","+positions[i].latlng.getLat()+','+positions[i].latlng.getLng()+'>'+positions[i].title+'</a></p>' // 인포윈도우에 표시할 내용
        });
        kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
        kakao.maps.event.addListener(map, 'click',  function() {
            if (openInfowindow) {
                openInfowindow.close();
            }
        });
    }
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        // 이전에 열려있던 인포윈도우를 닫습니다.
		        if (openInfowindow) {
		            openInfowindow.close();
		        }
		
		        // 현재 마커에 해당하는 인포윈도우를 엽니다.
		        infowindow.open(map, marker);
		
		        // 현재 열린 인포윈도우를 openInfowindow 변수에 저장합니다.
		        openInfowindow = infowindow;
		    };
		}
		

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 

    
        
   
            function moveToJeju() {
                var jeju = new kakao.maps.LatLng(33.2640809403762, 126.50142910717592);
                map.panTo(jeju);
            }

            function moveToKangwon() {
                var kangwon = new kakao.maps.LatLng(37.764373962953165, 128.8984379860449);
                map.panTo(kangwon);
            }

            function moveToJeonlla() {
                var jeonlla = new kakao.maps.LatLng(35.827588416403096, 127.11888819628146);
                map.panTo(jeonlla);
            }

            function moveToBusan() {
                var busan = new kakao.maps.LatLng(35.1797865, 129.0750194);
                map.panTo(busan);
            }

            function moveToSeoul() {
                var seoul = new kakao.maps.LatLngBounds(
                    new kakao.maps.LatLng(37.42829747263545, 126.76620435615891),
                    new kakao.maps.LatLng(37.7010174173061, 127.18379493229875));
                map.setBounds(seoul);
            }

            function panToPoint() {
                map.panTo(new kakao.maps.Point(10, 10));
            }
        
    </script>
    
</div>
</body>
</html>