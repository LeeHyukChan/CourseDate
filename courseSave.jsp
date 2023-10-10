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
		uName=request.getParameter("name");
		String rest =request.getParameter("rest");
		String fest =request.getParameter("fest");
		out.print(uName);
		out.print(rest);
		out.print(fest);
		out.print("저장성공입니다");
		dao.courseInsert(uName,rest,fest);
	%>
  <script type="text/javascript">
  location.href='service02.jsp?name=<%=uName%>' ;
  </script>
	
</body>
</html>