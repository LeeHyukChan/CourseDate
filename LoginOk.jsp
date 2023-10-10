<%@page import="net.hb.login.LoginDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		LoginDAO dao = new LoginDAO();
		int Gtotal = dao.isMember(id, password);
		
		
		if(Gtotal != 0)
		{ 
			session.setAttribute("member", "ok");
			System.out.println(Gtotal);
			%>
			<jsp:forward page="main.jsp">
				<jsp:param value="<%=Gtotal%>" name="Gtotal"/>
			</jsp:forward>
			<%		
		}
		else
		{
			response.sendRedirect("login.jsp");	
		}
	%>
</body>
</html>