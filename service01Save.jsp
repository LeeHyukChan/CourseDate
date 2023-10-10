<%@page import="net.hb.login.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="tti.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	
		String name = request.getParameter("name");
		String following = request.getParameter("following");
		out.print(uName);
		FollowDAO dao = new FollowDAO();
		dao.FollowInsert(name,following);

	%>
  <script type="text/javascript">
  location.href = 'follow?name=<%=name%>';
  </script>
	
</body>
</html>