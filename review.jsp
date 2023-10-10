<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.util.MyUtil"%>
<%@page import="com.board.BoardDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.board.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="net.hb.login.*" %> 
<%
	request.setCharacterEncoding("UTF-8");
	
	//BoardDAO dao = new BoardDAO(DBConn.getConnection());
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	LoginDAO dao1 = new LoginDAO();
	
	MyUtil myUtil = new MyUtil();
	
	//get방식으로 넘어온 페이지 번호(myUtil...)
	String pageNum = request.getParameter("pageNum"); //겟파라미터로 받는다
	
	//첫 시작 시 현재페이지 : 1
	int currentPage = 1;
	
	//넘어온 페이지번호가 존재할 경우 현재페이지에 값 넣기
	if(pageNum != null) {
		
		currentPage = Integer.parseInt(pageNum);
	}
	
	//검색키, 검색값
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	//검색값이 있을 경우
	if(searchValue != null) {
		
		if(request.getMethod().equalsIgnoreCase("GET")) {
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		}
	//검색값이 없을 경우	
	}else {
		searchKey = "subject";
		searchValue = "";
	}
	
	
	//전체 데이터 갯수 구하기
	int dataCount = dao.getDataCount(searchKey,searchValue);
	
	//하나의 페이지에 표시할 데이터 갯수
	int numPerPage = 10;
	
	//전체 페이지 갯수
	int totalPage = myUtil.getPageCount(numPerPage, dataCount);
	
	//데이터를 삭제해서 페이지가 줄었을 때
	if(currentPage > totalPage) {
		currentPage = totalPage;
	}
	
	//DB에서 가져올 데이터의 시작과 끝
	int start = (currentPage-1) * numPerPage+1;
	int end = currentPage * numPerPage;
	
	//DB에서 해당 페이지를 가져옴
	List<BoardDTO> lists = dao.getLists(start, end,searchKey,searchValue); 
	
	
	//검색 - 검색기능을 사용할 경우 get방식의 주소에 추가로 적용.
	String param = "";
	//null이 아니면 검색을 한 것이다.
	if(!searchValue.equals("")) {
		
		//이때 주소를 만들어준다
		param = "?searchKey=" + searchKey;
		param+= "&searchValue=" + URLEncoder.encode(searchValue, "UTF-8");
		
	}
	
	//페이징 처리 
	String listUrl = "list.jsp" + param; //param 검색을 안했으면 null이 들어간다.됬다면 주소
	
	
	String pageIndexList = 
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
	
	
	//글보기 주소
	
	String articleUrl ="article.jsp";
	
	if(param.equals("")) { //검색을 안했을 때
		articleUrl += "?pageNum=" + currentPage;
	} else { //검색을 했을 때
		articleUrl += param + "&pageNum=" + currentPage;
	}
	
	
	DBConn.close();
	
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>
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
	    <!-- Font Awesome CSS --><%@ page language="java" contentType="text/html; charset=UTF-8"  %>
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
	    <style>
    /* Style for the 글 올리기 button */
    .btn2 {
        font-size: 20px;
        background-color: #e8344e;
        color: #fff;
        padding: 8px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
         white-space: nowrap;
    }
	

	
    .btn2:hover {
        background-color: #ca2a41;
    }
</style>
	    <style>
    /* Style for the 제목-검색 section */
    #leftHeader {
        display: flex;
        align-items: center;
        margin-bottom: 20px; /* Add margin to separate from the 글 올리기 button */
    }

    .selectField,
    .textField {
        font-size: 16px;
        padding: 8px 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-right: 10px;
    }

    .btn2 {
        font-size: 25px;
        background-color: #007bff;
        color: #fff;
        padding: 8px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        display: inline;
    }

    .btn2:hover {
        background-color: #0056b3;
    }

    /* Style for the select dropdown arrow */
    select.selectField {
        appearance: none;
        -webkit-appearance: none;
        -moz-appearance: none;
        background-image: url('path-to-arrow-icon.png'); /* Replace with your arrow icon image path */
        background-repeat: no-repeat;
        background-position: right 8px center;
        padding-right: 28px; /* Adjust as per your arrow icon width */
    }
</style>
	    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게 시 판</title>
	
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/list.css"/>

<script type="text/javascript">

	function sendIt() {
		
		var f = document.searchForm;
		
		//검색 버튼을 누를경우 리스트페이지로 이동
		f.action = "review.jsp";
		f.submit();
	}

</script>


</head>
<body>
<% %>

		<% String name = request.getParameter("name"); %>
		<div class="box">
		   <nav class="navbar" role="navigation" aria-label="main navigation">
	        <div class="navbar-brand">
	            <a class="navbar-item" href="matjibLoginOk.jsp?name=<%= name %>" >
	                너가 좋아
	            </a>
	        </div>
	 
	        <div id="navbarBasicExample" class="navbar-menu">
	        
	        </div>
	    </nav>
	    <section class="section is-medium">
	    	       <div id="bbsList_title">
					게 시 판 & 리 뷰 
				</div>
	      	<div id="bbsList_header">
		<div id="leftHeader">
    <form action="" method="post" name="searchForm" style="display:inline;">
        <select name="searchKey" class="selectField">
            <option value="subject">제목</option>
            <option value="name">작성자</option>
            <option value="content">내용</option>
        </select>
        <input type="text" name="searchValue" class="textField" placeholder="검색어를 입력하세요...">
  
    </form>
</div>


		<div id="rightHeader">
		      <input type="button" value="검색" class="btn2" onclick="sendIt();">
    		  <input type="button" value="글 올리기" class="btn2" onclick="javascript:location.href='created.jsp?name=<%=name%>';">
</div>

	</div>
	<div id="bbsList_list" >
		 <div id="title">
        <dl>
            <dt class="num">번호</dt>
            <dt class="subject">방문장소</dt>
            <dt class="name">작성자</dt>
            <dt class="created" style="width: 150px;">작성일</dt>
            <dt class="hitCount" style="width: 120px;">조회수</dt>
        </dl>
    </div>
	
			<div id="lists">
				<%
				for (BoardDTO dto : lists) {
				%>
				<dl>
					<dd class="num"><%=dto.getNum()%></dd>
					<dd class="subject">
							<a href="<%=articleUrl%>&num=<%=dto.getNum()%>"><%=dto.getSubject()%></a>
						<!-- currentPage is the current page you are viewing -->
					</dd>
					<dd class="name"><%=dto.getName()%></dd>
					<dd class="created"
						style="display: inline-block; width: 150px; white-space: nowrap;"><%=dto.getCreated()%></dd>
					<!-- Adjust the width as per your requirement -->
					<dd class="hitCount" style="display: inline-block; width: 110px;"><%=dto.getHitCount()%></dd>
					<!-- Adjust the width as per your requirement -->
				</dl>
				<%
				}
				%>
			</div>

			<div id="footer">
			<%=pageIndexList %>
		</div>
		</div>
	</div>
	
	    </section>

	    </div>    
	
</body>
</html>