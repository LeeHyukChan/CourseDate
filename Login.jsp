<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>guestWriteCopy.jsp</title>
<style type="text/css">
* {
	font-size: 14pt;
	font-weight: bold;
}

a {
	font-size: 14pt;
	font-weight: bold;
}

a:hover {
	font-size: 16pt;
	color: green;
}
</style>


<script type="text/javascript">

    function execEmail(){
	  var vemail = document.myform.email.value;
	  if(vemail == "" | vemail==null){
		alert("메일주소 공백입니다 execEmail 장마끝 ~~~ "); 
		return  false;
	  }
	  if( vemail.includes("@") == false){
		  alert("메일@미포함입니다 execEmail 장마끝 ~~~ ");
		  document.myform.email.value="";
	   }
	}//end	
	
	// 이걸로 양식에 맞는지 판단하기 
	 function execID(){
		    var vid = document.myform.id.value;
		    if(vid == "" | vid==null){
			  alert("아이디 공백입니다 execID 장마끝 ~~~ "); 
			  document.myform.id.focus();
			  return  false;
			}
		    //window.open(1,2재오픈,3) 팝업창으로 
		    window.open("openCode.jsp?idx="+vid, "bc", "width=500,height=170,left=700, top=250");
			
		}//end
			
 </script>
</head>
<body>
	<h2>LoginWriteCopy.jsp문서에서 7-26일 회원가입</h2>
	<form name="myform" action="LoginOk.jsp">
		아이디: <input type="text" name="id" size="12" maxlength="10"> <input
			type=button value="아이디중복체크" onclick="execID();"> <br>
		패스워드 : <input type="text" name="password" value="choi"> 
		        <input type="submit" value="로그인">
	</form>
</body>
</html>





