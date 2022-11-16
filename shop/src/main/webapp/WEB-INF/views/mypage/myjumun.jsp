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
	margin-bottom:50px;}
	
	section table{
	border-top:2px solid gold;
	border-bottom:1px solid gold;
	margin-top:30px;
	border-collapse:collapse;
	text-align:center;}
	
	section table td{
	font-family:돋움;
	font-size:14px;
	height:40px;}
	
	section table caption{
	text-align:left;}
	
	section table tr:first-child{
	background:#FAECC5;
	font-weight:600;}
	
	section table tr{
	border-bottom:1px solid gold;}
	
	section table .title{
	text-align:left;
	padding-left:20px;}
	
	section input[type=button]{
	width:100px;
	height:30px;
	background:gold;
	border:gold;
	color:white;
	margin:3px;}

</style>
</head>
<body>

<section>

<table width="1000" align="center">
<caption><h3>주문내역</h3></caption>
	<tr>
		<td width="120">주문일자</td>
		<td width="120">상품</td>
		<td class="title">상품명</td>
		<td width="60">수량</td>
		<td width="120">결제금액</td>
		<td colspan="2">상태</td>
		<td width="100">상품평</td>
	</tr>
	
	<c:forEach items="${list }" var="gvo">
	<tr>
		<td>${gvo.writeday }</td>
		<td><img src="../resources/img/${gvo.pimg }" width="100" height="80"></td>
		<td class="title">${gvo.title }</td>
		<td>${gvo.su }</td>
		<td><fmt:formatNumber value="${gvo.chong }" pattern="#,###"/>원</td>
		
		<!-- state관련 if -->
		<c:if test="${gvo.state ==0}">
			<c:set var="state" value="결제완료"/>
		</c:if>
		<c:if test="${gvo.state ==1}">
			<c:set var="state" value="취소신청"/>
		</c:if>
		<c:if test="${gvo.state ==2}">
			<c:set var="state" value="취소완료"/>
		</c:if>
		<c:if test="${gvo.state ==3}">
			<c:set var="state" value="배송중"/>
		</c:if>
		<c:if test="${gvo.state ==4}">
			<c:set var="state" value="배송완료"/>
		</c:if>
		<c:if test="${gvo.state ==5}">
			<c:set var="state" value="반품신청"/>
		</c:if>
		<c:if test="${gvo.state ==6}">
			<c:set var="state" value="반품완료"/>
		</c:if>
		<c:if test="${gvo.state ==7}">
			<c:set var="state" value="교환신청"/>
		</c:if>
		<c:if test="${gvo.state ==8}">
			<c:set var="state" value="교환완료"/>
		</c:if>
		<td width="80">${state }</td>
		
		
		<td width="80">
			<!-- 취소신청버튼 -->
			<c:if test="${gvo.state==0 }">
				<input type="button" value="취소신청" onclick="location='change_state?state=1&id=${gvo.id}'"><br>	<!-- state를 1로 변경 -->
			</c:if>
			
			<!-- 취소철회버튼 -->
			<c:if test="${gvo.state==1 }">
				<input type="button" value="취소철회" onclick="location='change_state?state=0&id=${gvo.id}'"><br>	<!-- state를 0로 변경 -->
			</c:if>
			
			<!-- 반품신청버튼 -->
			<c:if test="${gvo.state==3 || gvo.state==4}">
				<input type="button" value="반품신청" onclick="location='change_state?state=5&id=${gvo.id}'"><br>	<!-- state를 5로 변경 -->
			</c:if>
			
			<!-- 교환신청버튼 -->
			<c:if test="${gvo.state==0 || gvo.state==1 ||gvo.state==4 }">
				<input type="button" value="교환신청" onclick="location='change_state?state=7&id=${gvo.id}'"><br>	<!-- state를 7로 변경 -->
			</c:if>
			
		</td>
		<td>
			<c:if test="${gvo.state==4 }">
				<c:if test="${gvo.hugi==0 }">	<!-- 후기작성x -->
					<input type="button" value="상품평작성" onclick="location='review?pcode=${gvo.pcode}&gid=${gvo.id }'">
				</c:if>
				<c:if test="${gvo.hugi==1 }">	<!-- 후기작성o -->
					<input type="button" value="상품평보기" onclick="location='../product/pro_content?pcode=${gvo.pcode}'">
				</c:if>
			</c:if>
			<c:if test="${gvo.state !=4 }">
				<input type="button" value="상품평작성" disabled>
			</c:if>
		</td>
	</tr>
	</c:forEach>
	
</table>

</section>

</body>
</html>