<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section{
	width:1000px;
	margin:auto;
	height:680px;
/*	position:relative;
*/	font-size:15px;}
	
	section #info{
	margin-top:50px;
	width:500px;
	display:inline-block;}
	
	section #info div{
	margin-top:20px;}
	
	section #pwdform{
/*	position:absolute;
*/	width:300px;
	margin-left:100px;
	display:inline-block;
	visibility:hidden;}
	
	section #pwdform div{
	margin-top:20px;}
	
	section #aa{
	display:inline-block;	/* inline-block 를 해야 가로세로가 적용됨*/
	width:110px;
	height:30px;
	margin-right:20px;
	font-weight:600;}
	
	section input[type=button]{
	width:163px;
	height:44px;
	border:1px solid gold;
	background:gold;
	color:white;
	cursor:pointer;
	margin-top:50px;}
		
	
	section input[type=password]{
	width:300px;
	height:50px;
	border:1px solid gold;
	outline:none;}
	
	section input[type=submit]{
	width:304px;
	height:44px;
	border:1px solid gold;
	background:gold;
	color:white;
	cursor:pointer;
	margin-top:50px;}
	
</style>
<script>

// 비밀번호 변경 폼 보이기
	function change_pwd()
	{
	   document.getElementById("pwdform").style.visibility="visible";
	}

// 변경할 비밀번호의 일치 여부 확인
	var pchk=0;
	function check_pwd(pwd2)
	{
		var pwd=document.pchg.pwd.value;
		if(pwd==pwd2)
		{
			document.getElementById("pmsg").innerText="비밀번호가 일치합니다.";		
			document.getElementById("pmsg").style.color="blue";		
			pchk=1;
		}
		
		else
		{
			document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다.";
			document.getElementById("pmsg").style.color="red";
			pchk=0;
		}
	}
	
// 비밀번호 변경 버튼이 클릭되었을 때 체크할 내용
/*
 	1. 기존 비밀번호의 입력여부 => 빈칸 체크
 	2. 새 비밀번호가 1자 이상 => 빈칸 체크
 	3. 새 비밀번호 2개가 같은가
*/
	
	function check(my)
 	{
 		if(my.prepwd.value.trim().length==0)
 		{
 			document.getElementById("pmsg").innerText="기존 비밀번호를 입력하세요";
 			document.getElementById("pmsg").style.color="red";
 			return false;
 		}
 		else if(my.pwd.value.trim().length==0)
 		{
 			document.getElementById("pmsg").innerText="새로운 비밀번호를 입력하세요";
 			document.getElementById("pmsg").style.color="red";
 			return false;
 		}
 		else if(pchk==0)
 		{
 	 		document.getElementById("pmsg").innerText="비밀번호가 일치하지 않습니다.";
 	 		document.getElementById("pmsg").style.color="red";
 	 		return false;
 		}
 		else
 			return true;
 	}
</script>
</head>
<body>

<section>

<input type="hidden" name="22">

	<h2 align="center"> MY INFO </h2>

<div id="info">
	<div> <span id="aa">아이디</span> ${mvo.userid }</div>
	<hr>
	<div> <span id="aa">이름</span> ${mvo.name }</div>
	<hr>
	<div> <span id="aa">우편번호</span> ${mvo.zip }</div>
	<hr>
	<div> <span id="aa">주소</span> ${mvo.juso } ${mvo.juso_etc }</div>
	<hr>
	<div> <span id="aa">전화</span> ${mvo.phone }</div>
	<hr>
	<div> <span id="aa">이메일</span> ${mvo.email }</div>
	<hr>
	<div align="center">
		<input type="button" value="정보수정" onclick="location='myinfo_edit'">
		<input type="button" value="비밀번호 변경" onclick="change_pwd()">
		<input type="button" value="회원탈퇴" onclick="location='member_out'">
	</div>
</div>

	
<!-- 비밀번호 변경폼 -->
	<div id="pwdform">
		<form name="pchg" method="post" action="change_pwd" onsubmit="return check(this)">
			<h3>PASSWORD</h3>
				<div><input type="password" name="prepwd" placeholder="기존 비밀번호"></div>
				<div><input type="password" name="pwd" placeholder="변경할 비밀번호"></div>
				<div><input type="password" name="pwd2" placeholder="변경할 비밀번호 재확인" onkeyup="check_pwd(this.value)"> </div>
				<div id="pmsg" style="font-size:12px; height:1px;"></div>
				<div align="center"> <input type="submit" value="비밀번호 변경"></div>
		</form>
	</div>
</section>


</body>
</html>