<%@page import="net.hb.login.LoginVO"%>
<%@page import="net.hb.login.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.HashMap"%>

<%
    // 가상적으로 아이디 중복 여부를 확인
    	 String code1 = request.getParameter("code_give");
		System.out.println(code1);
		/* LoginDAO dao = new LoginDAO();
		boolean exists = false; // 가상적으로 존재하지 않는 아이디라고 가정
		int Gtotal =  dao.JoinIdCheck(id); 
		System.out.println(Gtotal);*/
    // HTML 형식으로 응답 생성
    //String responseHtml;
	
 	
    // 응답 출력
     
        LoginDAO dao = new LoginDAO();
    	LoginVO vo = new LoginVO();
    	
    	vo.setCode1(code1);
       String[] result = dao.Description(vo.getCode1());
       

   	   	
%>
{"pname" : "<%= result[0] %>" ,  "ptype" : "<%= result[1] %>" ,"pplace" : "<%= result[2] %>" , "pdate" : "<%= result[3] %>" }

