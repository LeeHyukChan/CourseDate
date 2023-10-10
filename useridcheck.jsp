<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>    
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String db="jdbc:oracle:thin:@127.0.0.1:1521:XE";
Connection conn=DriverManager.getConnection(db,"system", "1234");

// 읽어오기(아이디)
String userid=request.getParameter("userid");
	
// 쿼리 생성
String sql="select count(*) as cnt from member where userid=?"; 
	         // 아이디가 있으면 1, 없으면 0이 된다.
// 심부름꾼 생성
PreparedStatement pstmt=conn.prepareStatement(sql);
pstmt.setString(1, userid);
	
// 쿼리실행
ResultSet rs=pstmt.executeQuery();
rs.next();
	
out.print( rs.getInt("cnt") );  // 0 or 1 이 날라간다.
%>