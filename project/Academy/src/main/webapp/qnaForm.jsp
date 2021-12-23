<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="css/qna.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-3.5.1.js"
	integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc="
	crossorigin="anonymous"></script>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script> -->
<style>
a:hover, a:focus{ animation-duration: 3s; animation-name: rainbowLink; animation-iteration-count: infinite; } 
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>


	<div id="container">
		<div id="contents_sub">
			<div id="content_location">
				<h3 class="toptitle">&nbsp;&nbsp;FAQ</h3>
				<div id="title-line"></div>
			</div>
			<div class="left-list" style="width: 562px;">
				<div class="class-form">
					<div class="list-title">
						<span>시작하기</span>
					</div>
					<div class="red-line site-background-color"></div>
					<ul>
						<li><a href="#" class="show" t="1">[공통] 로그인 아이디, 비밀번호는
								어떻게 되나요?</a>
							<p id="text1" hidden>
								&emsp;&emsp;&emsp;▶ 회원가입 시 입력한 내용을 기억하세요&emsp;
								<button class="hide" t="1">답변 감추기</button>
							</p></li>
						<li><a href="#" class="show" t="2">[공통] 회원가입은 어떻게 하나요?</a>
							<p id="text2" hidden>
								&emsp;&emsp;&emsp;▶ 첫 로그인화면에서 회원가입 창을 선택하세요&emsp;
								<button class="hide" t="2">답변 감추기</button>
							</p></li>
						<li><a href="#" class="show" t="3">[공통] 수강할 수 있는 과목은 어떻게
								되나요?</a>
							<p id="text3" hidden>
								&emsp;&emsp;&emsp;▶ C JAVA Python 3가지 과목이 있습니다&emsp;
								<button class="hide" t="3">답변 감추기</button>
							</p></li>
						<li><a href="#" class="show" t="4">[공통] 회원탈퇴는 어떻게 하나요</a>
							<p id="text4" hidden>
								&emsp;&emsp;&emsp;▶ 마이페이지에서 탈퇴하기를 진행하세요&emsp;
								<button class="hide" t="4">답변 감추기</button>
							</p></li>

					</ul>



				</div>
				<div class="class-form">
					<div class="list-title">
						<span>mainform 기능설명</span>
					</div>
					<div class="red-line site-background-color"></div>
					<ul>
						<li><a href="#" class="show" t="5">[공통] ACADEMY 공지사항 </a>
							<p id="text5" hidden>
								&emsp;&emsp;&emsp;▶ ACADEMY 전체 공지사항입니다.<br>&emsp;&emsp;&emsp;(강사님만
								등록 가능)&emsp;
								<button class="hide" t="5">답변 감추기</button>
							</p></li>

						<li><a href="#" class="show" t="6">[공통] 수강과목 </a>
							<p id="text6" hidden>
								&emsp;&emsp;&emsp;▶ 회원가입시 본인이 선택한 과목만 들어가집니다&emsp;
								<button class="hide" t="6">답변 감추기</button>
							</p></li>

						<li><a href="#" class="show" t="7">[공통] 과목 공지사항 ?</a>
							<p id="text7" hidden>
								&emsp;&emsp;&emsp;▶ 회원가입시 본인이 선택한 과목만 들어가집니다<br>&emsp;&emsp;&emsp;&emsp;(강사님만
								등록 가능)&emsp;
								<button class="hide" t="7">답변 감추기</button>
							</p></li>

						<li><a href="#" class="show" t="8">[공통] Quick Menu ?</a>
							<p id="text8" hidden>
								&emsp;&emsp;&emsp;▶ 수강과목, 마이페이지, FQA로 이동 가능합니다&emsp;
								<button class="hide" t="8">답변 감추기</button>
							</p></li>
					</ul>


				</div>
				<div class="class-form">
					<div class="list-title">
						<span>subject_main 기능설명</span>
					</div>
					<div class="red-line site-background-color"></div>
					<ul>
						<li><a href="#" class="show" t="9">[공통] 오른쪽 바</a>
							<p id="text9" hidden>
								&emsp;&emsp;&emsp;▶ 과목별로 선택시 관련링크로 넘어감&emsp;
								<button class="hide" t="9">답변 감추기</button>
							</p></li>

						<li><a href="#" class="show" t="10">[공통] 강의계획서</a>
							<p id="text10" hidden>
								&emsp;&emsp;&emsp;▶ 수정 가능&emsp;
								<button class="hide" t="10">답변 감추기</button>
							</p></li>

						<li><a href="#" class="show" t="11">[공통] 공지사항</a>
							<p id="text11" hidden>
								&emsp;&emsp;&emsp;▶ 글쓰기, 수정, 댓글입력 및 수정 가능&emsp;
								<button class="hide" t="11">답변 감추기</button>
							</p></li>

						<li><a href="#" class="show" t="12">[공통] 자료실</a>
							<p id="text12" hidden>
								&emsp;&emsp;&emsp;▶ 글쓰기(파일 첨부가능), 수정, 삭제 가능 &emsp;
								<button class="hide" t="12">답변 감추기</button>
							</p></li>
					</ul>
				</div>
			</div>
			<div class="right-list">
				<div class="step-box">
					<div class="list-title">
						<span>기능설명</span>
					</div>
					<div class="red-line site-background-color"></div>
					<ul>
						<li><a href="#" class="show" t="13">[공통] 마이페이지?<br></a>
							<p id="text13" hidden>
								<br>&emsp;&emsp;▶ user정보 조회, 수정, 삭제 가능<br>
								<br>&emsp;&emsp;&emsp;
								<button class="hide" t="13">답변 감추기</button>
							</p></li>
						<li><a href="#" class="show" t="14">[공통] FAQ ?</a>
							<p id="text14" hidden>
								<br>&emsp;&emsp;&emsp;▶ 프로젝트에 사용된 기능 설명<br>
								<br>&emsp;&emsp;&emsp;
								<button class="hide" t="14">답변 감추기</button>
							</p></li>
						<li><a href="#" class="show" t="15">[공통] 헤더 ?</a>
							<p id="text15" hidden>
								<br>&emsp;&emsp;&emsp;▶ home, mypage로 이동가능<br>
								<br>&emsp;&emsp;&emsp;
								<button class="hide" t="15">답변 감추기</button>
							</p></li>

					</ul>
				</div>
				<div class="step-box">
					<div class="list-title">
						<span>명언</span>
					</div>
					<div class="red-line site-background-color"></div>
					<ul>
						<li>◈ 코딩을 못짰으면 <br>
						<br> &emsp;잠도 자지마라.
						</li>
						<li>◈ 미래를 신뢰하지 마라,<br>
						<br> &emsp; 죽은 과거는 묻어버려라. <br>
						<br> &emsp;그리고 살아있는 현재에 행동하라
						</li>
						<li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(function() {
			$("button.hide").click(function() {
				$("#text" + $(this).attr('t')).hide();
			});
			$("a.show").click(function() {
				$("#text" + $(this).attr('t')).show();
			});
		});
	</script>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>