<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="/ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> openCodeSave.jsp  </title>

</head>
<body>
 <div align="center">
 <h2> openCodeSave.jsp 단독실행X </h2>  
<%  
  	String id = request.getParameter("userid");
	LoginDAO dao = new LoginDAO();
	
	int Gtotal = dao.JoinIdCheck(id);
	
  if(Gtotal > 0){ 
%>	 
  <script type="text/javascript">
     alert("<%=Gid%> 코드는 이미 등록된 데이터입니다(사용불가)");
     opener.myform.id.value="";
     opener.myform.id.focus();
     self.close();
  </script>	
	
<%	  
  }else{
%>	
  <script type="text/javascript">
     alert("<%=Gid%> 코드는 사용가능한 데이터입니다(사용가능)");
     self.close();
     Gcheck = true ; 
  </script>
<% }
  
  %>	
   
 </div>
</body>

</html>













