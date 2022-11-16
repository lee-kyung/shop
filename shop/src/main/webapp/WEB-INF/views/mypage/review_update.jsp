<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	section {
     width:1000px;
     height:600px;
     margin:auto;
     margin-top:60px;}
     
     section input[type=text]{
     width:99%;
     height:30px;}
     
     section textarea{
     width:99%;
     height:200px;}
     
     section input[type=submit]{
     width:200px;
     height:40px;
     margin-top:20px;
     margin-left:80px;
     border:1px solid gold;
     background:white;
     color:gold;}
     
     section input[type=submit]:hover{
     border:1px solid gold;
     background:gold;
     color:white;}
     
     section table {
     border-spacing:10px;}
     
     
</style>
<script>
function change_star(n)		// n 이 클릭된 star의 인덱스
{
	var len=document.getElementsByClassName("star").length;
	
	// n보다 같거나 작은 것은 노란색 별로 변경	: 클릭한 별 기준으로 n을 정함. 
	for(i=0; i<=n; i++)
	{
		document.getElementsByClassName("star")[i].src="../resources/main/star1.png"
	}
	// n+1보다 큰것은 회색별로 변경 (길이는 5, 인덱스는 4 (인덱스는 0부터 시작하니까))
	for(i=n+1; i<len; i++)
	{
		document.getElementsByClassName("star")[i].src="../resources/main/star2.png"
	}

	document.review.star.value=n+1;
}
</script>
</head>
<body>


<section>
<form name="review" method="post" action="review_update_ok">
<input type="hidden" name="id" value="${rvo.id }">
<input type="hidden" name="star" value="${rvo.star }">

	<table width="700" align="center">
	<caption><h3>리뷰 수정</h3></caption>
		<tr>
			<td width="100">한줄요약</td>
			<td><input type="text" name="title" value="${rvo.title}"></td>
		</tr>
		<tr>
			<td>상세리뷰</td>
			<td><textarea name="content">${rvo.content }</textarea></td>
		</tr>
		<tr>
			<td>별점</td>
			<td>				
			<!-- varstatus를 이용한 방법 -->						
				<c:forEach begin="1" end="${rvo.star}" varStatus="my">
				<!-- ${my.index }:${my.count } -->	<!-- 매개변수의 숫자를 주기위해(페이지소스를 통해 확인 가능, my.index의 시작은 1이기때문에 -1 을해서 0을 만든다) -->
				<!-- index는 begin의 숫자부터 시작, count는 1부터 시작 -->
      			    <img src="../resources/main/star1.png" class="star" onclick="change_star(${my.index-1})">
        		</c:forEach>
        		<c:forEach begin="1" end="${5-rvo.star}" varStatus="my">		<!-- reivew.jsp랑 비교해보기 (페이지소스) -->
          			<img src="../resources/main/star2.png" class="star" onclick="change_star(${my.index+rvo.star-1})">
         		</c:forEach>
         	<!-- c:set을 이용한 방법 -->
<!--           
         		<c:set var="i" value="0"/>
         		<c:forEach begin="1" end="${rvo.star}">
      			    <img src="../resources/main/star1.png" class="star" onclick="change_star(${i})">
      			<c:set var="i" value="${i+1 }"/>
        		</c:forEach>
        		<c:forEach begin="1" end="${5-rvo.star}">		<!-- reivew.jsp랑 비교해보기 (페이지소스) -->
 <!--    	<img src="../resources/main/star2.png" class="star" onclick="change_star(${i})">
          		<c:set var="i" value="${i+1 }"/>
         		</c:forEach>
-->         		
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="수정">
			</td>
		</tr>
	</table>
</form>
</section>


</body>
</html>