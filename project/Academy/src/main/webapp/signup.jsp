<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link href="css/signup.css" rel="stylesheet" />
</head>

<body>
   <div class="back"></div>
   <div class="heart"></div>
   <div class="heart1"></div>

   <form action="<%=request.getContextPath()%>/signupProc.do"
      method="post" class="loginForm">
      <h2>
         <img src="projectImages/vvv.png" alt="Y아카데미">
      </h2>
      <div class="switch-field">
         <input type="radio" id="radio-one" name="division" value="1" checked />
         <label for="radio-one">Teacher</label> <input type="radio"
            id="radio-two" name="division" value="0" /> <label for="radio-two">Student</label>
      </div>
      <div class="switch-field" style="margin-left:24%">
         <input type="radio" id="sub1" name="subjectName" value="C" checked />
         <label for="sub1">C언어</label> <input type="radio" id="sub2"
            name="subjectName" value="JAVA" /> <label for="sub2">JAVA</label><input
            type="radio" id="sub3" name="subjectName" value="Python" /> <label
            for="sub3">Python</label>
      </div>
      <div class="join_id">
         <input type="text" name="userId" class="id" placeholder="ID">
      </div>
      <div class="join_pwd">
         <input type="password" name="userPwd" class="pw" placeholder="PW">
      </div>
      <div class="join_name">
         <input type="text" name="userName" class="name" placeholder="NAME">
      </div>
      <div class="join_email">
         <input type="text" name="email" class="email" placeholder="EMAIL">
      </div>
      <div class="join_phoneno">
         <input type="text" name="phoneNo" class="phone" placeholder="PHONENO">
      </div>
      <input type="submit" class="btn" value="SIGNUP">
      <div class="bottomText">
         Do you have ID? <a href="login.jsp">login</a>
      </div>
   </form>
</body>

</html>