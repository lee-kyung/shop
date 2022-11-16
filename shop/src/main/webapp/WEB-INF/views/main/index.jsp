<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<style>
	#image{
	width:1000px;
	height:300px;
	background:pink;
	margin:auto;}
	
	#image #outer{
	width:1000px;
	height:300px;
	overflow:hidden;}
	
	#image #inner{
	width:5100px;		/* 사진을 가로로 길게 두기 위해서 1000*5=5000 */
	height:300px;}
	
	section{
	width:1000px;
	/* height:800px; */
	margin:auto;}
	
	section #ar1{
	width:1000px;
	height:450px;
	/* background:skyblue; */
	margin:auto;}
	
	section #ar1 table{
	width:1000px;
	margin:auto;}
	
	section #ar1 table td{
	width:200px;
	height:300px;
	padding:15px;
	vertical-align:top; 	/*그림 상하 정렬*/
	border:1px solid #FAECC5;}
	
	section #ar1 table td:hover{
	border:1px solid gold;}
	
	section #ar1 table td div{
	margin-top:5px;}
	
	section #ar1 table #img{
	text-align:center;}
	
	
	section #ar1 table #title{
	font-size:16px;
	font-weight:700;
	margin-top:10px;}
	
	section #ar1 table #price{
	font-size:15px;}
	
	section #ar1 table #r_price{
	color:red;}
	
	/*할인 전 금액*/
	section #ar1 table #price s{
	color:gray;
	font-size:14px;}
	
	section #ar1 table #baeprice{
	font-size:12px;}
	
	section #ar2{
	width:1000px;
	height:400px;
	/* background:beige; */
	margin:auto;}
	
	section #ar2 table{
	width:1000px;
	margin:auto;}
	
	section #ar2 table td{
	width:200px;
	height:300px;
	padding:15px;
	vertical-align:top; 	/*그림 상하 정렬*/
	border:1px solid #FAECC5;}
	
	section #ar2 table td:hover{
	border:1px solid gold;}
	
	section #ar2 table td div{
	margin-top:5px;}
	
	section #ar2 table #img{
	text-align:center;}
	
	section #ar2 table #title{
	font-size:16px;
	font-weight:700;
	margin-top:10px;}
	
	section #ar2 table #price{
	font-size:15px;}
	
	section #ar2 table #r_price{
	color:red;}
	
	/*할인 전 금액*/
	section #ar2 table #price s{
	color:gray;
	font-size:14px;}
	
	section #ar2 table #baeprice{
	font-size:12px;}
	
/* 	section #ar3{
	width:1000px;
	height:200px;
	background:tomato;
	margin:auto;}
	
	section #ar4{
	width:1000px;
	height:200px;
	background:green;
	margin:auto;} */
</style>
<script>
	$(function(){
		
		// 사진 슬라이드 
		setInterval(function(){
			
			$("#image #inner").animate({
				
				marginLeft:"-1000px"
				
			}, 2000, function(){
					
					$("#image #inner").css("margin-left", "0px");
					
					$("#image #inner img").eq(0).insertAfter($("#image #inner img").eq(4));
				
		 		});
		},4000);
		
	});
</script>
</head>

<!-- 사진슬라이드 -->
	<div id="image">
		<div id="outer">
			<div id="inner">
				<img src="../resources/main/1.png" width="1000" height="300"><img src="../resources/main/2.png" width="1000" height="300"><img src="../resources/main/3.png" width="1000" height="300"><img src="../resources/main/4.png" width="1000" height="300"><img src="../resources/main/5.png" width="1000" height="300">
			</div>
		</div>
	</div>
		
<!-- 현재페이지의 필요한 내용 -->	<!-- section내의 하나의 항목 -->
	<section> 
	
	<!-- 최신상품 -->
		<article id="ar1">
		
<c:set var="i" value="0"/>
<table align="center" cellspacing="15px">
<caption style="margin-top:50px; text-align:left;">최신상품</caption>
	<tr>
	
	<!-- 그림, 배송비, 상품명, 가격(할인o:할인가격으로 보이기), 배송일보이기 -->			
		<c:forEach items="${list }" var="pvo">
			<td onclick="content_view('${pvo.pcode}')">	<!-- td를 클릭할때 pcode가 필요하기때문에 매개변수 사용 -->
			<!-- 그림 -->
				<div id="img"><img src="../resources/img/${pvo.pimg }" width="200" height="200"></div>
				
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
	<c:if test="${i%4==0 }">	<!-- 1행에 3열 출력 -->
	</tr>
	<tr>
	</c:if>
		</c:forEach>
	</tr>
</table>

		</article>
	
	<!-- 인기상품 -->
		<article id="ar2">
		
		<c:set var="i" value="0"/>
<table align="center" cellspacing="15px">
<caption style="text-align:left;">인기상품</caption>
	<tr>
	
	<!-- 그림, 배송비, 상품명, 가격(할인o:할인가격으로 보이기), 배송일보이기 -->			
		<c:forEach items="${list2 }" var="pvo2">
			<td onclick="content_view('${pvo2.pcode}')">	<!-- td를 클릭할때 pcode가 필요하기때문에 매개변수 사용 -->
			<!-- 그림 -->
				<div id="img"><img src="../resources/img/${pvo2.pimg }" width="200" height="200"></div>
				
			<!-- 상품명 -->
				<div id="title">${pvo2.title }</div>
				
			<!-- 가격 -->
				<div id="price">
				<!-- 할인이 있는 경우ㅡ -->
					<c:if test="${pvo2.halin!=0 }">
						${pvo2.halin }% <s><fmt:formatNumber value="${pvo2.price }"/>원</s>	
						<br>																			<!-- pattern 소수점자리수 없애기 -->
						<span id="r_price"><fmt:formatNumber value="${ pvo2.price - ( pvo2.price * (pvo2.halin/100) ) }" pattern=",000"/>원</span>
					</c:if>
					
				<!-- 할인이 없는 경우 -->
					<c:if test="${pvo2.halin==0 }">
						<span id="r_price" style="display:inline-block; margin-top:20px;"><fmt:formatNumber value="${pvo2.price }"/>원</span>
					</c:if>
				
				</div>

				
			<!-- 배송비 -->
				<div id="baeprice">
					<c:if test="${pvo2.baesong==0 }">
						무료배송
					</c:if>
					<c:if test="${pvo2.baesong!=0 }">
						배송 <fmt:formatNumber value="${pvo2.baesong }"/>원
					</c:if>
				</div>
				
			</td>
			
		<c:set var="i" value="${i+1 }"/>	<!-- td가 출력될때마다 1이 증가 -->
	<c:if test="${i%4==0 }">	<!-- 1행에 3열 출력 -->
	</tr>
	<tr>
	</c:if>
		</c:forEach>
	</tr>
</table>

		</article>
	
	
	
	<!-- 특가상품 -->
<!-- 		<article id="ar3"> 특가상품 5개 </article> -->
	
	<!-- 이벤트상품 -->
<!-- 		<article id="ar4"> 이벤트상품 5개</article> -->
	

	</section>
