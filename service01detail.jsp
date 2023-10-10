<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="tti.jsp" %>

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
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<style>
    * {
        margin: 0;
        padding: 0;
        font-family: 'Jua', sans-serif;
    }

    /* container 영역 */
    .box {
        width: 1000px;
        margin: 0 auto;
        padding: 30px;
    }

    /* header 영역 */
    .navbar {
        border-bottom: 1px solid #e8e8e8;
    }

    .navbar-start {
        padding-left: 250px;
        font-weight: 500;
        font-size: 20px;
    }

    .navbar-item {
        font-size: 25px;
        font-weight: 500;
    }

    /* contents 영역 */
    .Main {
        padding-top: 50px;
        margin: 0 auto;
        width: 800px;
        text-align: center;
        border: 1px solid #f2f2f2;
        padding: 20px;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        margin-top: 20px;
    }

    .Main table {
        width: 100%;
        margin-top: 20px;
        border-collapse: collapse;
        text-align: left;
    }

    .Main th, .Main td {
        padding: 12px;
        border-bottom: 1px solid #ddd;
    }

    .Main th {
        background-color: #f2f2f2;
    }

    .Main tr:hover {
        background-color: #f5f5f5;
    }

    .Main img {
        max-width: 250px;
        max-height: 250px;
        display: block;
        margin: 0 auto;
    }

    .Main .title {
        font-size: 20px;
        font-weight: 500;
        margin-bottom: 10px;
    }
</style>
    <script>
    </script>
</head>
<body>
<%
        uName= request.getParameter("name");
		String  sname= request.getParameter("sname");
        String rest = request.getParameter("rest");
        String fest = request.getParameter("fest");  
 %>
<div class="box">
    <nav class="navbar" role="navigation" aria-label="main navigation">
        <div class="navbar-brand">
            <a class="navbar-item" href="matjibLoginOk.jsp?name=<%=uName%>">
                너가 좋아
            </a>
        </div>
        
        <div id="navbarBasicExample" class="navbar-menu">
            <div class="navbar-start">
               <a href="placeList2.jsp" class="navbar-item">
                    나의 맛집 상세정보 <%=uName%> Ver
                </a>
                <a href="matjibPost.jsp" class="navbar-item">
                </a>
            </div>
        </div>
    </nav>
    <div class="Main"  >
<%
    msg= "select * from rest where rname = '"+ rest + "'";// 받아온 rest와 조건절을 이용하여 음식집을 뽑는다.
    RS=ST.executeQuery(msg);
    if(RS.next()==true)
    {
        Gname=RS.getString("rname");
        Gcode=RS.getInt("rcode");
        Gplace=RS.getString("rplace");
        Glong=RS.getString("rlong");
        Glati=RS.getString("rlati");
    }
%>    


    <table border="1" cellspacing="0">
        <tr bgcolor="gray" height="70">
            <td colspan="2" align="center"> 
                맛집 <%= Gname %>에 대한 상세정보 입니다    
            </td>  
        </tr> 
        <tr>
            <td rowspan="3" align="center">
                <img src="images/<%=Gcode%>.jpeg" width="250" height="250" alt="<%= Gname %>">
            </td>
             <td> <a href="https://map.kakao.com/link/to/<%=Gname%>,<%=Glati%>,<%=Glong%>">길찾기 </a></td>
        </tr>
        <tr>
            <td> 이름 : <%= Gname %> </td>
        </tr>
        <tr>
            <td> 위치 : <%= Gplace %> </td>
        </tr>  
    </table>
</div>

<div class="Main">
<%
    msg= "select * from fest where fname = '"+ fest + "'";//받아온 fest와 조건절을 이용하여 축제를 뽑는다.
    RS=ST.executeQuery(msg);
    if(RS.next()==true)
    {
        Gname=RS.getString("fname");
        Gcode=RS.getInt("fcode");
        Gplace=RS.getString("fplace");
        Glong=RS.getString("flong");
        Glati=RS.getString("flati");
    }
%>    
    <table border="1" cellspacing="0">
        <tr bgcolor="gray" height="70">
            <td colspan="2" align="center"> 
                핫플 <%= Gname %>에 대한 상세정보 입니다    
            </td>  
        </tr> 
        <tr>
            <td rowspan="3" align="center">
                <img src="images/<%=Gcode%>.jpeg" width="250" height="250" alt="<%= Gname %>">
            </td>
            <td> <a href="https://map.kakao.com/link/to/<%=Gname%>,<%=Glati%>,<%=Glong%>">길찾기</a></td>
        </tr>
        <tr>
            <td> 이름 : <%= Gname %> </td>
        </tr>
        <tr>
            <td> 위치 : <%= Gplace %> </td>
        </tr>  
    </table>
    <br>
    <%
	if (sname.equals(uName)) 
	{
	%>
    <form action = "courseDelete.jsp" >
    		<input type="hidden" name="name" value=<%=uName%>>
			<input type="hidden" name="rest" value=<%=rest%>>
			<input type="hidden" name="fest" value=<%=fest%>>
			<input type="submit" value="제거" class="btn btn-danger">
	</form>
	<%
	}
	%>
</div>

</div>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>