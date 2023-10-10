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

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

	
	 function DaumPostcode() { 
		  new daum.Postcode({ 
		 	  oncomplete: function(data) { 
		      var roadAddr = data.roadAddress; 
		      // 도로명 주소 변수 
		      // 우편번호와 주소 정보를 해당 필드에 넣는다. 
		    document.getElementById('postcode').value = data.zonecode; 
		    document.getElementById("user_location").value = roadAddr; detailAddress 
		  	} 
		  }).open(); 
		}
		// 사실상 이메일 없으니까 없어도 되는 코드이긴함 .
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
	
	 function execID(){
	    var vcode = document.myform.code.value;
	    if(vcode == "" | vcode==null){
		  alert("code데이터 공백입니다 execID 장마끝 ~~~ "); 
		  document.myform.code.focus();
		  return  false;
		}
	    //window.open(1,2재오픈,3) 팝업창으로 
	    window.open("openCode.jsp?idx="+vcode, "bc", "width=500,height=170,left=700, top=250");
		
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

	<form name="myform" action="LoginWriteSave.jsp">
		아이디: <input type="text" name="id" size="12" maxlength="10"> <input
			type=button value="아이디중복체크" onclick="execID();"> <br>
		이름: <input type="text" name="name" value="choi"> <br> 성별:
		<input type="text" name="gender" value="sunny"> <br> 나이:
		<input type="text" name="age" value="3"> <br> 
		<label> 우편번호 </label><input type="text" id="postcode"
			placeholder="우편번호"> <input type="button"
			onclick="DaumPostcode()" class="dup" value="우편번호 찾기"><br>
		<label>주소</label><input type="text" id="user_location"
			placeholder="도로명주소"><br> <label>상세 주소 입력</label><input
			type="text" id="detailAddress" placeholder="상세주소"><br> <input
			type="submit" value="guest데이터등록"> <input type="reset"
			value="입력취소">
	</form>


	<p>
		<a href="index.jsp">[index]</a> 
		<a href="LoginWrite.jsp">[Login등록]</a>
		<a href="LoginList.jsp">[전체출력]</a> <br>
	<p style="margin-bottom: 350px;">
</body>
</html>





