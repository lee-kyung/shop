<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
     margin-top:60px;
   }
   section div  {
     width:400px;
     height:30px;
     margin:auto;
     display:flex;
     align-items:center;
     justify-content:center;
     margin-top:20px;
   }
   section div:first-child {
     font-size:22px;
     font-weight:900;
   }
   section div:nth-child(2) {
     border:1px solid #cccccc;
     
   }
   section div:nth-child(3) {
     border:1px solid #cccccc;
     width:386px;
     height:150px;
     align-items:flex-start;
     justify-content:flex-start;
     padding:6px;
     overflow:auto;
   }
  #fourth {
     border:1px solid #cccccc;
     width:386px;
     height:150px;
     align-items:flex-start;
     justify-content:flex-start;
     padding:6px;
     overflow:auto;
   }
   
   section div:last-child {
     margin-top:0px;
   }    
   section input[type=button]  {
   	 margin-top:30px;
     width:250px;  
     height:35px;   
     background:gold;
     border:1px solid gold;
   }
   section input[type=button]:nth-child(2)  {
     margin-left:30px;
   }
   section input[type=button]:last-child  {
     margin-left:30px;
   }
 </style>
</head>
<body>
  <section>
    <div> ${name }님의 상담내용 </div>
    <div><b> ${cvo.title} </b></div>
    <div> ${cvo.content} </div>
    
    <c:if test="${!empty content }">
    	<div id="fourth"> ${content} </div> <!-- 관리자 답변 -->
    </c:if>
    
    <div> 
      <input type="button" value="목록" onclick="location='clist'">
      <input type="button" value="수정" onclick="location='cupdate?id=${cvo.id}'">
      <input type="button" value="삭제" onclick="location='cdelete?id=${cvo.id}'">
    </div>
  </section>
</body>
</html>