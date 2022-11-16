<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	td{
	width:100px;
	height:100px;}
</style>
</head>
<%
	String[] test={"1", "2", "3", "4", "5", "6", "7", "8", "9", "3", "3", "3", "3"};
	request.setAttribute("list", test);
%>
<body><!-- 테이블 태그를 이용하여 1행에 3열을 만들어 출력하기 -->

<!-- 배열의 각 항목이 열에 출력 -->
<c:set var="m" value="5"/>
<c:set var="ck" value="0"/>
	<table width="800" border="1">
	<tr>
		<c:forEach items="${list }" var="i">
			<td>${i }</td>	
			<c:set var="ck" value="${ck+1 }"/>	<!-- td가 출력될 때마다 하나씩 증가 -->
												<!-- 1:1 2:2 3:3 4:4 5:5 -->
												<!-- 1:6 2:7 3:8 4:9 5:10 -->
		<c:if test="${ck%m == 0 }">	<!-- ck를 5로 나누었을 0이면 tr을 닫고 열어라 -->
	</tr>							
	<tr>
		</c:if>
		</c:forEach>
	</tr>
	</table>

<hr>
<!-- 한 행에 원하는 만큼의 열을 출력 -->
<table border="1">
<tr>
	<c:forEach begin="1" end="30">
		<td></td>
</tr>
<tr> 
	</c:forEach>
</tr>
</table>


<!-- 
// 배열의 크기는 행의 역할  
<c:set var="n" value="3"/>	 // 1행에 들어갈 열의 개수
	<table width="800" border="1">
	<c:forEach items="${list }" var="i">	 // 배열의 크기만큼 동작
		<tr>
 
		<c:forEach begin="1" end="${n }">
			<td></td>
		</c:forEach>

		</tr>	
	</c:forEach>
	</table>
 -->
</body>
</html>