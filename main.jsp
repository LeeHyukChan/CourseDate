<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#E3E0EB">
	<%
	String name = request.getParameter("name");
	
		if(name==null)
		{
			response.sendRedirect("login.jsp");
		}
		
		request.setCharacterEncoding("utf-8");
		
		
	%>
	<h2><%=name %> 회원님 환영합니다.</h2>
	<hr>
	<a href="service01.jsp">1번째 서비스</a><br>
	<a href="service02.jsp">2번째 서비스</a><br>
	<a href="service03.jsp">3번째 서비스</a><br>
</body>
</html>