	<%@ page language="java" contentType="text/html; charset=UTF-8"  %>
	<%@ include file = "ssi.jsp" %>
	
	<!DOCTYPE html>
	<html lang="UTF-8">
	<head>
	    <meta charset="UTF-8">
	    <title>K-Koding 맛집 리스트도 | Main</title>
	     <script type="text/javascript"
	            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=j7f8jzk31x&submodules=geocoder"></script>
	
	    <!-- favicon.ico 404 (Not Found) -->
	    <link rel="icon" href="data:;base64,iVBORw0KGgo=">
	
	    <link rel="preconnect" href="https://fonts.gstatic.com">
	    <link href="https://fonts.googleapis.com/css2?family=Jua&family=Sunflower:wght@300&display=swap" rel="stylesheet">
	    <!-- Bulma CSS링크 -->
	    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.1/css/bulma.min.css">
	    <!-- Font Awesome CSS -->
	    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
	    <!-- jQuery -->
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
	    <style>
	        * {
	            font-family: 'Jua', sans-serif;
	        }
	
	        /* container 영역 */
	        .box {
	            width: 1000px;
	            margin: 0 auto;
	        }
	
	        /* header 영역 */
	
	        .navbar {
	            border-bottom: 1px solid #e8e8e8;
	        }
	
	        .navbar-start {
	            padding-left: 400px;
	            font-weight: 500;
	            font-size: 20px;
	        }
	
	        .navbar-item {
	            font-size: 25px;
	            font-weight: 500;
	        }
	
	        /* 배너 영역 */
	
	
	        /* 로그인 영역 */
	        .button {
	            font-size: 20px;
	        }
	
	        .is-sparta {
	            color: #e8344e !important;
	        }
	
	        .button.is-sparta {
	            background-color: #e8344e;
	            border-color: transparent;
	            color: #fff !important;
	        }
	
	        .button.is-sparta.is-outlined {
	            background-color: transparent;
	            border-color: #e8344e;
	            color: #e8344e !important;
	        }
	
	        .help {
	            color: gray;
	        }
	
	    </style>
	    <script>
	
	    
	        function sign_in() {
	            let username = $("#input-username").val()
	            let password = $("#input-password").val()
	
	            if (username == "") {
	                $("#help-id-login").text("아이디를 입력해주세요.")
	                $("#input-username").focus()
	                return;
	            } else {
	                $("#help-id-login").text("")
	            }
	
	            if (password == "") {
	                $("#help-password-login").text("비밀번호를 입력해주세요.")
	                $("#input-password").focus()
	                return;
	            } else {
	                $("#help-password-login").text("")
	            }
	            $.getJSON({
	                type: "POST",
	                url: "matjibSignIn.jsp",
	                data: {
	                    username_give: username,
	                    password_give: password
	                },
	                success: function (response) {
	                    if (response.Gtotal!="0") {
	                    	 let newUrl = "matjibLoginOk.jsp?name=" + encodeURIComponent(response.Gname);
	                          window.open(newUrl, "_blank");
	                        
	                    } else {
	                        alert(response['msg'])
	                    }
	                	
	                	l
	                }
	            });
	        }
	
	        function toggle_sign_up() {
	            $("#sign-up-box").toggleClass("is-hidden")	
	            $("#div-sign-in-or-up").toggleClass("is-hidden")
	            $("#btn-check-dup").toggleClass("is-hidden")
	            $("#help-id").toggleClass("is-hidden")
	            $("#help-password").toggleClass("is-hidden")
	            $("#help-password2").toggleClass("is-hidden")
	            $("#check").toggleClass("is-hidden")
		            
	        }
	
	        function is_nickname(asValue) {
	            var regExp = /^(?=.*[a-zA-Z])[-a-zA-Z0-9_.]{2,10}$/;
	            return regExp.test(asValue);
	        }
	
	        function is_password(asValue) {
	            var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z!@#$%^&*]{8,20}$/;
	            return regExp.test(asValue);
	        }
	
	        function check_dup() {
	        	 let username = $("#input-username").val()
	        	 
	            console.log(username);
	            if (username == "") {
	                $("#help-id").text("아이디를 입력해주세요.").removeClass("is-safe").addClass("is-danger")
	                $("#input-username").focus()
	                return;
	            }
	            if (!is_nickname(username)) {
	                $("#help-id").text("아이디의 형식을 확인해주세요. 영문과 숫자, 일부 특수문자(._-) 사용 가능. 2-10자 길이").removeClass("is-safe").addClass("is-danger")
	                $("#input-username").focus()
	                return;
	            }
	            $("#help-id").addClass("is-loading")
					
	            
	            $.getJSON({
	                type: "POST",
	                url: "matjibCheck.jsp",
	                data: {
	                    username_give: username
	                },
	                /* dataType: "text", */
	                success: function (response) {
	                    if (response.Gtotal!="0") {
	                        $("#help-id").text("이미 존재하는 아이디입니다.").removeClass("is-safe").addClass("is-danger")
	                        $("#input-username").focus()
	                    } else {
	                        $("#help-id").text("사용할 수 있는 아이디입니다.").removeClass("is-danger").addClass("is-success")
	                    }
	                    $("#help-id").removeClass("is-loading") 

	                }
	            });
	            
	            
	   	
	        }
	        
	        

	        
	
	        function sign_up() {
	            let username = $("#input-username").val()
	            let password = $("#input-password").val()
	            let password2 = $("#input-password2").val()
				let gender = $("input[name=gender]:checked").val()
	            let age = $("#age").val()
	            let name = $("#name").val()
	       
	            // 여기까지는 확인완료 
	            console.log(username, password, password2, gender, age ,name )
	
	            if ($("#help-id").hasClass("is-danger")) {
	                alert("아이디를 다시 확인해주세요.")
	                return;
	            } else if (!$("#help-id").hasClass("is-success")) {
	                alert("아이디 중복확인을 해주세요.")
	                return;
	            }
	
	            if (password == "") {
	                $("#help-password").text("비밀번호를 입력해주세요.").removeClass("is-safe").addClass("is-danger")
	                $("#input-password").focus()
	                return;
	            } else if (!is_password(password)) {
	                $("#help-password").text("비밀번호의 형식을 확인해주세요. 영문과 숫자 필수 포함, 특수문자(!@#$%^&*) 사용가능 8-20자").removeClass("is-safe").addClass("is-danger")
	                $("#input-password").focus()
	                return
	            } else {
	                $("#help-password").text("사용할 수 있는 비밀번호입니다.").removeClass("is-danger").addClass("is-success")
	            }	
	            if (password2 == "") {
	                $("#help-password2").text("비밀번호를 입력해주세요.").removeClass("is-safe").addClass("is-danger")
	                $("#input-password2").focus()
	                return;	
	            } else if (password2 != password) {
	                $("#help-password2").text("비밀번호가 일치하지 않습니다.").removeClass("is-safe").addClass("is-danger")
	                $("#input-password2").focus()
	                return;
	            } else {
	                $("#help-password2").text("비밀번호가 일치합니다.").removeClass("is-danger").addClass("is-success")
	            }
	            
	            $.getJSON({
	                type: "POST",
	                url: "matjibInfo.jsp",
	                data: {
	                    username_give: username,
	                    password_give: password,
	                    password_give: password,
	                    gender_give: gender,
	                    age_give: age,
	                    name_give: name
	                       
	                },
	                success: function (response) {
	                	if(response.id!=null||response.equals("")){
	                    alert("회원가입을 축하드립니다!")
	                    window.location.replace("matjibLogin.jsp");
	                	}
	                }
	            });
	
	        }
	    </script>
	</head>
	<body>
	<div class="box">
	
	 	<% String name = request.getParameter("name"); %>
	    <nav class="navbar" role="navigation" aria-label="main navigation">
	        <div class="navbar-brand">
	            <a class="navbar-item" href="matjibLogin.jsp">
	                너가 좋아
	            </a>
	        </div>
	        <div id="navbarBasicExample" class="navbar-menu">
	            <div class="navbar-start">
	                <a href="placeList2.jsp" class="navbar-item">
	                    맛집 찾기
	                </a>
	                <a href="matjibPost.jsp?name=<%= name %>" class="navbar-item">
	                    맛집 추천
	                </a>
	            </div>
	        </div>
	    </nav>
	    <section class="section is-medium">
	        <h1 class="title">서로서로 공유하는 데이트코스</h1>
	        <h2 class="subtitle">
	            특별한 <strong>데이트 코스</strong>가 있다면 모두에게 공유해주세요!
	        </h2>
	    </section>
	    <section class="section">
	        <div class="container">
	            <div class="box" style="max-width: 480px;margin:auto">
	                <article class="media">
	                    <div class="media-content">
	                        <div class="content">
	                            <p>로그인 후 너가 좋아 를 이용해주세요!<br><strong style="color: #e8344e">로그인하지 않아도 맛집검색은
	                                가능합니다!</strong></p>
	                            <div class="field has-addons">
	                        
	                                <div class="control has-icons-left" style="width:100%">
	                  
	                                    <input id="input-username" class="input" type="text" placeholder="아이디" name="id">
	                                    <span class="icon is-small is-left"><i class="fa fa-user"></i></span>
	                                </div>
	                                <div id="btn-check-dup" class="control is-hidden">
	                
	                                    <button class="button is-sparta" style="font-size: 16px;" onclick="check_dup()">
	                                        중복확인
	                                    </button>
	                             
	                                </div>
	
	                            </div>
	                            <p id="help-id" class="help is-hidden">아이디는 2-10자의 영문과 숫자와 일부 특수문자(._-)만 입력 가능합니다.</p>
	                            <p id="help-id-login" class="help is-danger"></p>
	
	                            <div class="field">
	                                <div class="control has-icons-left">
	                                    <input id="input-password" class="input" type="password" placeholder="비밀번호">
	                                    <span class="icon is-small is-left"><i class="fa fa-lock"></i></span>
	                                </div>
	                                <p id="help-password" class="help is-hidden">영문과 숫자 조합의 8-20자의 비밀번호를 설정해주세요.
	                                    특수문자(!@#$%^&*)도
	                                    사용
	                                    가능합니다.</p>
	                            </div>
	                        </div>
	                        <div id="div-sign-in-or-up" class="has-text-centered">
	                            <nav class="level is-mobile">
	                                <button class="level-item button is-sparta" onclick="sign_in()">
	                                    로그인
	                                </button>
	                            </nav>
	                            <hr>
	                            <h4 class="mb-3">아직 회원이 아니라면</h4>
	                            <nav class="level is-mobile">
								
								
	                                <button class="level-item button is-sparta is-outlined"
	                                        onclick="toggle_sign_up()">
	                                    회원가입하기
	                                </button>
	                            </nav>
	                        </div>
	                      
	                        <div id="sign-up-box" class="is-hidden">
	                        
	                            <div class="mb-5">
	                                <div class="field">
	                                    <div class="control has-icons-left" style="width:100%">
	                                        <input id="input-password2" class="input" type="password"
	                                               placeholder="비밀번호 재입력">
	                                        <span class="icon is-small is-left"><i class="fa fa-lock"></i></span>
	                                    </div>
	                                    <p id="help-password2" class="help is-hidden">비밀번호를 다시 한 번 입력해주세요.</p>
	                                </div>
	                            </div>
	                            
	                             <div id="check" class="is-hidden">
	                             <div class="field has-addons">
	                        
	                        	    <div class="control has-icons-left" style="width:100%">
	                  						이름 : <input id="name" type="text">	<br>
	                  						나이 : <input id="age" type="number"> 
	                                </div>
	                                
	                   </div>
	                                   <input id="gender1" type="radio" name="gender" value="female">여성 
	                                   <input id="gender2" type="radio" name="gender" value="male">남성
										<span class="icon is-small is-left"><i class="fa fa-user"></i></span>
	                        
	                           
	                                
	                         </div>
	                            <nav class="level is-mobile">
	                                <button class="level-item button is-sparta" onclick="sign_up()">
	                                    회원가입
	                                </button>
	                                <button class="level-item button is-sparta is-outlined" onclick="toggle_sign_up()">
	                                    취소
	                                </button>
	                            </nav>
	                            
	                           
	                        </div>
	                    </div>
	                    </div>
	                </article>
	            </div>
	        </div>
	    </section>
	        
	
	</div>
	
	    	
	</body>
	</html>
	
