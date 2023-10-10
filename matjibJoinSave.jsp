<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/ssi.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginLoSave.jsp</title>

</head>
<body>
	<div align="center">
		<h2>LoginLoSave.jsp 단독실행X</h2>

		<%
		String data = request.getParameter("Joinid");
		%>
		<%
		String check = request.getParameter("Joinpassword");
		%>

		<%
		System.out.println(data);
		System.out.println(check);

		msg = "select count(*) as cnt from users where id = '" + data + "'";
		System.out.println(msg);
		RS = ST.executeQuery(msg);
		System.out.println(RS);
		if (RS.next() == true) {
			Gtotal = RS.getInt("cnt");
		}
		if (Gtotal < 1) {
		%>
		<script type="text/javascript">
     alert("<%=data%> 님 회원가입이 완료되었습니다.");
     opener.myform.id.value="";
     opener.myform.id.focus();
     self.close();
  </script>

		<%
		} else {
		%>
		<script type="text/javascript">
     alert("<%=Gid%>
			회원가입이 완료되었습니다. 다시 입력해주세요.");
			self.close();
		</script>
		<%
		}
		%>

	</div>
</body>
</html>













