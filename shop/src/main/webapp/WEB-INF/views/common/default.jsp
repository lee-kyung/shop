<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

	body{
	margin:0px;}
	
	#message{
	width:1000px;
	height:33px;
	background:gold;
	margin:auto;
	color:white;}
	
	#message #left{
	float:left;			/*float : div의 정렬*/
	width:980px;		/*float와 display:flex; align-items:center; 는 같이 사용 못함*/
	text-align:center;
	padding-top:4px;}
	
	#message #right{
	float:right;
	width:20px;
	padding-top:4px;
	cursor:pointer;}
	
	header{
	width:1000px;
	height:38px;
/*	background:yellow;
*/	margin:auto;
	padding-top:12px;}
	
	header #left{
	float:left;		/*div를 inline-block하지 않고도 float를 이용해서 한 줄 사용 가능*/
	margin-top:-10px;}	
	
	header #left img{
	cursor:pointer;}
	
	header #right{
	float:right;
	position:relative;
	margin-top:0px;
	font-size:14px;}
	
	header #right #cu ul {	/* 자주하는질문, 1:1상담, 급한상담 */
	position:absolute;
	top:18px;
	padding-left:0px;		/* ul의 border을 줄이기 위해서 */
	padding:5px;
	display:none;
	background:white;
	border:1px solid #cccccc;
	text-align:right;}
	
	header #right #cu ul li{
	list-style-type:none;
	height:25px;}
	
	header #right .login_cu ul {
	left:90px;}
	
	header #right .logout_cu ul {
	left:76px;}
	
	header a{
	text-decoration:none;
	color:black;
	display:inline-block;	/* a태그에 높이를 주기 위해서는 inline-block을 해야한다. */
	height:30px;}			/* 높이를 줘서 하위메뉴와 고객센터가 겹치게 해 하위메뉴로 마우스가 넘어가도 보일수 있도록*/
	
			
	header #myinfo {		/* 회원정보수정, 주문조회, 적립금조회, 나의 글 확인 */
	position:absolute;
	top:20px;
	left:-20px;
	padding-left:0px;
	border:1px solid #cccccc;
	background:white;
	display:none;}
	
	header #myinfo li {
	list-style-type:none;
	width:110px;
	height:25px;
	text-align:center;}
    
    header #myinfo a{
    height:0px;}
    
	nav{
	width:1000px;
	height:40px;
/*	background:orange;
*/	margin:auto;
	margin-top:-10px;}
	
	nav .menu{
	}
	
	nav .menu > li{			/* menu의 자식 li만 해당 : 카테고리, 신상품, 베스트, 특가상품, 이벤트, 검색창*/
	list-style-type:none;
	display:inline-block;
/*	border:1px solid black;
*/	width:130px;
	height:30px;
	font-size:15px;
	text-align:center;}
	
	nav .menu > li:first-child{	/* menu의 첫번째 li : 카테고리*/
	position:relative;}
	
	/*대분류*/
	nav .dae{
	position:absolute;
	left:17px;
	top:26px;
	padding-left:0px;
	background:white;
	display:none;}
	
	nav .dae > li{		/* 농산물 수산물 축산물 가공품*/
	list-style-type:none;
	width:80px;
	height:30px;
	text-align:center;
	padding:5px;}
	
	/*중분류*/
	nav .dae >li{
	position:relative;}
	
	nav .dae .jung{			/* 중분류 ul태그 */
	position:absolute;
	top:0px;
	left:90px;
	padding-left:0px;
	background:white;
/*	border:1px solid black;
*/	padding:5px;
	display:none;}
	
	nav .dae .jung > li{		/* 중분류 메뉴 */
	list-style-type:none;
	width:80px;
	height:40px;}
	
	/*소분류*/
	nav .dae .jung li{
	position:relative;}
	
	nav .dae .jung .so{			/* 소분류 ul 태그*/
	position:absolute;
	left:83px;
	top:-5px;
	padding-left:0px;
	background:white;
	padding:5px;
/*	border:1px solid red;
*/	display:none;}
	
	nav .dae .jung .so li{		/* 소분류 메뉴 */
	list-style-type:none;
	width:80px;
	height:40px;}
	
	
	/*검색창 만들기*/
	
	nav .menu #outer{
	width:250px;
	border:1px solid #cccccc;
	padding:5px;
	border-radius:20px;}
	
	nav .menu >li:last-child{
	width:250px;}
	
	nav .menu >li input[type=text]{
	width:200px;
	border:none;
	outline:none;}
	
	footer{
	width:1000px;
	height:100px;
	background:gold;
	margin:auto;}
	
	footer table{
	color:white;
	font-size:13px;
	text-align:center;}
	
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		
		// 간단메세지를 없애준다.
		$("#message #right").click(function(){
			
			$("#message").slideUp(600);
		});
		
		// 고객센터에 마우스가 올라가는 순간 하위메뉴가 보이도록
		$("#cu").mouseover(function(){
			
			$("header #right #cu ul").show();
		});
		
		// 고객센터에서 마우스가 나가면 하위메뉴가 숨겨지도록
		$("#cu").mouseout(function(){
			
			$("header #right #cu ul").hide();
		});
		
		// 카테고리 하위메뉴 보이기
		$("nav #cate").mouseover(function(){
			
			$("nav .dae").show();
		});
		
		// 카테고리 하위메뉴 숨기기
		$("nav #cate").mouseout(function(){
			
			$("nav .dae").hide();
		});
		
		// 중분류메뉴 보이기 
		$("nav .dae > li").mouseover(function(){	// 농산물, 수산물, 축산물, 가공품에 마우스가 올라오면
			
			// 경고창으로 대분류 인덱스 확인하기
			// alert($(this).index());
			// 대분류메뉴에 마우스가 올라갔을때 해당 중분류메뉴가 보이도록 설정
			var n=$(this).index();
			$("nav .jung").eq(n).show();
			
		});
		
		// 중분류메뉴 숨기기
		$("nav .dae > li").mouseout(function(){	// 농산물, 수산물, 축산물, 가공품에 마우스가 나가면
			
			// 대분류메뉴에 마우스가 나갈때 해당 중분류메뉴 숨기기 
			var n=$(this).index();
			$("nav .jung").eq(n).hide();
			
		});
		
		// 소분류메뉴 보이기
		$("nav .jung > li").mouseover(function(){
			
			// 경고창으로 중분류 인덱스 확인하기
			// alert($(this).index());
			var n=$(this).index();
			$("nav .so").eq(n).show();
		});
		
		// 소분류메뉴 숨기기
		$("nav .jung > li").mouseout(function(){
			
			// 경고창으로 중분류 인덱스 확인하기
			// alert($(this).index());
			var n=$(this).index();
			$("nav .so").eq(n).hide();
		});
		
		$("header #my").mouseover(function(){
		
			$("header #myinfo").show();
		});
			    
		$("header #my").mouseout(function(){
		   	    	
			$("header #myinfo").hide();
		});
	});
	
</script>

	<decorator:head/>
</head>
<body>

<!-- 간단메세지 -->
	<div id="message">
		<div id="left">첫 가입 이벤트 : 어떤 상품이든 100원에 구매 가능 </div>
		<div id="right">X</div>
	</div>

<!-- 로고, 로그인, 회원가입 -->
	<header>
		<div id="left">
			<img src="../resources/img/gs.jpg" width="50" onclick="location='../main/index'">
			<img src="../resources/img/ts.jpg" width="40" onclick="location='../main/index'">
			SHOP
		</div>
		
		<div id="right">
		
		<c:if test="${userid == null}">
			<a href="../login/login"> 로그인 | </a> 
			<a href="../member/memberinput"> 회원가입 | </a>
			<a href="#" id="cu" class="logout_cu"> 고객센터
				<ul>
					<li> 자주하는 질문 </li>			
					<li> 1:1 상담 </li>			
					<li> 급한 상담 </li>			
				</ul>
			</a>
		</c:if>
		
 		<c:if test="${userid != null}">
			<div id="my" style="display:inline-block;height:34px;">
					${name }님 |
				<ul id="myinfo">
					<li> <a href="../mypage/myinfo"> 회원정보 수정 </a></li>
					<li><a href="../mypage/myjumun">주문 조회</a></li>
					<li>적립금 조회</li>
					<li><a href="../mypage/myreview">나의 글 확인</a></li>
					<li><a href="../mypage/wish">wish</a></li>
					<li><a href="../mypage/cart">장바구니</a></li>
				</ul>
			</div>
			<a href="../login/logout"> 로그아웃 |</a>
			<a href="#" id="cu" class="login_cu"> 고객센터
				<ul>
					<li> 자주하는 질문 </li>			
					<li onclick="location='../member/cwrite'"> 1:1 상담 </li>			
					<li> 급한 상담 </li>			
				</ul>
			</a>
		</c:if>
		</div>
	</header>

<!-- 메뉴 및 링크 -->
	<nav>
		<ul class="menu">
			<li id="cate">카테고리
				<ul class="dae">
					<li><a href="../product/pro_list?pcode=p01">농산물</a>
						<ul class="jung">
							<li><a href="../product/pro_list?pcode=p0101">야채류</a>
								<ul class="so">
									<li><a href="../product/pro_list?pcode=p010101">쌈채소</a></li>
									<li><a href="../product/pro_list?pcode=p010102">뿌리채소</a></li>
									<li><a href="../product/pro_list?pcode=p010103">열매채소</a></li>
								</ul>	
							</li>
							<li><a href="../product/pro_list?pcode=p0102">과일류</a>
								<ul class="so">
									<li><a href="../product/pro_list?pcode=p010201">수입과일</a></li>
									<li><a href="../product/pro_list?pcode=p010202">국산과일</a></li>
									<li><a href="../product/pro_list?pcode=p010203">통조림</a></li>
								</ul>	
							</li>
							<li>쌀/잡곡
								<ul class="so">
									<li>햅쌀</li>
									<li>잡곡</li>
									<li>수입</li>
								</ul>	
							</li>
						</ul>
					</li>	
					<li>수산물
						<ul class="jung">
							<li>생선</li>
							<li>해조류</li>
							<li>횟감</li>
						</ul>
					</li>
					<li>축산물
						<ul class="jung">
							<li>소고기</li>
							<li>돼지고기</li>
							<li>닭/오리</li>
						</ul>
					</li>
					<li>가공품
						<ul class="jung">
							<li>건조식품</li>
							<li>통조림</li>
							<li>절임식품</li>
						</ul>
					</li>
				</ul>
			</li>
			<li>신상품</li>
			<li>베스트</li>
			<li>특가상품</li>
			<li>이벤트</li>
			<li>
				<div id="outer">
					<input type="text" id="search" name="search" placeholder="검색어를 입력하세요">
					<img src="../resources/img/s.png" width="15" valign="middle">
				</div>
			</li>
		</ul>
	</nav>
	
	
	<decorator:body/>
	
	<!-- 사이트관련 정보 -->
	<footer>
		<table width="1000" align="center">
			<tr>
				<td height="25">쇼핑몰명</td>
				<td>SHOP</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td >쇼핑몰지기</td>
				<td >이경</td>
				<td	>이메일</td>
				<td >2경@naver.com</td>
			</tr>
			<tr>
				<td >전화번호</td>
				<td >010-999-999</td>
				<td	>사업자등록번호</td>
				<td >123-45-67894</td>
			</tr>
			<tr>
				<td >주소</td>
				<td >서울시 마포구</td>
				<td	></td>
				<td ></td>
			</tr>
		</table>
	</footer>


</body>
</html>
