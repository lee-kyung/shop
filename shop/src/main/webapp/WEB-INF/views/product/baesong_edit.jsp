<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	
	form{
	text-align:center;}
	
	h2{
	margin-bottom:50px;}
	
	input[type=text]{
	width:300px;
	height:50px;
	border:1px solid gold;
	outline:none;}
	
	#zip{
	width:150px;}
	
	div{
	margin-top:20px;}
	
	#btn1{
	width:146px;
	height:54px;
	border:1px solid gold;
	background:gold;
	color:white;
	cursor:pointer;}
		
	#btn2{
	width:300px;
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
</script>
</head>
<body>

<form name="pkc" method="post" action="baesong_edit_ok">
<input type="hidden" name="id" value="${bvo.id}">
	<h2 align="center">주소 수정</h2>
		<div> <input type="text" name="name" placeholder="이름" value="${bvo.name }"></div>
		<div>
			<input type="text" name="zip" id="zip" readonly  placeholder="우편번호" value="${bvo.zip }">
			<input type="button"  value="주소찾기" id="btn1" onclick="juso_search()">
		</div>
		<div> <input type="text" name="juso"  placeholder="주소" readonly value="${bvo.juso }"> </div>
		<div> <input type="text" name="juso_etc"  placeholder="상세주소" value="${bvo.juso_etc }"> </div>
		<div> <input type="text" name="phone" placeholder="전화번호" value="${bvo.phone }"> </div>
		
		<div> <input type="submit" value="주소 수정" id="btn2"></div>
</form>
	
</body>
</html>