<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/write.css" />
<jsp:include page="header.jsp" />
</head>
<%
	if((int)request.getAttribute("ok")==0){
		%> 
	<script type="text/javascript">
        alert('학생은 글 작성 권한이 없습니다.');
        location.href='<%=request.getContextPath()%>/dataViewProc.do?userId=<%=session.getAttribute("userId")%>&subjectName=${user.subjectName}';
    </script>
<%} %>
<body>
	<div class="col-lg-12 bg-box">
		<div class="col-lg-2"></div>
		<div class="col-lg-8 bg-box3">
			<div class="col-lg-2 leftbarBox">
				<div class="container">
					<h2 id="site_header" class="site-font-color">수강과목</h2>
					<form name="input" action="getfeedback.html" method="get">
						<p>${user.subjectName }</p>
						<ul class="select">
                     <li id="menu_item"
                     onclick="location.href='syllabus.do?subjectName=<%=request.getParameter("subjectName")%>'">강의계획서</li>
                  		</ul>
						<ul class="select">
							<li id="menu_notice"
								onclick="location.href='viewProc.do?userId=<%=session.getAttribute("userId")%>&subjectName=${user.subjectName}'">공지사항</li>
						</ul>
						<ul class="select">
							<li id="menu_inforoom" onclick="location.href='dataViewProc.do?userId=<%=session.getAttribute("userId")%>&subjectName=${user.subjectName}'">자료실</li>
						</ul>
					</form>
				</div>
			</div>
			<div class="col-lg-7">
				<h3 class="title2">자료실</h3>
				<div class="write-box">
				
					<form method="post" action="<%=request.getContextPath()%>/dataWriteProc.do" enctype="multipart/form-data">
						<input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId">
						<input type="hidden" value="${user.subjectName }" name="subjectName">
						<input type="text" class="orange_text" placeholder="제목" name="title"> <br>
						<input type="file" name="fileName">
						<textarea class="orange_area" placeholder="내용" name="content"></textarea>
						<input type="submit" value="저장" class="orange_btn"> <input
						type="reset" value="취소" class="gray_btn">
					</form>
				</div>
			</div>
			<div class="col-lg-3"></div>
		</div>
		<div class="col-lg-4"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>