<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="css/detailView.css" />
<style>
.gray_btn {
	width: 100px;
	height: 40px;
	border-radius: 10%;
	border: 0px;
	background-color: #ededed;
	color: black;
	font-weight: 700;
	float: right;
	margin: 5px;
}
</style>
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
								<form method="post"
						action="<%=request.getContextPath()%>/updelProc.do">
						<input type="hidden" value="<%=session.getAttribute("userId")%>" name="userId"> 
						<input type="hidden" value="${nvo.boardNo}" name="boardNo">
							<table class="table700">
								<tr>
									<td class="tablebgtable100">제목
									</td>
									<td class="tablebg2">${nvo.title }
									</td>
								</tr>
								<tr>
									<td class="tablebgtable100">작성자</td>
									<td class="tablebg2">${nvo.userId}</td>
								</tr>
								<tr>
									<td class="tablebgtable100">게시일</td>
									<td class="tablebg2">${nvo.regDate}</td>
								</tr>
							</table>
							<p class="hrStyle">
								${nvo.content}<br><br><br><br>
							</p>
							<c:if test="${nvo.userId == userId}" var="idTest">
							<input type="submit" name="threebtn" class="gray_btn"
								value="수정">
							<input type="submit" name="threebtn" class="gray_btn"
								value="삭제">
							</c:if>
							</form>
							<button class="gray_btn_down" onclick="location.href='<%=request.getContextPath()%>/viewProc.do'">목록</button>
							<button class="gray_btn_down" onclick="commentToggle()">댓글</button>
							<div id="commentBtn" style="display:none">
							<textarea class="orange_smallarea" placeholder="댓글을 입력하세요"></textarea>
							<button class="gray_btn_big">확인</button>
							</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<div class="col-lg-2"></div>
	<jsp:include page="footer.jsp" />
	
</body>
<script>
function commentToggle(){
	var element=document.getElementById("commentBtn");
	if(element.style.display==="none"){
		element.style.display="block";
	}else{
		element.style.display="none";
	}
}
</script>
</html>