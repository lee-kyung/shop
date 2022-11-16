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
     height:500px;
     margin:auto;
     text-align:center;
     margin-top:60px;
   }
   section input[type=text] {
     width:400px;
     height:30px;
     outline:none;
   }
   section textarea {
     width:400px;
     height:200px;
     margin-top:20px;
   }
   section input[type=submit] {
     width:200px;
     height:34px; 
     margin-top:20px;
     background:gold;
     color:white;
     border:1px solid gold;
   }
   section input[type=button] {
     width:200px;
     height:34px; 
     margin-top:20px;
     background:white;
     color:gold;
     border:1px solid gold;
   }
   section textarea{
   resize:none;}
 </style>
</head>
<body>
  <section>
   <form method="post" action="cwrite_ok">
    <h2 align="center"> 1:1 상담하기 </h2>
    <div> <input type="text" name="title" placeholder="제 목"> </div> 
    <div> <textarea cols="40" rows="6" name="content" placeholder="상담내용"></textarea></div>
    <div>
      <input type="button" value="내 상담" onclick="location='clist'"> 
      <input type="submit" value="저장하기"> 
    </div>
   </form>
  </section>
  
</body>
</html>