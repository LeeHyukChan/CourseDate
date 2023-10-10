<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Date" %>

<%@ page import="net.hb.common.*" %>
<%@ page import="net.hb.guest.*"  %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title>   </title>
 <style type="text/css">
   *{font-size: 14pt; font-weight:bold;}
   a{font-size: 14pt; font-weight:bold;}
   a:hover{font-size: 16pt; color:green;}
 </style>	
</head>
<body>
 <%!
   Connection CN = null;
   Statement ST = null;
   PreparedStatement PST = null;
   ResultSet RS = null ;
   String msg = "";
   int OK = 0;
   int Gcode=0, Gpay=0, Ghit=0 , Grecord = 0; 
   String Gname="",  Gtitle="", Gemail="",Gtype="",Gaddr="";
   String Gperiod="", Gplace="";
   String Gfield="",Gkey="";
   java.util.Date Gwdate=null;
   String Gdata="";  
   int Gtotal = 0 ;
   int Grn;
   String ftitle="";
   double latitude = 0 ,longitude=0;
   //급여여,메일 안가져오고, 상세Detail문서에서 출력
   String name="";
   int listSize=0;
   int fpageNUM=0;
   String fpageNum="";
   int rpageNUM=0;
   String rpageNum="";
   String Glong="",Glati="";
   int start=0,startpage=0,end=0,endpage=0,pagecount=0;
   int rstart=0,rstartpage=0,rend=0,rendpage=0,rpagecount=0;
   int Gftotal=0,Grtotal=0;
   String uName="";
   String Grname="";
   String Gfname="";
 %>

 <%
  try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
	CN=DriverManager.getConnection(url,"system", "1234");
	//System.out.println("------ db연결 성공했습니다 23-07-13 ------ ");
	//out.println("<h2> ------ db연결 성공했습니다 23-07-13 ------ </h2> ");
	ST = CN.createStatement();
  }catch(Exception ex){System.out.println("db에러:"+ex);}
 %>
 
 <%!
 

 //MVC1모델1=순수자바 GuestDAO.java, GuestVO.java + Web문서 ~~.jsp
 PlaceDAO dao = new PlaceDAO();
 PlaceVO vo = new PlaceVO();
%>


</body>
</html>









