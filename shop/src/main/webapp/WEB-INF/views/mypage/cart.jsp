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
	
	section .spinner{
	width:30px;
	outline:none;}
	
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function(){
		
		var exprice=[${str}];	// 자바스크립트 배열안에 표현식을 넣기  .. ex)[4500,3500,150000,8000]
		
		var $imsi=$(".spinner");
		$(".spinner").spinner({
			
			min:1,
			max:10,
			
			// 값이 바뀔때 동작하는 영역
			spin:function(e,ui)
			{
				// 인덱스
				var n=$imsi.index(this);
				
				// 바뀐수량
				var s=ui.value;
				
				// 상품가격
	//			var price=$(".price").eq(n).text();
				
				// '원' 없애기
	//			price=price.replace("원","");
				
				// ',' 없애기
	//			price=price.replace(/,/g,"");
				
				
				var total=exprice[n]*s;
				
				// 자바스크립트로  ',' 넣기
				total=new Intl.NumberFormat().format(total);
				total=total+"원";
				$(".price").eq(n).text(total);
			}
		});
	});
</script>
<script>
	function maincheck(ck) // ck=> true, false
	{
	   
	   var len=document.getElementsByClassName("subchk").length;
	   if(ck)  // main이 체크가 되면
	   {  // class='subchk'를 checked속성을 true
		   for(i=0;i<len;i++)
		   {
			   document.getElementsByClassName("subchk")[i].checked=true;
		   }	   
	   }	 
	   else
	   {
		   for(i=0;i<len;i++)
		   {
			   document.getElementsByClassName("subchk")[i].checked=false;
		   }
	   }	    
	}
	function subcheck()
	{
	   var chk=0;
	   // 체크박스의 항목이 전부 체크 되었느냐를 확인
	   var len=document.getElementsByClassName("subchk").length;
	   // 하나씩 체크하기
	   for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked)
			   chk++;
	   }	
	   
	   if(chk==len)
	   {
		   document.getElementById("mainchk").checked=true;
	   }	
	   else
	   {
		   document.getElementById("mainchk").checked=false;
	   }	   
	}

	function cart_select_del()
	{
	   // 체크된 상품을 삭제 => 체크된 상품의 wish.id를 전송
	   // 삭제할 id들을 구분자를 통해 문자열의 형태로 만든다 => 11,33,22,
	   var len=document.getElementsByClassName("subchk").length;
	   var str="";
	   for(i=0;i<len;i++)
	   {
		   if(document.getElementsByClassName("subchk")[i].checked) // 삭제체크가 되었다면
		      str=str+document.getElementsByClassName("subchk")[i].value+",";
	   }
	  // alert(str);
	   location="cart_select_del?delid="+str;    // delid=삭제할id
	}
	
	function gumae()
	{
		// 선택되어진 상품의 pcode, 수량을 콤마로 구분하여 하나의 문자열로 생성
		var pcode="";
		var su="";
		
		var subchk=document.getElementsByClassName("subchk"); 
		var len=subchk.length;
		//alert(len);
		for(i=0; i<len; i++)
		{
			if(subchk[i].checked)
			{
				pcode=pcode+document.getElementsByClassName("pcode")[i].value+",";
				su=su+document.getElementsByClassName("spinner")[i].value+",";
			}
		}	
		//alert(pcode);
		//alert(su);
								// wish와 cart의 차이를 두기 위해서 wish는 gchk=1을 주고 cart는 gchk=2를 준다. 
		location="../product/pro_gumae?gchk=2&pcode="+pcode+"&su="+su;
	}

</script>
</head>
<body>
<section>
	
	<table width="900" align="center" >
	<caption><h3>장바구니</h3></caption>
		<tr>		
			<td><input type="checkbox" onclick="maincheck(this.checked)" style="width:20px; height:20px;" id="mainchk"></td>
			<td width="100">상품이미지</td>
			<td class="title">상품명</td>
			<td width="40">수량</td>
			<td width="120">상품가격</td>
			<td width="120">날짜</td>
			<td width="60">삭제</td>
		</tr>
		<c:forEach items="${list }" var="cvo">
		<input type="hidden" class="pcode" value="${cvo.pcode }">
		<tr>									<!-- 배열로 접근하기 위해서 id가 아닌 class로 사용 -->						
			<td><input type="checkbox" class="subchk" onclick="subcheck()" value="${cvo.id }"></td>
			<td><img src="../resources/img/${cvo.pimg }" width="100" height="80"></td>
			<td class="title">${cvo.title }</td>
			<td><input type="text" class="spinner" value="${cvo.su }" readonly></td>
			<td class="price"> <fmt:formatNumber value="${cvo.price}"/>원 </td>
			<td>${cvo.writeday }</td>
			<td><input type="button" value="삭제" onclick="location='cart_del?id=${cvo.id}'" id="td"> </td>
		</tr>
		</c:forEach>
		<tr>
			<td colspan="7">
				<input type="button" value="선택삭제" onclick="cart_select_del()" class="tr"> 
				<input type="button" value="상품구매" onclick="gumae()" class="tr">			
			</td>
		</tr>
	</table>
</section>
</body>
</html>