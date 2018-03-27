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
<body class="nohero">

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


<article class="post">
<div class="container">

	<div class="bread">
		<ol>
			<li><a href="index.html">TOP</a></li>
			<li><a href="#">기사 목록</a></li>
		</ol>
	</div>

	<h1>YOON'S 시작하기</h1>

	<img src="img/money01.jpg" alt="">

	<p>세상을 바꾸는 크리에이터 "YOON'S"라고 합니다. 창조적인 생각을 가진 사람들이 함께 모여 세상을 바꿔가는 곳입니다. 무슨 아이디어든 올려주세요. 당신의 꿈을 이루는데 도움을 드립니다.</p>

	<p>아이디어는 있으나, 인프라가 바탕이 되지 않은 분들을 위하여, YOON'S는 인프라를 제공해드립니다. 세상을 바꿀 당신의 아이디어에 아낌없이 도움을 드릴것입니다. 그 아이디어를 세계의 알고 활용할 수 있도록 , 다리가 되어드리겠습니다.</p>

</div>
</article>


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