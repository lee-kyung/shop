<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
	section{
	width:1000px;
	height:700px;
	margin:auto;
	text-align:center;}
	
	section h2{
	margin-bottom:60px;}
		
	section input[type=text], [type=password]{
	width:300px;
	height:40px;
	border:1px solid gold;
	outline:none;}
		
	section div{
	margin-top:30px;		/* text가 붙어있어서 간격을 두기위해*/}
		
	section #userid{
	background:gold;
	color:white;
	text-align:center;
	font-size:20px;}
	
	section #zip{
	width:146px;
	height:40px;}
		
	section #btn1{
	width:146px;
	height:44px;
	border:1px solid gold;
	background:gold;
	color:white;
	cursor:pointer;}
		
	section #btn2{
	width:306px;
	height:44px;
	border:1px solid gold;
	background:gold;
	color:white;
	cursor:pointer;}
	
</style>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	
	function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
	{
		new daum.Postcode({
			
			oncomplete: function(data) {
				
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					
					addr = data.roadAddress;
				} 
				
				else { // 사용자가 지번 주소를 선택했을 경우(J)
				
					addr = data.jibunAddress;
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.pkc.zip.value = data.zonecode; // 우편번호
				document.pkc.juso.value = addr;  // 주소
				
				// 커서를 상세주소 필드로 이동한다.
				document.pkc.juso_etc.focus();
				
			}
		
		}).open();
		
	}
	
	function check(my)
	{
		if(my.name.value.trim().length==0)
		{
			alert("이름을 입력하세요");
			return false;
		}
		else if(my.phone.value.trim().length==0)
		{
			alert("전화번호를 입력하세요");
			return false;
		}
		else if(my.email.value.trim().length==0)
		{
			alert("이메일을 입력하세요");
			return false;
		}
		else
			return true;
	}
</script>

</head>
<body>
<section>

<form name="pkc" method="post" action="myinfo_edit_ok" onsubmit="return check(this)">

<h2>회원정보수정</h2>

	<div> <input type="text" name="userid" id="userid" readonly  value="${mvo.userid }"> </div>
	<div> <input type="text" name="name" value="${mvo.name }"> </div>
	<div> 
		<input type="text" name="zip" id="zip" readonly  value="${mvo.zip }">
		<input type="button"  value="주소찾기" id="btn1" onclick="juso_search()">
	</div>
	<div> <input type="text" name="juso" readonly value="${mvo.juso }"> </div>
	<div> <input type="text" name="juso_etc"  value="${mvo.juso_etc }"> </div>
	<div> <input type="text" name="phone" value="${mvo.phone }"> </div>
	<div> <input type="text" name="email" value="${mvo.email }"> </div>
	<div> <input type="submit" value="정보수정" id="btn2"></div>
		
</form>
	
</section>
</body>
</html>