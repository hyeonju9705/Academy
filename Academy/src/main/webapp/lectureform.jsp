<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/lectureform.css" />
</head>

<body>
	<div class="back"></div>
	<div class="col-lg-12 ">
		<div class="col-lg-2"></div>

		<div class="col-lg-8">
			<jsp:include page="header.jsp" />

			<!-- 콘텐츠 시작 -->
			<div class="total_content">
				<div class="contentBox col-lg-12">
					<div class="container col-lg-3">
						<h2 id="site_header" class="site-font-color">수강과목</h2>
						<form name="input" action="#" method="get">
							<select name="subject">
								<option value="Java">Java</option>
								<option value="C">C</option>
								<option value="Python">Python</option>
							</select>
							<ul class="select">
								<li id="menu_item">강의계획서</li>
							</ul>
							<ul class="select">
								<li id="menu_notice">공지사항</li>
							</ul>
							<ul class="select">
								<li id="menu_qna">질의응답</li>
							</ul>
							<ul class="select">
								<li id="menu_inforoom">자료실</li>
							</ul>
							<ul class="select">
								<li id="menu_report">과제</li>
							</ul>
						</form>
					</div>


					<div class="size710 col-lg-9">
						<h3 class="title">공지사항</h3>
							<hr class="hrStyle table700">
							<table class="table700">
								<tr>
									<td class="tablebgtable100">제목
									</td>
									<td class="tablebg2">야외 실습용 현지 조사표 양식
									</td>
								</tr>
								<tr>
									<td class="tablebgtable100">작성자</td>
									<td class="tablebg2">정진문</td>
								</tr>
								<tr>
									<td class="tablebgtable100">게시일</td>
									<td class="tablebg2">2021.12.01 오후 12:48</td>
								</tr>
							</table>
							<p class="hrStyle">
								야외 실습용 현지 조사표 양식입니다. <br>
								<br> 필요하면 다운받아 이용하시기 바랍니다. <br>
								<br>
							</p>
							<button class="gray_btn_down">댓글</button>
							<button class="gray_btn_down">목록</button>
							<textarea class="orange_smallarea" placeholder="댓글을 입력하세요"></textarea>
							<button class="gray_btn_big">확인</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<div class="col-lg-2"></div>
	<jsp:include page="footer.jsp" />
	
</body>

</html>