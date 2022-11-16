<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<form name="review" method="post" action="review_ok">
<input type="hidden" name="pcode" value="${pcode }">	<!-- 전달받은 pcode와 gid(service -review확인) -->
<input type="hidden" name="gid" value="${gid }"><!-- gumae테이블의 아이디 -->
<input type="hidden" name="star" value="1">
	<table width="700" align="center">
	<caption><h3>리뷰 작성</h3></caption>
		<tr>
			<td width="100">한줄요약</td>
			<td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>상세리뷰</td>
			<td><textarea name="content"></textarea></td>
		</tr>
		<tr>
			<td>별점</td>
			<td>										<!-- 동일한 이름의 배열 인덱스는 순서대로 0부터 생김 -->
				<img src="../resources/main/star1.png" class="star" onclick="change_star(0)">	<!-- index:0 -->
				<img src="../resources/main/star2.png" class="star" onclick="change_star(1)">	<!-- index:1 -->
				<img src="../resources/main/star2.png" class="star" onclick="change_star(2)">	<!-- index:2 -->
				<img src="../resources/main/star2.png" class="star" onclick="change_star(3)">	<!-- index:3 -->
				<img src="../resources/main/star2.png" class="star" onclick="change_star(4)">	<!-- index:4 -->
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="리뷰등록">
			</td>
		</tr>
	</table>
</form>
</section>
</body>
</html>