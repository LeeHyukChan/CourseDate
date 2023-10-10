<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>

<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <title> LoginWriteSave.jsp  </title>
</head>
<body>
 <h2> LoginWrite.jsp </h2>
 <img src="./images/main_4.jpg" width=300 height=100> <br>
    
 <%
   //guestWriteSave.jsp문서는 단독실행X
 try{
    String did = request.getParameter("id");
    String dname = request.getParameter("name");
    String dgender = request.getParameter("gender");
    int dage = Integer.parseInt(request.getParameter("age"));
    String duser_location = request.getParameter("user_location");
    // 확인코드 
    System.out.print("아이디 " + did );
    System.out.print("이름 " + dname );
    System.out.print("성별 " + dgender );
    System.out.print("나이 " + dage );
    System.out.println("주소 " + duser_location );

    vo.setId(did);
    vo.setUsername(dname);
    vo.setGender(dgender);
    vo.setAge(dage);
    vo.setLocation(duser_location);
    dao.LoginInsert(vo);
    
    System.out.println("Guest테이블 저장성공");
    response.sendRedirect("LoginList.jsp");
   
 }catch(Exception ex){
    System.out.println("저장실패 " + ex );
    response.sendRedirect("index.jsp");
 }
 %>
  
  <p>
  <a href="#">[index]</a>
  <a href="guestWrite.jsp">[guest등록]</a>
  <a href="guestList.jsp">[전체출력]</a>
</body>
</html>











