<%@page import="net.hb.login.LoginVO"%>
<%@page import="net.hb.login.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.HashMap"%>

<%
    // 가상적으로 아이디 중복 여부를 확인
    	String name = request.getParameter("name_give");
		
		/* LoginDAO dao = new LoginDAO();
		boolean exists = false; // 가상적으로 존재하지 않는 아이디라고 가정
		int Gtotal =  dao.JoinIdCheck(id); 
		System.out.println(Gtotal);*/
    // HTML 형식으로 응답 생성
    //String responseHtml;
	
 	
    // 응답 출력
     
        LoginDAO dao = new LoginDAO();
    	LoginVO vo = new LoginVO();
    	
    	vo.setUsername(name);
       String[] result = dao.check(vo.getUsername());
       
   		System.out.println(result[0]);
   		System.out.println(result[1]);
   		System.out.println(result[2]);
   	   	
%>
{"Gname" : "<%= result[0] %>" ,  "Gplace" : "<%= result[1] %>" ,"Gcontent" : "<%= result[2] %>"  }

