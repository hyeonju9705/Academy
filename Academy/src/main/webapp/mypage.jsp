<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.net.*"%>
<%@page import="com.academy.vo.UserVO"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>Document</title>
<link rel="stylesheet" href="css/mypage.css" />
<style>
</style>
</head>

<body>
	<div class="col-lg-12 ">

		<div class="col-lg-2"></div>
		<div class="col-lg-8">

			<jsp:include page="header.jsp" />
			<!-- 콘텐츠 시작 -->
			<!-- leftBar -->

			<div class="total_content">
				<div class="contentBox col-lg-12">
					<div class="container col-lg-3">
						<h2 class="site-font-color">마이페이지</h2>
						<form name="input" action="#" method="get">
							<ul>
								<li class="menu_item">개인정보</li>
							</ul>
						</form>
					</div>
					<!-- 개인정보 박스 -->
					<div class="containerBox col-lg-9">
						<h3 class="toptitle">개인정보</h3>
						<form action="<c:url value="mypage.do"/>" method="post">
							<div id="content_Text">
								<table class="test">
									<%-- <c:set target="${item}" property="stu"/> --%>
									<tr>
										<td>이름</td>
										<td>${item.userName}</td>
										<td>비밀번호</td>
										<td>${item.userPwd}</td>

									</tr>
									<tr>
										<td>핸드폰</td>
										<td>${item.phoneNo}</td>
										<td>과목</td>
										<td>${item.subjectName}</td>

									</tr>
									<tr>
										<td>이메일</td>
										<td>${item.email}</td>
										<td>학생/강사 구분</td>
										<td>${item.division}</td>
									</tr>
									<tr></tr>
									<tr>
										<td colspan="4"><span><br>"이름, 비밀번호, 핸드폰,
												Email 변경은 시스템 개인정보변경을 이용해서 수정하세요." <br> "학사시스템에서 개인정보
												변경 후 현 시스템에 적용하기 위해서는 수정버튼을 클릭하세요" <br> <br> </span>
											<div class="site_button">
												<a href="mypageUpdate.jsp">수정</a>
											</div>

											<div class="site_button">
												<a
													href='deleteProc.do?userId=<%=session.getAttribute("userId")%>'>탈퇴하기</a>
											</div></td>
									</tr>
									<%-- 	</c:forEach> --%>
								</table>
							</div>
						</form>
					</div>
				</div>

			</div>
			<jsp:include page="footer.jsp" />
		</div>
		<div class="col-lg-2"></div>
	</div>


</body>

</html>