<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="css/reset.min.css" />
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/header-8.css" />
<style>
.header-1:hover, .header-1:focus, .brand:hover, .brand:focus { animation-duration: 3s; animation-name: rainbowLink; animation-iteration-count: infinite; } 
@keyframes rainbowLink {     
 0% { color: #ff2a2a; }
 15% { color: #ff7a2a; }
 30% { color: #ffc52a; }
 45% { color: #43ff2a; }
 60% { color: #2a89ff; }
 75% { color: #202082; }
 90% { color: #6b2aff; } 
 100% { color: #e82aff; }
}
.header-1, .brand{
	colot: solid black;
	font-weight:bold;
}
</style>
</head>
<body>
	<header class="site-header">
		<div class="wrapper site-header__wrapper">
			<div class="site-header__start">
				<a href="index.jsp" class="brand">Academy</a>
			</div>
			<div class="site-header__middle">
				<nav class="nav">
					<button class="nav__toggle" aria-expanded="false" type="button">
						menu</button>
					<ul class="nav__wrapper">
						<li class="nav__item"><a href="goHome.do" class="header-1">Home</a></li>
						<li class="nav__item"><a href="mypage.do?userId=${userId}"
							class="header-1">MyPage</a></li>
					</ul>
				</nav>
			</div>
			<div class="site-header__end">
				<a href="Logout.do" class="header-1">Logout</a>
			</div>
		</div>
	</header>
	<script src="../js/header-8.js"></script>
</body>
</html>