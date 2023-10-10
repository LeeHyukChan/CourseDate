<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <style>
        * {
            margin: 0;
            padding: 0;
            font-family: 'Jua', sans-serif;

        }

        /* container 영역 */
        .box {
            width: 1000px;
            height: 1800px;
            margin: 0 auto;
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

        /* contents 역 */
        .Main {
            padding-top: 50px;
            margin-left: 200px;
        }

        .control {
            width: 500px;
        }

        #button_save {
            margin-top: 20px;
            margin-left: 200px;
            padding: 30px;
            border-radius: 20px;
            font-size: 20px;
            font-weight: 500;
        }

        .buttons {
            width: 100%;
        }

        .button {
            font-size: 15px;

        }
    </style>
    <script>
        function posting() {
            let title = $('#title').val()
            let menu = $('#menu').val()
            let address = $('#address').val()
            let desc = $('#desc').val()

        $.ajax({
            type: "POST",
            url: "/mymatjip",
            data: {title_give: title, menu_give: menu, address_give: address, desc_give: desc,},
            success: function (response) {
                alert(response['msg'])
                window.location.reload()
            }
        })
        }
        function insert(){}
    </script>
</head>
<body>
<%
		uName=request.getParameter("name");//user의 이름을 uName에 저장한다.
        
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
               <a href="service01.jsp?name=<%=uName%>" class="navbar-item">
	                    나의 맛집 <%=uName%> Ver
	                </a>
	                <a href="matjibPost.jsp" class="navbar-item">
	                </a>
            </div>
        </div>
    </nav>
    <div class="Main">
<%
fpageNum=(request.getParameter("fpageNum"));
if(fpageNum == null)
{
	fpageNum="1";
	
}
fpageNUM=Integer.parseInt(fpageNum);


msg="select count(*) as cnt from fest ";  //행사의 수
RS=ST.executeQuery(msg);
if(RS.next()==true){ Gftotal=RS.getInt("cnt");} 


if(Gftotal%5==0){ pagecount = Gftotal/5; }
else{ pagecount = (Gftotal/5)+1;  }

startpage = fpageNUM-((fpageNUM-1)%5);  
endpage = startpage+9; 

if(endpage>pagecount){ endpage=pagecount; }
start = (fpageNUM-1)*5+1;
end = (fpageNUM*5);


 Gfield=request.getParameter("field");
 Gkey=request.getParameter("key");
 if(Gkey=="" || Gfield == ""  || Gfield==null || Gkey == null)
	{
		Gkey="";
		Gfield="fplace";
	}
%>    
	가고 싶은 전시회와 맛집을 선택하여 저장해주세요
	<table class = "table" border="1" cellspacing="0" width="500px" >
  		<tr align="right">
      		<td colspan="5"> 등록된 핫플의 수: <%= Gftotal %> </td> 
  		</tr>  
  		<tr bgcolor="pink">
    		<td>이름</td> <td>위치</td> <td colspan="3">사진</td>
  		</tr>    
<%
	Gfname = request.getParameter("fname");
    Grname = request.getParameter("rname");
    if(Grname == null)
    {
    	Grname="";	
    }
    if(Gfname == null)
    {
    	Gfname = "";
    }
    List<PlaceVO> list = dao.festSelectAll(start,end);//PlaceDAO의 매서드를 이용
    int listSize = list.size();
    for(PlaceVO a : list) {
        latitude = Double.parseDouble(a.getGlat());
        longitude = Double.parseDouble(a.getGlon());
        Gcode = a.getCode();
        Gname = a.getName();
    	Gplace = a.getPlace();
%>
		<tr>
      		<td> <a href =service02.jsp?fname=<%=Gname%>&rname=<%=Grname%>&name=<%=uName%>><%=Gname%></a></td> 
      		<td> <%= Gplace %> </td>
      		<td colspan="3" ><img src ="./images/<%=Gcode%>.jpeg" style="width: 100%;height:50px"></td>
   		</tr> 
 <%	
  }//for end
 %>	
 	 <tr align="center">
     <td colspan="6">
       <% 

         if(startpage > 10){
        	out.print("<a href=guestListCopy.jsp?pageNum="+(startpage-10)+"&fname="+Gfname+"&rname="+Grname+"&name="+uName+">[이전]</a>"); 
         }
       %>
        
       <%
         for(int i=startpage; i<=endpage; i++){
        	 if(i==fpageNUM){
        	   out.print("<font style='font-size:16pt;color:red;'>["+i+"]</font>"); 
        	 }else{
        	   out.print("<a href=service02.jsp?fpageNum="+i+"&fname="+Gfname+"&rname="+Grname+"&name="+uName+">["+i+"]</a>");
        	 }
         }//for end
       %>
       
       
       <% 
         if(endpage<pagecount){
        	out.print("<a href=guestListCopy.jsp?pageNum="+(startpage+10)+"&fname="+Gfname+"&rname="+Grname+"&name="+uName+">[다음]</a>"); 
         }
       %>
      </td> 
  </tr> 
</table>
</div>
<div class="Main">
<%
rpageNum=(request.getParameter("rpageNum"));
if(rpageNum == null)
{
	rpageNum="1";
	
}
rpageNUM=Integer.parseInt(rpageNum);


msg="select count(*) as cnt from rest ";  //음식집의 총 수
RS=ST.executeQuery(msg);
if(RS.next()==true){ Grtotal=RS.getInt("cnt");} 


if(Grtotal%5==0){ rpagecount = Grtotal/5; }
else{ rpagecount = (Grtotal/5)+1;  }

rstartpage = rpageNUM-((rpageNUM-1)%10);  
rendpage = rstartpage+9; 

if(rendpage>rpagecount){ rendpage=rpagecount; }
rstart = (rpageNUM-1)*5+1;
rend = (rpageNUM*5);


 Gfield=request.getParameter("field");
 Gkey=request.getParameter("key");
 if(Gkey=="" || Gfield == ""  || Gfield==null || Gkey == null)
	{
		Gkey="";
		Gfield="fplace";
	}
%>    
	<table class = "table" border="1" cellspacing="0" width="500px"  >
  		<tr align="right">
      		<td colspan="5"> 등록된 맛집의 수: <%= Grtotal %> </td> 
  		</tr>  
  		<tr bgcolor="pink">
    		 <td>이름</td> <td>위치</td>  <td colspan="3">사진</td> 
  		</tr>    
<%

	List<PlaceVO> rlist = dao.restSelectAll(rstart,rend); 
	int rlistSize = rlist.size();
    for(PlaceVO a : rlist) {
        latitude = Double.parseDouble(a.getGlat());
        longitude = Double.parseDouble(a.getGlon());
        Gcode = a.getCode();
        Gname = a.getName();
    	Gplace = a.getPlace();
%>
		<tr>
      		<td> <a href =service02.jsp?rname=<%=Gname%>&fname=<%=Gfname%>&name=<%=uName%>><%=Gname%></a></td> 
      		<td> <%= Gplace %> </td>
      		<td colspan="3"><img src ="./images/<%=Gcode%>.jpeg" style="width: 100%;height:50px"></td>
   		</tr> 
 <%	
  }//for end
 %>	
 	<tr align="center">
     <td colspan="6">
       <% 

         if(rstartpage > 10){
        	out.print("<a href=service02.jsp?rpageNum="+(rstartpage-10)+"&fname="+Gfname+"&rname="+Grname+"&name="+uName+">[이전]</a>"); 
         }
       %>
        
       <%
         for(int j=rstartpage; j<=rendpage; j++){
        	 if(j==rpageNUM){
        	   out.print("<font style='font-size:16pt;color:red;'>["+j+"]</font>"); 
        	 }else{
        	   out.print("<a href=service02.jsp?rpageNum="+j+"&fname="+Gfname+"&rname="+Grname+"&name="+uName+">["+j+"]</a>");
        	 }
         }//for end
       %>
       
       
       <% 
         if(rendpage<rpagecount){
        	out.print("<a href=service02.jsp?rpageNum="+(rstartpage+10)+"&fname="+Gfname+"&rname="+Grname+"&name="+uName+">[다음]</a>"); 
         }
       %>
      </td> 
  </tr> 

</table>
</div>


	<div class="Main">
        <div class="inputBox">
        	<form name = "myform" action="courseSave.jsp">
        	<div class="field">
                <label class="label">당신이름</label>
             	<div class="control">
                    <input class="input is-link" name="name"  readonly value=<%=uName%>  >
                </div>
            </div>
            <div class="field">
                <label class="label">전시회 이름</label>
             	<div class="control">
                    <input class="input is-link" name="fest" type="text"  value=<%=Gfname%>>
                </div>
            </div>
            <div class="field">
                <label class="label">맛집 이름</label>
                <div class="control">
                    <input class="input is-link" name="rest" type="text" value=<%=Grname%>>
                </div>
            </div>
            <div class="buttons">
        	<input style="text-align:top" id ="button_save" type="submit"  class="button is-link is-light" value="저장하기">
        </div>
        </form>
        </div>
     </div>
</div>


</body>
</html>