<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="./ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> LoginLoSave.jsp  </title>

</head>
<body>
 <div align="center">
 <h2> LoginLoSave.jsp 단독실행X </h2>  
<%  
  Gid = request.getParameter("id") ; 
  Gusername = request.getParameter("name");
  msg = "select count(*) as cnt from users where id = '"+ Gid + "' and username = '" + Gusername + "'" ;
  System.out.println(msg);
  RS = ST.executeQuery(msg);
  System.out.println(RS);
  if(RS.next()==true){ Gtotal = RS.getInt("cnt"); }
  if(Gtotal > 0){ 
%>	 
  <script type="text/javascript">
     alert("<%=Gusername%> 님 로그인 완료되었습니다");
     opener.myform.id.value="";
     opener.myform.id.focus();
     self.close();
  </script>	
	
<%	  
  }else{
%>	
  <script type="text/javascript">
     alert("<%=Gid%> 회원정보가 부적합합니다. 다시 입력해주세요.");
     self.close();
  </script>
<% } %>	
   
 </div>
</body>
</html>













