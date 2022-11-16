<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- section의 height조절 -->
<c:set var="size" value="${list.size() }"/>

 <c:if test="${size <=5}">
   <c:set var="he" value="600"/>
 </c:if>
 <c:if test="${size > 5}">
   <c:set var="he" value="${(size-5)*100+600}"/>
 </c:if>
<style>
	section{
	width:1000px;
	height:${he}px;
	margin:auto;
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
	
	section table tr:last-child{
	border-bottom-color:white;
	text-align:right;}
	
	section table .title{
	text-align:left;
	padding-left:20px;}
	
	section #td{
	width:50px;
	height:25px;
	background:gold;
	color:white;
	font-size:13px;
	border:none;}
	
	section .tr{
	width:90px;
	height:30px;
	background:gold;
	color:white;
	font-size:13px;
	border:none;
	margin-top:30px;}
	
</style>
<script>
	function maincheck(ck)
	{
		
		var len=document.getElementsByClassName("subchk").length;
		
		// main이 체크가 된다면
		if(ck)		// ck 자체가 true, false를 가지기 때문에 조건문에 ck만 작성해도 괜찮다.
		{
			// class="subchk"를 checked속성을 true로 변경
			for(i=0; i<len; i++)
			{
				document.getElementsByClassName("subchk")[i].checked=true;
			}
			
		}
		else
		{
			// class="subchk"를 checked속성을 false로 변경
			for(i=0; i<len; i++)
			{
				document.getElementsByClassName("subchk")[i].checked=false;
			}
		}
	}
	
	function subcheck()
	{
	// 몇개가 체크되었는지 확인하기 위해 chk를 생성
		var chk=0;
		
		// 체크박스의 항목이 전부 체크되었는지 확인
		var len=document.getElementsByClassName("subchk").length;
		
		// 하나씩 체크하기
		for(i=0; i<len; i++)
		{
			if(document.getElementsByClassName("subchk")[i].checked)
			{
				chk++;
				
			}
		}
		
		// 작은 체크박스가 전부 클릭되면 main체크박스도 체크하기 
		if(chk==len)	// chk==len:전부체크되었다는 의미
		{
			document.getElementById("mainchk").checked=true;
		}
		else
		{
			document.getElementById("mainchk").checked=false;
		}
	}
	
	function select_del()
	{
		// 체크된 상품을 삭제 => 체크된 상품의 wish.id를 전송
		var len=document.getElementsByClassName("subchk").length;
		var str="";
		for(i=0; i<len; i++)
		{
			// 서브체크에 체크가 되었다면 해당 value를 가져와서 + ","	(여러개일 수 있으니 ","가 필요하다 )
			if(document.getElementsByClassName("subchk")[i].checked)
			{
				// 삭제할 id들을 구분자를 통해 문자열의 형태로 만든다	=> 11, 33, 22 ....
				str=str+document.getElementsByClassName("subchk")[i].value+",";
			}
		}
		
		// alert(str);
		location="select_del?delid="+str;	// delid=삭제할아이디
	}
	
	function move_cart()
	{
		// pcode는 하나 이상이 존재 
		var pcode="";
		
		// 체크박스가 체크된 곳의 인덱스와 hidden의 인덱스는 같다. => hidden의 value값을 pcode변수에 저장해서 사용
		//										  => 두개 이상일 경우 구분자를 사용. pcode="p01010102,p02020202,..."
		var len=document.getElementsByClassName("subchk").length;
		for(i=0; i<len; i++)
		{
			if(document.getElementsByClassName("subchk")[i].checked)
			{
				pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
			}
		}
//		alert(pcode);
		location="move_cart?pcode="+pcode;
	}
	
	function gumae()
	   {
		   // 선택되어진 상품의 pcode, 수량을  콤마로 구분하여 하나의 문자열로 생성
		   var pcode="";
		   var su="";
		   
		   var subchk=document.getElementsByClassName("subchk");  
		   var len=subchk.length; // 상품의 리스트 갯수
		   //alert(len);
		   for(i=0;i<len;i++)
		   {
			   if(subchk[i].checked)
			   {
				   pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
				   su=su+"1,";
			   }	   
		   }
		   //alert(pcode);
		   //alert(su);
		   							// wish와 cart의 차이를 두기 위해서 wish는 gchk=1을 주고 cart는 gchk=2를 준다. 
		   location="../product/pro_gumae?gchk=1&pcode="+pcode+"&su="+su;
	   }
	
</script>
</head>
<body>
<section>
	
	<table width="900" align="center">
	<caption><h3>W I S H</h3></caption>
		<tr>		
			<td><input type="checkbox" onclick="maincheck(this.checked)" style="width:20px; height:20px;" id="mainchk"></td>
			<td width="90">상품이미지</td>
			<td class="title">상품명</td>
			<td width="120">상품가격</td>
			<td width="120">날짜</td>
			<td width="90">삭제</td>
		</tr>
		<c:forEach items="${list }" var="wvo">
		<input type="hidden" value="${wvo.pcode }" class="pcode">
		<tr>									<!-- 배열로 접근하기 위해서 id가 아닌 class로 사용 -->						
			<td><input type="checkbox" class="subchk" onclick="subcheck()" value="${wvo.id }"></td>
			<td><img src="../resources/img/${wvo.pimg }" width="100" height="80"></td>
			<td class="title">${wvo.title }</td>
			<td><fmt:formatNumber value="${wvo.price }"></fmt:formatNumber></td>
			<td>${wvo.writeday }</td>
			<td><input type="button" value="삭제" onclick="location='wish_del?id=${wvo.id}'" id="td"></td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="6">
			<input type="button" value="선택삭제" onclick="select_del()" class="tr">
			<input type="button" value="장바구니이동" onclick="move_cart()" class="tr">			
			<input type="button" value="상품구매" onclick="gumae()" class="tr">			
			</td>
		</tr>
	</table>
</section>
</body>
</html>