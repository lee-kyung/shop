<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section{
	margin-bottom:50px;
	height:680px;}
	
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
	
</style>
</head>
<body>

<section>

<table width="900" align="center">
<caption><h3>나의 상품평</h3></caption>
	<tr>
		<td colspan="2">상품</td>
		<td width="100">별점</td>
		<td class="title">한줄평</td>
		<td width="120">작성일</td>
		<td width="120"></td>
	</tr>
	<c:forEach items="${rlist }" var="rvo">
	<tr>
		<td width="100">${rvo.ptitle }</td>
		<td width="100">
			<img src="../resources/img/${rvo.pimg }" width="50" height="50">
		</td>
		<td>
 		<c:forEach begin="1" end="${rvo.star}">
          <img src="../resources/main/star1.png" width="15" height="15">
         </c:forEach>
         <c:forEach begin="1" end="${5-rvo.star}">
          <img src="../resources/main/star2.png" width="15" height="15">
         </c:forEach>
		</td>
		<td class="title">${rvo.title }</td>
		<td>${rvo.writeday }</td>
		<td>	
			<input type="button" value="수정" onclick="location='review_update?id=${rvo.id}'">
			<input type="button" value="삭제" onclick="location='review_del?id=${rvo.id}&gid=${rvo.gid}'">
																		<!-- 리뷰테이블 아이디 & 구매테이블 아이디 -->
		</td>
	</tr>
	</c:forEach>
</table>

</section>


</body>
</html>