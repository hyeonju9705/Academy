<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Y아카데미</title>
<link href="css/login.css" rel="stylesheet" />
</head>

<body width="100%" height="100%">
	<div class="back"></div>
	<div class="heart"></div>
	<div class="heart1"></div>
	<form action="<%=request.getContextPath() %>/loginProc.do" method="post" class="loginForm">
		<h2>
			<img src="projectImages/vvv.png" alt="Y아카데미" class="logo">
		</h2>
		<div class="idForm">
			<input type="text" class="id" placeholder="ID" name="userId">
		</div>
		<div class="passForm">
			<input type="password" class="pw" placeholder="PW" name="userPwd">
		</div>

		<input type="submit" class="btn" value="로그인">
		<div class="bottomText">
			Don't you have ID? <a href="signup.jsp">sign up</a>
		</div>
	</form>
</body>

</html>