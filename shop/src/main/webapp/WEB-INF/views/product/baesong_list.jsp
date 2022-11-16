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
	#left{
	float:left;
	width:50px;
	height:20px;
	border:1px solid gold;
	text-align:center;
	cursor:pointer;
	font-size:13px;}
	
	#right{
	float:right;
	width:50px;
	height:20px;
	border:1px solid gold;
	text-align:center;
	background:gold;
	color:white;
	cursor:pointer;
	font-size:13px;}
	
	.outer{
	margin-top:5px;
	width:370px;
	height:140px;
	border:2px solid gold;
	padding:5px;
	font-size:14px;}
	
	.outer div{
	margin-top:5px;}
	
	#chuga{
	width:380px;
	height:40px;
	cursor:pointer;
	border:1px solid gold;
	margin-top:20px;
	text-align:center;
	background:gold;
	color:white;
	font-size:14px;}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
//현재 창의 주소를 부모창의 배송주소로 이동
	$(function(){
		
		var $ss=$(".sel");
		$(".sel").click(function(){
				   
			var n=$ss.index(this);
			opener.$("#bname").text($(".name").eq(n).text());
			opener.$("#bjuso").text($(".juso").eq(n).text());
			opener.$("#bphone").text($(".phone").eq(n).text());
			opener.$("#bchuga").text($(".chuga").eq(n).text());
			
			// 오픈된 창 닫기 
			close();
		});
	});

/*
	// 현재 창의 주소를 부모창의 배송주소로 이동
	function change(n)
	{
		// 부모창의 요소 = 현재창의 요소
		opener.document.getElementById("bname").innerText=document.getElementsByClassName("name")[n].innerText;
	    opener.document.getElementById("bjuso").innerText=document.getElementsByClassName("juso")[n].innerText;
	    opener.document.getElementById("bphone").innerText=document.getElementsByClassName("phone")[n].innerText;
	    opener.document.getElementById("bchuga").innerText=document.getElementsByClassName("chuga")[n].innerText;
	}
*/

// 자바스크립트를 이용한 submit
	function edit(id)
	{
	   document.editform.id.value=id;
	   document.editform.submit();
	}
	

</script>
</head>
<body>

<h2 align="center">배송 주소록</h2>
<c:set var="i" value="0"/>
<c:forEach items="${list }" var="bvo">
	<div class="outer">
		<div class="name"><b>${bvo.name }</b></div>
		<hr>
		<div class="juso">${bvo.juso } ${bvo.juso_etc }</div>
		<div class="phone">${bvo.phone }</div>
		
		
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
		
	
		<div class="chuga">${chuga}</div>
		<div>
			<div id="left" onclick="edit(${bvo.id})">수정</div>
			<div id="right" class="sel"> 선택 </div> 
			
<!--		<div id="right" onclick="change(${i})">선택</div>
 -->
		</div>
	</div>
<c:set var="i" value="${i+1}"/>
</c:forEach>

	<div><input type="button" id="chuga" onclick="location='juso_add'" value="주소록 추가"> </div>
	
<!-- 수정을 위해 필요한 폼 -->
<form name="editform" method="post" action="baesong_edit">
    <input  type="hidden" name="id">
</form>

</body>
</html>