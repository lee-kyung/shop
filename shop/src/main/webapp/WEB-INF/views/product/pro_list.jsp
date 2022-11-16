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
	
	section td{
	width:270px;
	height:300px;
	padding:15px;
	vertical-align:top; 	/*그림 상하 정렬*/
	border:1px solid #FAECC5;}
	
	section td:hover{
	border:1px solid gold;}
	
	section td div{
	margin-top:5px;}
	
	section #img{
	text-align:center;}
	
	
	section #title{
	font-size:16px;
	font-weight:700;
	margin-top:10px;}
	
	section #price{
	font-size:15px;}
	
	section #r_price{
	color:red;}
	
	/*할인 전 금액*/
	section #price s{
	color:gray;
	font-size:14px;}
	
	section #baeday{
	font-size:12px;
	color:green;}
	
	section #baeprice{
	font-size:12px;}
</style>
<script>
	function content_view(pcode)
	{
		location="../product/pro_content?pcode="+pcode;
	}
</script>
</head>
<body>

<!-- 상품30개 출력 -->
<section>

<c:set var="i" value="0"/>
<table align="center" cellspacing="15px">
	<tr>
	
	<!-- 그림, 배송비, 상품명, 가격(할인o:할인가격으로 보이기), 배송일보이기 -->			
		<c:forEach items="${list }" var="pvo">
			<td onclick="content_view('${pvo.pcode}')">	<!-- td를 클릭할때 pcode가 필요하기때문에 매개변수 사용 -->
			<!-- 그림 -->
				<div id="img"><img src="../resources/img/${pvo.pimg }"width="270" height="270"></div>
				
			<!-- 상품명 -->
				<div id="title">${pvo.title }</div>
				
			<!-- 가격 -->
				<div id="price">
				<!-- 할인이 있는 경우ㅡ -->
					<c:if test="${pvo.halin!=0 }">
						${pvo.halin }% <s><fmt:formatNumber value="${pvo.price }"/>원</s>	
						<br>																			<!-- pattern 소수점자리수 없애기 -->
						<span id="r_price"><fmt:formatNumber value="${ pvo.price - ( pvo.price * (pvo.halin/100) ) }" pattern=",000"/>원</span>
					</c:if>
					
				<!-- 할인이 없는 경우 -->
					<c:if test="${pvo.halin==0 }">
						<span id="r_price" style="display:inline-block; margin-top:20px;"><fmt:formatNumber value="${pvo.price }"/>원</span>
					</c:if>
				
				</div>
				
				
			<!-- 배송일 -->
			
			<c:choose>
				<c:when test="${pvo.yoil==1 }">
					<c:set var="yo" value="일요일"/>
				</c:when>
				<c:when test="${pvo.yoil==2 }">
					<c:set var="yo" value="월요일"/>
				</c:when>
				<c:when test="${pvo.yoil==3 }">
					<c:set var="yo" value="화요일"/>
				</c:when>
				<c:when test="${pvo.yoil==4 }">
					<c:set var="yo" value="수요일"/>
				</c:when>
				<c:when test="${pvo.yoil==5 }">
					<c:set var="yo" value="목요일"/>
				</c:when>
				<c:when test="${pvo.yoil==6 }">
					<c:set var="yo" value="금요일"/>
				</c:when>
				<c:when test="${pvo.yoil==7 }">
					<c:set var="yo" value="토요일"/>
				</c:when>
			</c:choose>
			
				<div id="baeday">${pvo.baeday2 } ${yo } 도착보장</div>
				
			<!-- 배송비 -->
				<div id="baeprice">
					<c:if test="${pvo.baesong==0 }">
						무료배송
					</c:if>
					<c:if test="${pvo.baesong!=0 }">
						배송 <fmt:formatNumber value="${pvo.baesong }"/>원
					</c:if>
				</div>
				
			</td>
			
		<c:set var="i" value="${i+1 }"/>	<!-- td가 출력될때마다 1이 증가 -->
	<c:if test="${i%3==0 }">	<!-- 1행에 3열 출력 -->
	</tr>
	<tr>
	</c:if>
		</c:forEach>
	</tr>
</table>

</section>


</body>
</html>