<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section{
	width:1000px;
	margin:auto;}
	
	section .sub{
	display:none;
	height:60px;}
	
	section table{
	border-top:2px solid gold;
	border-bottom:1px solid gold;
	margin-top:30px;
	border-collapse:collapse;}
	
	section table td{
	font-family:돋움;
	font-size:14px;
	height:40px;}
	
	section caption{
	text-align:left;}
	
	section #gumae_info tr:first-child{
	background:#FAECC5;}
	
	section #bae_table .bb{
	font-size:12px;
	display:inline-block;
	width:80px;
	height:20px;
	background:gold;
	color:white;
	padding-top:2px;
	text-align:center;
	cursor:pointer;
	margin-bottom:5px;}
	
	section .submit{
	text-align:center;
	margin-top:40px;}
	section .sub:first-child{
	display:table-row;}
	
	section input[type=submit]{
	width:300px;
	height:55px;
	background:gold;
	color:white;
	font-size:18px;
	border:none;
	margin-bottom:30px;}
	
</style>
<script>
	function bae_chuga()
	{
		var chk=new XMLHttpRequest();
		chk.onload=function()
		{
			//alert(chk.responseText);
			var bb=chk.responseText.split(",");
			document.getElementById("bname").innerText=decodeURI(bb[0]);
			document.getElementById("bjuso").innerText=decodeURI(bb[1]);
			document.getElementById("bphone").innerText=bb[2];
			
			// 한번만 클릭할 수 있도록 한번클릭하면 '회원정보이용'이 숨겨지도록 설정
			document.getElementById("mem_use").style.display="none";
		}
		chk.open("get","bae_chuga");
		chk.send();
	}
	
	// 배송지 변경
	function bae_change()
	{
		// 주소(문서), 프레임이름:생략가능, 창의 설정(가로, 세로)
		open("baesong_list","","width=400, height=600");
		// baesong_list는 baesong테이블에서 같은 userid만 가져오는 리스트
	}
	
	// 결제테이블 보이기/숨기기
	function change_sub(n)
	{
		// 전부 숨기기
		var sub=document.getElementsByClassName("sub");
		var len=sub.length;	// 휴대폰, 신용, 계좌 => (3개)
		for(i=0;i<len;i++)	// 휴대폰, 신용, 계좌 => (3개)
		{
			sub[i].style.display="none";
		}
		
		// 선택된 결제방식 보이기
		sub[n].style.display="table-row";
	}
</script>
</head>
<body>
<section>
<form method="post" action="pro_gumae_ok">
<input type="hidden" name="gchk" value="${gchk }">
<!-- 구매상품 정보 -->
<table width="900" align="center" id="gumae_info">
<caption><h3>구 매 정 보</h3></caption>
	<tr align="center">
		<td>상품</td>
		<td>상품명</td>
		<td>단 가</td>
		<td>수 량</td>
		<td>적립금</td>
		<td>할인액</td>
		<td>총 금액</td>
	</tr>
	<c:set var="chongprice" value="0"/>
	<c:set var="chonghalin" value="0"/>
	<c:set var="chongbaesong" value="0"/>
	<c:set var="chongjuk" value="0"/>
	
	<!-- 누적시킬수있도록 사용 -->
	<c:set var="cpcode" value=""/>
	<c:set var="csu" value=""/>
	<c:set var="cchong" value=""/>
	
	<c:forEach items="${list }" var="pvo">
	<tr align="center">
	<!-- 상품그림 -->
		<td><img src="../resources/img/${pvo.pimg }" width="80" height="80"></td>
	<!-- 상품명 -->
		<td>${pvo.title }</td>
	<!-- 단가 -->
		<td><fmt:formatNumber value="${pvo.price }"/>원</td>
	<!-- 수량 -->
		<td>${pvo.su }개</td>
	<!-- 적립금 -->
		<td><fmt:formatNumber value="${pvo.juk*pvo.su}"/>원</td>
	<!-- 할인액 -->
		<td><fmt:formatNumber value="${pvo.price * (pvo.halin/100)*pvo.su}" pattern="#,###"/>원</td>
	<!-- 총결제금액 -->
		<td><fmt:formatNumber value="${(pvo.price*pvo.su) - (pvo.price*(pvo.halin/100)*pvo.su) }" pattern=",000"/>원</td>
	</tr>
																			<!-- value:0     ,, 누적방식 -->
	<c:set var="chongprice" value="${chongprice +(pvo.price*pvo.su) }"/>	<!-- 0 + pvo.price*pvo.su -->
	<c:set var="chonghalin" value="${chonghalin+(pvo.price * (pvo.halin/100)*pvo.su) }"/>
	<c:set var="chongbaesong" value="${chongbaesong + pvo.baesong}"/>
	<c:set var="chongjuk" value="${ chongjuk+ (pvo.juk*pvo.su)}"/>	
	
	<c:set var="cimsi" value="${Integer((pvo.price*pvo.su) - (pvo.price*(pvo.halin/100)*pvo.su)+pvo.baesong )}"/>
	
	<c:set var="cpcode" value="${cpcode+=pvo.pcode+=',' }"/>	<!-- 기존의 pcode + pvo.pcode + , : 문자연결은 += 를 사용-->
	<c:set var="csu" value="${csu+=pvo.su+=',' }"/>
	<c:set var="cchong" value="${cchong+=cimsi+=',' }"/>
	
	
	</c:forEach>
	<c:set var="chongpay" value="${ chongprice - chonghalin + chongbaesong}"/>
	
</table>


<input type="hidden" name="pcode" value="${cpcode }">
<input type="hidden" name="su_imsi" value="${csu }">
<input type="hidden" name="bae_id" value="${bvo.id }">
<input type="hidden" name="chong_imsi" value="${cchong }"/>




<!-- 구매자 정보 -->
<table width="900" align="center">
<caption><h3>구매자</h3></caption>
	<tr>
		<td width="150">이름</td>
		<td>${mvo.name }</td>
	</tr>
	<tr>
		<td>이메일</td>
		<td>${mvo.email }</td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td>${mvo.phone }</td>
	</tr>
</table>


<!-- 배송지 정보 -->
<table width="900" align="center" id="bae_table">
<caption>
	<h3 style="display:inline;" id="bh3">배송지</h3>
	
	<!-- 기본주소가 없을 경우 -->
	<c:if test="${ empty bvo}">	
		<span onclick="bae_chuga()" id="mem_use" class="bb"> 회원정보이용 </span>
	</c:if>	
	
	<!-- 기본주소가 있을 경우 -->
	<c:if test="${ !empty bvo}">
		<span onclick="bae_change()" class="bb">배송지 변경</span>
	</c:if>
</caption>


	<tr>
		<td width="150">받는사람</td>
		<td id="bname">${bvo.name }</td>
	</tr>
	<tr>
		<td>배송주소</td>
		<td id="bjuso">${bvo.juso } ${bvo.juso_etc }</td>
	</tr>
	<tr>
		<td>연락처</td>
		<td id="bphone">${bvo.phone }</td>
	</tr>
	
	<c:if test="${bvo.chuga ==0 }">
		<c:set var="chuga" value="문 앞"/>
	</c:if>
	<c:if test="${bvo.chuga ==1 }">
		<c:set var="chuga" value="직접받고 부재시 문 앞"/>
	</c:if>
	<c:if test="${bvo.chuga ==2 }">
		<c:set var="chuga" value="경비실"/>
	</c:if>
	<c:if test="${bvo.chuga ==3 }">
		<c:set var="chuga" value="택배함"/>
	</c:if>
	
	<tr>
		<td>요청사항</td>
		<td id="bchuga">${chuga} </td>
	</tr>
</table>


<!-- 결제관련 -->
<table width="900" align="center">
<caption><h3>결제방식</h3></caption>
	<tr>
		<td width="150">총 상품금액</td>
		<td><fmt:formatNumber value="${chongprice }"/>원</td>
	</tr>
	<tr>
		<td>-할인 금액</td>
		<td><fmt:formatNumber value="${chonghalin}" pattern="#,###"/>원</td>
	</tr>
	<tr>
		<td>+배송비</td>
		<td><fmt:formatNumber value="${chongbaesong }"/>원</td>
	</tr>
	<tr>
		<td>총 결제금액</td>
		<td><fmt:formatNumber value="${chongpay}" pattern=",000"/>원</td>
	</tr>
	<tr>
		<td>적립금</td>
		<td><fmt:formatNumber value="${chongjuk}"/>원</td>
	</tr>
	<tr>
		<td rowspan="2"> 결제방법 </td>
		<td>
			<input type="radio" name="sudan" value="0" checked onclick="change_sub(0)">계좌이체
			<input type="radio" name="sudan" value="1" onclick="change_sub(1)">신용/체크카드
			<input type="radio" name="sudan" value="2" onclick="change_sub(2)">휴대폰 결제
		</td>
	</tr>
	
<!-- 계좌이체 -->
	<tr class="sub" style="display:table-row;">
		<td>
			은행
			<select name="bank">
				<option value="-1">선 택</option>
				<option value="0">신한은행</option>
				<option value="1">우리은행</option>
				<option value="2">국민은행</option>
				<option value="3">하나은행</option>
				<option value="4">농협은행</option>
			</select>
		</td>
	</tr>
	
<!-- 신용/체크카드 -->	
	<tr class="sub">
		<td>
			카드선택
			<select name="card">
				<option value="-1">선 택</option>
				<option value="0">신한카드</option>
				<option value="1">우리카드</option>
				<option value="2">국민카드</option>
				<option value="3">하나카드</option>
				<option value="4">농협카드</option>
			</select>
			
			<br>
			할부기간
			<select name="gigan">
				<option value="-1">선 택</option>
				<option value="0">일시불</option>
				<option value="1">2개울 무이자</option>
				<option value="2">4개월 무이자</option>
				<option value="3">6개월 무이자</option>
				<option value="4">12개월 부분 무이자</option>
			</select>
			
		</td>
	</tr>
	
<!-- 휴대폰 결제 -->	
	<tr class="sub">
		<td>
			통신사
			<select name="phone">
				<option value="-1">선 택</option>
				<option value="0">SKT</option>
				<option value="1">KT</option>
				<option value="2">LG</option>
				<option value="3">그 외</option>
			</select>
		</td>
	</tr>
	
</table>

<!-- 결제버튼 -->
<div class="submit"><input type="submit" value="구매하기"></div>

</form>
</section>


</body>
</html>