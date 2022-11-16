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
	height:680px;
	margin:auto;
	margin-top:60px;}
	
	section table{
	font-size:13px;}
	
	section tr:first-child td {
	border-top:2px solid gold;
	font-size:15px;
	font-weight:600;
	background:#FAECC5;}
	
	section td {
    border-bottom:1px solid gold;
    height:40px;}
    
    section tr:last-child td {
    border-bottom:2px solid gold;}
    
    section a {
    text-decoration:none;
    color:black;}
</style>
</head>
<body>

<section>
	
	<table  width="700" align="center" cellspacing="0">
		<tr>
			<td>상담제목</td>
			<td width="150">상담날짜</td>
			<td width="150">답변여부</td>
		</tr>
		<c:forEach items="${clist }" var="cvo">
		<tr>
			<td><a href="ccontent?id=${cvo.id}">${cvo.title }</a></td>
			<td>${cvo.writeday }</td>
			<c:if test="${cvo.cnt==0 }">
				<td>답변 미작성</td>
			</c:if>
			<c:if test="${cvo.cnt==1 }">
				<td>답변 완료</td>
			</c:if>
		</tr>
		
		</c:forEach>
		
	</table>
	
</section>

</body>
</html>