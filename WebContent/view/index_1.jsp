<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Yoon's</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="style.css">

<style>
.sr-only {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}
</style>

<script src="https://use.fontawesome.com/926fe18a63.js"></script>

<script src="https://code.jquery.com/jquery-2.2.3.min.js"></script>
<script>
$(function(){
	$(".headC").click(function(){
		$(".headB").slideToggle();
	});
});
</script>
</head>
<body>

<header>
<div class="container">
	<div class="container-small">
		<a href="list-c.jsp" class="headA">YOON'S</a>

		<button type="button" class="headC">
			<span class="fa fa-bars" title="MENU"></span>
		</button>
	</div>

	<nav class="headB">
		<ul>
			<li><a href="list-c.jsp">TOP</a></li>
			<li><a onclick="document.getElementById('id01').style.display='block'" >로그인</a></li>
			<li><a href="/Pro_8/member/logoutPro.jsp">로그아웃</a></li>
			<li><a href="contents.jsp">콘텐츠</a></li>
			<li><a href="board.jsp">게시판</a></li>
			<li><a href="contact.jsp">문의</a></li>
		</ul>
	</nav>
</div>
</header>

<section class="conA">
<div class="container">
	<img src="img/logo.svg" alt="">
	<h1>Yoon's</h1>
	<p>세상을 바꾸는 아이디어 라이프로그</p>
	<a href="#">Yoon's 시작하기</a>
</div>
</section>


<section class="conB">
<div class="container">
	<div class="text">
		<span class="fa fa-bar-chart icon"></span>
		<h2>Yoon's란?</h2>
		<p>세상을 바꾸기 위해 아이디어를 기록하다 보면 보이지 않던 소중한 것들이 보입니다.</p>
		<a href="#">MORE... 
		<span class="fa fa-chevron-right"></span>
		</a>
	</div>

	<div class="text">
		<span class="fa fa-gears icon"></span>
		<h2>스마트폰이 있다면</h2>
		<p>스마트폰이 있다면 언제라도 Yoon's를 시작할 수 있습니다.</p>
		<a href="#">MORE... 
		<span class="fa fa-chevron-right"></span>
		</a>
	</div>

	<div class="text">
		<span class="fa fa-rocket icon"></span>
		<h2>SNS와의 연동</h2>
		<p>Twitter와 Facebook 등의 SNS와 연동해서 로그를 간단하게 공유할 수 있습니다.</p>
		<a href="#">MORE... 
		<span class="fa fa-chevron-right"></span>
		</a>
	</div>
</div>
</section>



<section class="conC">
<div class="container">
	<div class="photo"></div>
	<div class="text">
		<h2>귀찮은 설정과 데이터 관리를 하지 않아도 됩니다</h2>
		<p>Yoon'S 에서는 귀찮은 설정과 데이터 관리를 따로 하지 않아도 됩니다. 다른 애플리케이션과의 연동도 버튼 하나만 누르면 됩니다.</p>
		<a href="#">자세한 설정 방법 살펴보기
		<span class="fa fa-chevron-right"></span>
		</a>
	</div>
</div>
</section>


<section class="conD">
<div class="container">
	<div class="photo"></div>
	<div class="text">
		<h2>Yoon's와 함께하는 재미있는 일상 생활</h2>
		<p>그때 그때 생각나는 .</p>
		<a href="#">Yoon's 살펴보기
		<span class="fa fa-chevron-right"></span>
		</a>
	</div>
</div>
</section>


<footer>
<div class="container">

	<div class="footA">
		<h2>YOON'S</h2>
		<p>
		주소: 서울시 관악구 신림동<br>
		<a href="http://YOON'S.net/">http://YOON'S.net/</a>
		</p>

		<nav class="footD">
			<ul>
				<li><a href="#">
					<span class="fa fa-twitter"
					 title="Twitter"></span>
				</a></li>

				<li><a href="#">
					<span class="fa fa-facebook"
					 title="Facebook"></span>
				</a></li>

				<li><a href="#">
					<span class="fa fa-google-plus"
					 title="Google Plus"></span>
				</a></li>

				<li><a href="#">
					<span class="fa fa-instagram"
					 title="Instagram"></span>
				</a></li>

				<li><a href="#">
					<span class="fa fa-youtube"
					 title="YouTube"></span>
				</a></li>
			</ul>
		</nav>
	</div>

	<nav class="footB">
		<div>
			<h3>ABOUT</h3>
			<ul>
				<li><a href="#">설립</a></li>
				<li><a href="#">주소</a></li>
				<li><a href="#">지도</a></li>
				<li><a href="#">스태프</a></li>
			</ul>
		</div>

		<div>
			<h3>SUPPORT</h3>
			<ul>
				<li><a href="#">다운로드</a></li>
				<li><a href="#">매뉴얼</a></li>
				<li><a href="#">자주 묻는 질문</a></li>
				<li><a href="#">문의</a></li>
			</ul>
		</div>

		<div>
			<h3>CONTENTS</h3>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">비즈니스</a></li>
				<li><a href="#">프로필</a></li>
				<li><a href="#">개발자</a></li>
				<li><a href="#">블로그</a></li>
			</ul>
		</div>
	</nav>

	<div class="footC">
		ⓒYOON'S corp. All rights reserved.
	</div>

</div>
</footer>


</body>
</html>