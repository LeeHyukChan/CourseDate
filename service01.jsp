
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="ssi.jsp"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<title>K-Koding 맛집 리스트도 | Main</title>


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
/* 테이블 */

  table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
  }

  th, td {
    border: 1px solid #dddddd;
    padding: 8px;
    text-align: left;
  }

  th {
    background-color: #f2f2f2;
    font-weight: bold;
  }

  tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  tr:hover {
    background-color: #dddddd;
  }
/* container연습*/
.flex-container {
    display: flex;
    justify-content: space-between;
  }

  .flex-item {
    width: 48%;
    margin: 0 auto;
  }

  @media (max-width: 767px) {
    .flex-container {
      flex-direction: column;
    }

    .flex-item {
      width: 100%;
    }
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
	<% String name = request.getParameter("name"); //name은 로그인 한 유저를 식별하기 위한 변수
   	   String sname = request.getParameter("sname"); // sname은 팔로우한 유저의 데이트 코스를 위한 변수
   	   if(sname == null)
   	   {
   		   sname=name;//sname에 아무것도 없다면 로그인한 유저의 정보를 볼 수 있도록 한다.
   	   }
	%>
	
		<div class="box">
		   <nav class="navbar" role="navigation" aria-label="main navigation">
	        <div class="navbar-brand">
	            <a class="navbar-item" href="matjibLoginOk.jsp?name=<%=name%>" >
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
	  
<%
	
		if(name==null)
		{
			response.sendRedirect("login.jsp");
		}//이름이 없다면 로그인 페이지로
		
		request.setCharacterEncoding("utf-8");
		
		
	%>

	    
	    <section class="section">
	        <div class="container">
	        	<div class="flex-container">
	        	<div  class="box" style="margin-bottom:0">
	<h2><a href="service01.jsp?name=<%=name%>&sname=<%=name%>"><%=name%></a>
		회원님 환영합니다.<br> 
		아래는 <%=sname%>님의 데이트 코스 목록입니다.
	</h2>
	<hr><table>
		<%
		int i =0;
		String rest="", fest="";
		msg = "select * from course where name ='" + sname+"'";//조건절과 sname을 이용하여 선택한 유저의 데이트 코스 목록을 본다.
		RS=ST.executeQuery(msg);
		
		while(RS.next()==true)
		{
			rest=RS.getString("rest");
			fest=RS.getString("fest");
	%>
			<tr>
			<td colspan="2"><a href="service01detail.jsp?rest=<%=rest%>&fest=<%=fest%>&name=<%=name%>&sname=<%=sname%>"><%=++i %></a></td>
			</tr>
			
			<tr>
			<td>맛집:</td> 
			<td><%=rest%></td>
			</tr>
			
			<tr>
			<td>장소:</td> 
			<td><%=fest%></td>
			</tr>
			
			
	<% 	
			}
	%>			  
	</table>      	
	        	</div>
	            <div  class="box">
	          	
	<h2><%=name%>
		회원님 환영합니다.<br> 
		아래는 <%=name%>님의 팔로우 목록입니다.
	</h2>
	<hr>
	<%
	String following="";
		msg = "select * from follow where name ='" + name+"'";// user가 팔로우 한 문자들을 질의한다.
		RS=ST.executeQuery(msg);
		while(RS.next()==true)
		{
			following=RS.getString("following");
	%>
			<form action = "DeleteFollow.do">
			<%=following%> <a href = "service01.jsp?name=<%=name%>&sname=<%=following%>"><%=following%>님의 데이트 코스 목록 보기</a> 
			<input type="hidden" name="name" value=<%=name%>>
			<input type="hidden" name="following" value=<%=following%>>
			<input type="submit" value="팔로우취소" >
			</form><br>
			
	<% 	
			}
	%>
	
	아래의 회원들을 팔로우하고 정보를 공유해봐요
	<hr>
	
	<% 
	String users="";
		msg = "select username from users where username not in (select following from follow where name = '"+name+"') ";//user테이블에 있지만 user가 팔로우 하지 않은 사람들
		RS=ST.executeQuery(msg);
		while(RS.next()==true)
		{
			following=RS.getString("username");
			if(!following.equals(name))
			{
	%>
			
			<%=following%> <form action = "InsertFollow.do">
			<input type="hidden" name="name" value=<%=name%>>
			<input type="hidden" name="following" value=<%=following%>>
			<input type="submit" value="팔로우" ></form><br>
				
	<% 		}
		}
	%>
	  	 
	  
	  
	            </div>
	        </div>
	       </div>
	    </section>
	    </div>    
	
	
</body>
</html>