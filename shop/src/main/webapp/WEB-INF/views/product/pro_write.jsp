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
	height:700px;
	}
	
	section table{
	font-size:14px;
	border:1px solid black;
	border-collapse:collapse;
	border-left-color:white;
	border-right-color:white;
	border-top-color:white;}
	
	section table td{
	padding:10px;}

	section table tr:last-child{
	border-bottom-color:white;}
	
	section input[type=button], [type=submit]{
	width:100px;
	height:40px;
	background:gold;
	color:white;
	border:1px solid gold;}
	
</style>
<script>
// option태그가 바뀌는 순간 onchange실행됨
	function getjung(daecode)
	{
		// ajax를 통해서 처리 
		var chk=new XMLHttpRequest();		// +daecode는 this.value의 값
		chk.open("get", "getjung?daecode="+daecode);
		chk.send();
		chk.onreadystatechange=function()
		{
			if(chk.readyState==4)
			{
				//alert(chk.responseText);
				
				// inpro안의 jung에 productserviceimpl.java에서 받은 out을  넣어라. (한글이 깨져서 디코더사용) 
				// (chk.responseText.trim()) : 값을 전달 받는다. 
				
				var jung=decodeURI(chk.responseText.trim());
				jung="<option> 중분류 </option>"+jung;
				document.inpro.jung.innerHTML=jung;
			}
		}
	}
	
	function getso(jung)
	{
		// 선택된 중분류값뿐아니라 그 전에 선택된 대분류 값도 필요하다. 
		// 선택된 dea의 값
		var dae=document.inpro.dae.value; 
		
		var daejung=dae+jung;
		
		var chk=new XMLHttpRequest();	
		chk.open("get", "getso?daejung="+daejung);
		chk.send();
		chk.onreadystatechange=function()
		{
			if(chk.readyState==4)
			{
				// alert(chk.responseText);
				document.inpro.so.innerHTML=decodeURI(chk.responseText.trim());
			}
		}
	}
	
	function bunho()
	{
		// 대, 중, 소의 value값을 가져와서 연결
		var dae=document.inpro.dae.value;
		var jung=document.inpro.jung.value;
		var so=document.inpro.so.value;
		// 전부다 숫자지만 value값이라 String으로 되어있음. 
		var code="p"+dae+jung+so;
		//alert(code);
		
		var chk=new XMLHttpRequest();	
		chk.open("get", "getbunho?code="+code);
		chk.send();
		chk.onreadystatechange=function()
		{
			if(chk.readyState==4)
			{
			 // alert(chk.responseText);
			 // 1을 증가한 후 상폼코드를 완성한 후 텍스트에 전달
				var bunho=parseInt(chk.responseText)+1;
			 	// parseInt를 하지 않으면 문자열로서 더하게 된다. (1+1=11)
			 	
				// alert(bunho);
			 	
			 	// bunho의 값을 3자리로 변경:숫자는 길이가 없어서 문자로 바꿔야한다.
			 	// 길이가 필요한 이유는 길이가 1인 경우는 한자리수이므로 앞에 00을 추가하고
			 	// 길이가 2인 경우는 두자리수이므로 앞에 0을 추가 하여야한다.
			 	// 길이가 3인 경우는 세자리수이므로 필요없음
			 	bunho=bunho+""; // 숫자와 문자가 더하게 되면 문자가 되기때문에 작성
			 	// 위의 방법 말고도 문자화 시키는 방법은 아래처럼도 할 수 있다. 
			 	// String(bunho);, bunho.toString();
				if(bunho.length==1)
				{
					bunho="00"+bunho;		
				}
				else if(bunho.length==2)
				{
					bunho="0"+bunho;		
				}
				
				// p와 대중소code를 연결하고 pcode에 넣어주기
				document.inpro.pcode.value=code+bunho;
			 	
			}
		}
	}
</script>
</head>
<body>
<!-- pro_write.jsp : 상품 입력 -->
<section>

<form name="inpro" method="post" action="product_ok" enctype="multipart/form-data">
<table width="800" align="center" border="1">
<caption><h2>상품 등록</h2></caption>
	<tr>
		<td>상품 코드</td>
		
		<!-- 상품코드 : 대, 중, 소 -->
		<td><input type="text" name="pcode" readonly></td>
					<!-- readonly는 작성은 불가능.  -->
		<td>			<!-- this는 select태그를 가르키기때문에 value를 작성해야 value값을 가지고 간다. -->
			
				<select name="dae" onchange="getjung(this.value)">
				
					<option>대분류</option>
					
					<c:forEach items="${list }" var="dvo">
						<option value="${dvo.code }">${dvo.title }</option>
					</c:forEach>
				</select>
				
				<select name="jung" onchange="getso(this.value)">
				
				</select>
				<select name="so">
				
				</select>
			
			
				<input type="button" onclick="bunho()" value="상품코드생성">
			
		</td>
	</tr>
	<tr>
		<td>상품메인 이미지</td>
		<td colspan="2"> <input type="file" name="pimg"></td>
	</tr>
	<tr>
		<td>상품상세 이미지</td>
		<td colspan="2"> <input type="file" name="cimg"></td>
	</tr>
	<tr>
		<td>상품 제목</td>
		<td colspan="2"> <input type="text" name="title"></td>
	</tr>
	<tr>
		<td>상품 가격</td>
		<td colspan="2"> <input type="text" name="price"></td>
	</tr>
	<tr>
		<td>상품 제조사</td>
		<td colspan="2"> <input type="text" name="made"></td>
	</tr>
	<tr>
		<td>상품 할인율</td>
		<td colspan="2"> <input type="text" name="halin" value="0"></td>
	</tr>
	<tr>
		<td>적립금</td>
		<td colspan="2"> <input type="text" name="juk" value="0"></td>
	</tr>
	<tr>
		<td>상품 수량</td>
		<td colspan="2"> <input type="text" name="su" value="1"></td>
	</tr>
	<tr>
		<td>배송비</td>
		<td colspan="2"> <input type="text" name="baesong" value="0"></td>
	</tr>
	<tr>
		<td>배송일</td>
		<td colspan="2"> <input type="text" name="baeday" value="2"></td>
	</tr>
	<tr align="right">
		<td colspan="3"> <input type="submit" value="등록하기"></td>
	</tr>
</table>
</form>
</section>

</body>
</html>

<!-- select태그를 자바스크립트에서 부르는 이름
option태그의 길이 => length
option태그에 나타낼 글자 => text
option태그에 값을 서버로 => value
 -->