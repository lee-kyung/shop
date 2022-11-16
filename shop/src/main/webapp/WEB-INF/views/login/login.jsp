<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    

<head>

<style>
	section{
	width:1000px;
	height:600px;
	margin:auto;
	text-align:center;}
	
	section h1{
	margin-top:80px;}
	
	section div{
	margin-top:15px;}
	
	section input[type=text], [type=password]{
	width:300px;
	height:40px;
	border:1px solid gold;
	outline:none;}
	
	section #login_msg{
	font-size:13px;
	color:red;
	display:inline-block;
	margin-top:15px;}
	section input[type=submit], [type=button]{
	width:308px;
	height:46px;
	border:1px solid gold;
	background:gold;
	color:white;}
	
	section #search{
	font-size:14px;
	cursor:pointer;}
	#userid_search, #pwd_search{
	display:none;}
	
</style>
<script>

// 아이디 찾기 폼 보이기
	function view_us()
	{
		document.getElementById("userid_search").style.display="block";
		document.getElementById("userid_msg").innerText="";
		document.getElementById("pwd_search").style.display="none";
		document.getElementById("pwd_msg").innerText="";
		
		document.userid_search.name.value="";
		document.userid_search.email.value="";

		document.pwd_search.userid.value="";
		document.pwd_search.name.value="";
		document.pwd_search.email.value="";
	}

// 비밀번호 찾기 폼 보이기 
	function view_ps()
	{
		document.getElementById("pwd_search").style.display="block";
		document.getElementById("pwd_msg").innerText="";
		document.getElementById("userid_search").style.display="none";
		document.getElementById("userid_msg").innerText="";
		
		document.userid_search.name.value="";
		document.userid_search.email.value="";

		document.pwd_search.userid.value="";
		document.pwd_search.name.value="";
		document.pwd_search.email.value="";
	}

// 아이디 찾기
	function userid_search_fn()
	{
		var name=document.userid_search.name.value;
		var email=document.userid_search.email.value;
		var us=new XMLHttpRequest();
		us.open("get","userid_search_ok?name="+name+"&email="+email);
		us.send();
		us.onreadystatechange=function()
		{
			if(us.readyState==4)
			{
				if(us.responseText=="0")
				{
					alert("이름 혹은 이메일을 다시 확인해주세요.");
				}	 
				else
				{   
					var imsi=us.responseText.trim();
					document.getElementById("userid_search").style.display="none";
					document.getElementById("userid_msg").innerText="아이디는 "+imsi+" 입니다";
				}
			}
		}
	}
// 비밀번호 찾기
	function pwd_search_fn()
	{
		var userid=document.pwd_search.userid.value;
		var name=document.pwd_search.name.value;
		var email=document.pwd_search.email.value;
		var ps=new XMLHttpRequest();
		ps.open("get","pwd_search_ok?userid="+userid+"&name="+name+"&email="+email);
		ps.send();
		ps.onreadystatechange=function()
		{
			if(ps.readyState==4)
			{
				if(ps.responseText=="0")
				{
					alert("아이디, 이름 혹은 이메일을 다시 확인해주세요.");
				}	 
				else
				{   
					var imsi=ps.responseText.trim();
					document.getElementById("pwd_search").style.display="none";
					document.getElementById("pwd_msg").innerText="비밀번호는 "+imsi+" 입니다";
				}
			}
		}
	}

</script>
</head>

<body>

<section>

<form method="post" action="login_ok">

<h1>L O G I N</h1>

	<div><input type="text" name="userid" placeholder="아이디"></div>
	<div>
		<input type="password" name="pwd" placeholder="비밀번호">
		
		<c:if test="${err == 1}"> 
           <br> <span id="login_msg">아이디 혹은 비밀번호가 일치하지않습니다. </span>
       </c:if>
       
	</div>
	<div><input type="submit" value="로그인"></div>
	<div id="search">
		<span onclick="view_us()">아이디 찾기 | </span>
		<span onclick="view_ps()">비밀번호 찾기</span>
	</div>
	
</form>

<!-- 아이디 찾기 -->
	<div id="userid_msg"></div>
	<form name="userid_search" id="userid_search">
		<input type="text" name="name" placeholder="이름"> <p>
		<input type="text" name="email" placeholder="이메일"> <p>
		<input type="button" value="아이디찾기" onclick="userid_search_fn()"> 
	</form>
	
<!-- 비밀번호 찾기 -->
	<div id="pwd_msg"></div>
	<form name="pwd_search" id="pwd_search">
		<input type="text" name="userid" placeholder="아이디"> <p>
		<input type="text" name="name" placeholder="이름"> <p>
		<input type="text" name="email" placeholder="이메일"> <p>
		<input type="button" value="비밀번호찾기" onclick="pwd_search_fn()"> 
	</form>
	
</section>

</body>