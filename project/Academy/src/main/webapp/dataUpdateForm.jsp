<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/updateForm.css">
<jsp:include page="header.jsp" />
</head>
<body>
	<div class="col-lg-12 bg-box">
		<div class="col-lg-2"></div>
		<div class="col-lg-8 bg-box3">
			<div class="col-lg-2 leftbarBox">
				<div class="container col-lg-3">
						<h2 id="site_header" class="site-font-color">ACADEMY</h2>
						<form name="input" action="getfeedback.html" method="get">
							<img src="projectImages/vvv.png" alt="Y아카데미" width="100px"
								class="logo">
						</form>
					</div>
			</div>

			<div class="col-lg-7">
				<h3 class="title2">ACADEMY 공지사항</h3>
				<div class="write-box">

					<form method="post"
						action="<%=request.getContextPath()%>/dataUpdateProc.do">
						<input type="hidden" value="<%=session.getAttribute("userId")%>"
							name="userId"> <input type="hidden"
							value="${fvo.boardNo }" name="boardNo"> <input
							type="hidden" value="${user.subjectName}" name="subjectName">
						<input type="text" class="orange_text" placeholder="제목"
							name="title" value="${fvo.title}"> <br>
						<textarea class="orange_area" placeholder="내용" name="content">${fvo.content}</textarea>
						<input type="submit" value="저장" class="orange_btn"> <input
							type="reset" value="취소" class="gray_btn">
					</form>
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>