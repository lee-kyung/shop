<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

 
<style>
	section {
	width:1000px;
	margin:auto;
	margin-top:70px;}
	
	section a{
	text-decoration:none;
	color:black;}
	
    section #a1 {
	width:1000px;}
	
    section #a1 #left {
	width:500px;
	height:450px;
	float:left;}
	
    section #a1 #right {
	width:500px;
	height:400px;
	float:right;}
	
	section #a1 #right div{
	margin-top:15px;}				/*div 간격*/
	
	section #a1 #right div:first-child{
	margin-top:0px;}				/* 첫번째 div의 top*/
	
	section #a1 #right #made{
	font-size:14px;
	color:blue;}
	
    section #a1 #right #title{
    margin-top:5px;
    font-size:22px;
    font-weight:700;}
    
    
    section #a1 #right #price #halin{
    font-size:15px;
    display:inline-block;
    margin-top:20px;}
    
    section #a1 #right #price s{
    font-size:15px;
    color:gray;}
    
    section #a1 #right #price #gap{
    height:40px;}
    
    section #a1 #right #price #tot{
    font-size:20px;
    color:red;
    font-weight:700;}
    
    
    
    section #a1 #right #juk{
    font-size:13px;}
    
    section #a1 #right #baeprice{
    font-size:14px;
    margin-top:30px;}
    
    section #a1 #right #bae{
    font-size:14px;
    color:green;}
    
    section #a1 #right #su{
    margin-top:30px;}
    
    section #a1 #right #su #spinner{
    width:50px;
    outline:none;}
    
    section #a1 #right #etc{
    margin-top:90px;
    margin-left:120px;}
    
    section #a1 #right #etc .btn{	
    width:120px;
    height:25px;
    border:1px solid gold;
    background:gold;
    color:white;
    display:inline-block;			/*span 태그 가로세로를 주기위해서 */
    text-align:center;
    padding-top:5px;
    cursor:pointer;}
    
 	
    section #a2 {
	clear:both;		/* float기능 해제*/
	width:1000px;
	padding-top:150px;
	margin-bottom:30px;}
    
    section #pcmenu{
    width:1000px;
    height:50px;
    margin:auto;
    margin-bottom:50px;
    text-align:center;
    position:relative;}
    
    section #pcmenu ul{
    padding-left:0px;}
    
    section #pcmenu ul li{
    list-style-type:none;
    display:inline-block;
    width:248px;
    height:40px;
    text-align:center;
    border:1px solid gold;
    border-top:3px solid gold;
    padding-top:12px;
    border-right:none;
    background:#FAECC5;
    cursor:pointer;}
    
    section #pcmenu ul li:last-child{
 	border-right:1px solid gold;}
 	
 	section #pcmenu ul li:first-child{
 	background:white;
 	border-bottom:none;}
 	
 	section #review{
 	width:1000px;
 	margin-bottom:30px;
 	margin-top:20px;}
 	
 	section #inq{
 	width:1000px;
 	margin-bottom:30px;
 	margin-top:20px;}
 	
 	section #an{
 	width:1000px;
 	margin-bottom:30px;
 	margin-top:20px;}
 	
    section #cart_msg{
    position:absolute;
	visibility:hidden;
    width:300px;
    height:120px;
    border:2px solid gold;
    background:white;
    text-align:center;}
    
    section #cart_msg #cart_text{
    margin-top:20px;
    font-size:14px;}
    
    section #cart_msg input[type=button]{
    width:110px;
    height:25px;
    border:1px solid gold;
    background:gold;
    color:white;
    margin-top:30px;}
    
 	section #qlayer {
    position:absolute;
    width:440px;
    height:250px;
    border:1px solid gold;
    background:white;
    visibility:hidden;}
    
    section #qlayer table input[type=button],[type=submit]{
    width:100px;
    height:35px;
    background:gold;
    border:gold;
    color:white;}
    
    section #qlayer table textarea{
    resize:none;
    width:300px;}
    
    section #qtable{
    border-bottom:3px solid gold;
    border-top:1px solid gold;}
    
    section #qq{
    border:1px solid gold;
    background:gold;
    border-radius:10px;
    padding-left:4px;
    margin-right:5px;
    color:white;}
    
    section #qq2{
    border:1px solid gold;
    background:white;
    border-radius:10px;
    padding-left:2px;
    margin-right:5px;
    color:gold;}
    
    section #qtable td{
    padding:10px;}
    
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script>
	$(function(){
		
		$("#spinner").spinner({
			
			min:1,
			max:10,
			
			// 수량 변경시 실행
			spin:function(e,ui){
				
				var total=parseInt(${ pvo.price - ( pvo.price*(pvo.halin/100) )  }*ui.value); 
	    			                   // 할인금액을 뺀 상품금액   *  수량
				total=new Intl.NumberFormat().format(total); 			// 금액에 ',' 넣기 
				document.getElementById("tot").innerText=total+"원";
				
				
				// 적립금 변경
				var juk_tot=parseInt(${ pvo.juk }*ui.value); 
				juk_tot=new Intl.NumberFormat().format(juk_tot); 			// 금액에 ',' 넣기 
				document.getElementById("juk_in").innerText=juk_tot+"원";
			}
		});
	    		 
	});
	
	// 사용자 아이디, 상품코드를 wish테이블에 저장
	function wish_add()
	{
		
		if(confirm("wish에 상품을 추가할까요?"))	// 확인, 취소
		{
			var chk=new XMLHttpRequest();
			chk.onload=function()
			{
				//alert(chk.responseText);
				if(chk.responseText=="0")
					alert("WISH에 저장되었습니다.");
				else
					alert("내부 오류 발생");
		 }
		 chk.open("get", "wish_add?pcode=${pvo.pcode}");	// 아이디는 session에 있으니까 매개변수로 보내지 않아도 된다.
		 chk.send();
			
		}
		else
		{
			
		}
		
		
	}
	
	// 사용자 아이디, 상품코드, 수량을 cart테이블에 저장
	function cart_add() 
	{
		var chk=new XMLHttpRequest();
    	var su=document.pro.su.value;
    	var x=event.clientX-100;		// 마우스 x좌표
    	var y=event.clientY-100;		// 마우스 y좌표
    	
    	chk.onload=function()
    	{
    		if(chk.responseText=="0")
    		{

    			document.getElementById("cart_msg").style.top=485+"px";
    			document.getElementById("cart_msg").style.left=1145+"px";
    			
    			document.getElementById("cart_msg").style.visibility="visible";

    		/* 마우스 위치에 따라
    			document.getElementById("cart_msg").style.top=y+"px";
    			document.getElementById("cart_msg").style.left=x+"px";
    		*/
    		
    		/*	if(confirm("장바구니로 이동하시겠습니가?"))
    			{
    				location="../product/cart_view";
    			}
    		*/
    		}	
    		else
    		{
    			alert("내부 오류");
    		}	
    	}
    	chk.open("get","cart_add?pcode=${pvo.pcode}&su="+su);
    	chk.send();
    }
	
	function pro_submit()
	{
		document.pro.submit();
	}
	
	function change_sub(n)
	{
		var pcsub=document.getElementsByClassName("pcsub");
		var len=pcsub.length;

		// 기본 배경색 #FAECC5, 밑줄 o
		for(i=0; i<len; i++)
		{
			pcsub[i].style.background="#FAECC5";
			pcsub[i].style.borderBottom="1px solid gold";
		}
		
		// 클릭된 li는 배경색 white, 밑줄 x
		pcsub[n].style.background="white";
		pcsub[n].style.borderBottom="none";
	}
	
	// 스크롤이 특정값이 될 경우 #pcmenu를 position:fixed로 변경
	function pcmenu_stop()  // 스크롤이 특정값이 될 경우 #pcmenu를 position:fixed로 변경
     {
		// 스크롤하기 위한 특정값을 구하기위해서 사용
  //	 document.getElementById("abc").innerText=document.documentElement.scrollTop;
		
		// fixed와 relative를 변경함으로 스크롤이동시 특정위치에 고정
		var top=document.documentElement.scrollTop;
		if(top>710)
		{
			document.getElementById("pcmenu").style.position="fixed";
			document.getElementById("pcmenu").style.top="-17px";
		}
		else
		{
			document.getElementById("pcmenu").style.position="relative";
		}
     }
	
     window.onscroll=pcmenu_stop;
     
     function qwrite()
     {
    	 document.getElementById("qlayer").style.visibility="visible";
    	 position_chg();
     }
     
     // 브라우저 중앙에 레이어를 위치 시키지 위한 좌표
     function position_chg()
     {
    	 var x=innerWidth;  // 브라우저 가로
    	 var y=innerHeight; // 브라우저 세로
    	 var left=(x/2)-220;
    	 var top=(y/2)-125+document.documentElement.scrollTop;
    	 
    	 document.getElementById("qlayer").style.left=left+"px";
    	 document.getElementById("qlayer").style.top=top+"px";
     }
     
     // 브라우저의 크기를 바꿀때마다 실행
     window.onresize=position_chg;
</script>
</head>
<body>

<section>
<form name="pro" method="post" action="pro_gumae">
<input type="hidden" name="pcode" value="${pvo.pcode }">
<input type="hidden" name="gchk" value="0">
	<article id="a1">
		<div id="left"><img src="../resources/img/${pvo.pimg }" width="400" height="450"></div>
		<div id="right">
		
			<!-- 제조사 -->
			<div id="made">${pvo.made }</div>
			
			<!-- 상품명 -->
			<div id="title">${pvo.title }</div>
			
			<hr>
			
			<!-- 별점 -->
			<div id="star"></div>
			
			<!-- 가격 -->
			<div id="price">
			
			<!-- 할인율이 있는 경우 -->
				<c:if test="${pvo.halin !=0 }">
					<span id="halin">${pvo.halin }%</span> <s><fmt:formatNumber value="${pvo.price }"/>원</s>
					<br>
					<span id="tot"><fmt:formatNumber value="${ pvo.price - ( pvo.price*(pvo.halin/100) )  }" pattern=",000"/>원</span>
				</c:if>
			<!-- 할인율이 없는 경우 -->
				<c:if test="${pvo.halin ==0 }">
					<div id="gap"></div>
					<span id="tot"><fmt:formatNumber value="${pvo.price}"/>원</span>
				</c:if>
			</div>
		
		<!-- 적립금 -->
			<div id="juk">
				최대 <span id="juk_in"><fmt:formatNumber value="${pvo.juk }"/></span>원 적립
			</div>
		
		<!-- hr색상변경 -->
			<hr style="background:#EAEAEA; height:1px; border:0;">
			
		<c:choose>
			<c:when test="${pvo.yoil==1 }">
				<c:set var="yo" value="일요일"/>
			</c:when>
			<c:when test="${pvo.yoil==2 }">
				<c:set var="yo" value="월요일"/>
			</c:when>
			<c:when test="${pvo.yoil==3 }">
				<c:set var="yo" value="화요일"/>
			</c:when>
			<c:when test="${pvo.yoil==4 }">
				<c:set var="yo" value="수요일"/>
			</c:when>
			<c:when test="${pvo.yoil==5 }">
				<c:set var="yo" value="목요일"/>
			</c:when>
			<c:when test="${pvo.yoil==6 }">
				<c:set var="yo" value="금요일"/>
			</c:when>
			<c:when test="${pvo.yoil==7 }">
				<c:set var="yo" value="토요일"/>
			</c:when>
		</c:choose>
			
			
		<!-- 배송관련 -->
			<div id="baeprice">배송비 ${pvo.baesong }원</div>
			<div id="bae">${pvo.baeday2 } ${yo } 도착예정</div>
		
		<!-- hr색상변경 -->
			<hr style="background:#EAEAEA; height:1px; border:0;">
		
		<!-- 수량 -->
			<div id="su">				<!-- 서버에 보내기 위해서는 name은 필수 -->
				<input type="text" id="spinner" name="su" value="1" readonly>
			</div>
			
		<!-- 위시, 장바구니, 구매 -->
			<div id="etc">
			<!-- wish -->
				<c:if test="${userid!=null }">	<!-- 로그인 한 경우 -->
					<!-- wish에 해당 상품이 없는 경우 -->
					<c:if test="${wishcnt==0 }">
						<span class="btn" onclick="wish_add()">WISH</span>
					</c:if>
					<!-- wish에 해당 상품이 있는경우 -->
					<c:if test="${wishcnt==1 }">
						<span class="btn" onclick="location='wish_cancel?pcode=${pvo.pcode}'">WISH취소</span>
					</c:if>
				</c:if>
				
				<c:if test="${userid==null }">	<!-- 로그인 하지 않은 경우 -->
					<span class="btn" onclick="alert('회원만 이용가능합니다.')">WISH</span>
				</c:if>
				
			<!-- 장바구니 -->
				<c:if test="${userid!=null }">
					<span class="btn" onclick="cart_add()">장바구니</span>
				</c:if>
				<c:if test="${userid==null }">
					<span class="btn" onclick="alert('회원만 이용가능합니다.')">장바구니</span>
				</c:if>
				
			<!-- 바로구매 -->
				<span class="btn" onclick="pro_submit()"> 바로구매 </span>
				
			</div>
		</div>
	</article>
</form>
	
	<article id="a2">
	
	<div id="pcmenu">
		<ul>									<!-- href="#이름"은 해당 아이디이름을 가진 곳으로 이동 -->
			<li class="pcsub" onclick="change_sub(0)"><a href="#a2">상품상세</a></li><li class="pcsub" onclick="change_sub(1)"><a href="#review">상품평</a></li><li class="pcsub" onclick="change_sub(2)"><a href="#inq">상품문의</a></li><li class="pcsub" onclick="change_sub(3)"><a href="#an">배굥/교환/반품안내</a></li>
		</ul>
	</div>
	
	
		<img src="../resources/img/${pvo.cimg }" width="1000">
	</article>
	
	<span id="abc"></span>
	<hr>
	<!-- 상품평 : pro_content에서 요청시 review테이블에서 현재 상폼 pcode의 내용을 전부가져오기  -->
	<c:if test="${!empty rlist }"> 
    <article id="review"> <!--  상품평  : pro_content요청시  review테이블에서 현재 상품pcode의 내용을 전부 가져오기-->
       <h2> 상 품 평 </h2>
       <div class="pers">
         <!-- 총별점 출력하는 부분 -->
         <c:forEach begin="1" end="${chong_star}">
          <img src="../resources/main/star1.png">
         </c:forEach>
         <c:forEach begin="1" end="${5-chong_star}">
          <img src="../resources/main/star2.png">
         </c:forEach>
   
         <!-- 사용자별 상품평 출력하기 -->
         <c:forEach items="${rlist}" var="rvo">
          <div style="margin-top:30px;"> ${fn:substring(rvo.userid,0,4)}**** </div>
          <!-- 
          	아이디4자+****
          	${fn:substring(rvo.userid, 0, 4)}
           -->
          
          <div> 
            <c:forEach begin="1" end="${rvo.star}">
             <img src="../resources/main/star1.png" width="15">
            </c:forEach>
            <c:forEach begin="1" end="${5-rvo.star}">
             <img src="../resources/main/star2.png" width="15">
            </c:forEach>
          </div>
          <div><b> ${rvo.title}</b></div>
          <div> ${rvo.content}</div>
          <p>
         </c:forEach>
         
       </div>
    </article>
	</c:if>
	<hr>
	<!-- 상품문의 -->
	<article id="inq">
		<h2 align="left">상품문의 
			<span style="font-size:13px" onclick="qwrite()">문의하기</span>
		</h2>
		
		<table width="900" align="center" cellspacing="0" id="qtable">
     	<c:forEach items="${qlist}" var="qvo">
       		<tr>
         		<td width="700" style="border-top:2px solid gold">
         		<!-- 질문인지 답변인지 출력 -->
         			<c:if test="${qvo.seq==1 }">
         				<span id="qq"> Q </span>
         			</c:if>
         			<c:if test="${qvo.seq==2 }">
         				<span id="qq2"> A </span>
         			</c:if>
         			${qvo.email} 
         		</td>
         		<td style="border-top:2px solid gold; text-align:right;"> ${qvo.writeday} </td>
       		</tr>
       		<tr>
         		<td colspan="2"> <b>${qvo.ptitle} </b></td>
       		</tr>
       		<tr>
       			<c:if test="${qvo.seq==1 }">
         			<td colspan="2"> ${qvo.content} </td>
         		</c:if>
         		<c:if test="${qvo.seq==2 }">
         			<td colspan="2" style="padding-left:30px; border-bottom:1px solid gold;"> ${qvo.content} </td>
         		</c:if>
         			
       		</tr>
     	</c:forEach>
    	</table>
	</article>
	<hr>
	<!-- 배송/교환/안내 -->
	<article id="an">
		<h2 align="left">배송/교환/안내</h2>	
		<table width="1000"  border="1">
		<caption><h3>배송 정보</h3></caption>
			<tr>
				<td width="180">배송방법</td>
				<td>신선/냉장/냉동</td>
				<td rowspan="2">배송비</td>
				<td rowspan="2"></td>
			</tr>
			<tr>
				<td>배송사</td>
				<td>CJ택배</td>
			</tr>
		</table>
		
		
		<table width="1000"  border="1">
		<caption><h3>교환/반품안내</h3></caption>
			<tr>
				<td width="180">교환/반품 비용</td>
				<td>4,000원 <br>
					-단, 고객 변심의 경우에만 발생 <br> 
					-도서산간 지역 배송불가
				</td>
			</tr>
			<tr>
				<td>교환/반품 신청기준일</td>
				<td>
				- 단순변심에 의한 교환/반품은 제품 수령 후 7일 이내까지, 교환/반품 제한사항에 해당하지 않는 경우에만 가능 (배송비용과 교환/반품 비용 왕복배송비 고객부담)<br>
				- 상품의 내용이 표시·광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 가능
        		</td>
			</tr>
		</table>
	</article>
	<hr>
<!-- 상품문의 레이어 -->
	 <div id="qlayer"> 
     <form method="post" action="qwrite_ok">
		<input type="hidden" name="pcode" value="${pvo.pcode}">
		<input type="hidden" name="seq" value="1">
		<table width="400" align="center">
        <caption> <h3> 상품 문의 </h3> </caption>
			<tr>
          		<td> 상품 정보 </td>
         		<td> <input type="text" name="ptitle" value="${pvo.title}" readonly style="border:none;outline:none;font-size:15px"> </td>
       		</tr>
       		<tr>
         	 	<td> 문의내용 </td>
          		<td> <textarea cols="30" rows="6" name="content"></textarea> </td>
        	</tr>
        	<tr>
          		<td colspan="2" align="center">
            		<input type="submit" value="문의작성">
            		<input type="button" value="취소">
          		</td>
        	</tr>
      	</table>
     </form>
     </div>
	
<!-- 장바구니 레이어 -->
<div id="cart_msg">
	<div id="cart_text">상품이 장바구니에 담겼습니다.</div>
	<input type="button" value="장바구니로 이동" onclick="location='../mypage/cart'">
	<input type="button" value="계속 쇼핑" onclick="document.getElementById('cart_msg').style.visibility='hidden'">
</div>

</section>

</body>
</html>