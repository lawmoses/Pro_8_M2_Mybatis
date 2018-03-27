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
			<li><a href="contents.jsp">콘텐츠</a></li>
			<li><a href="board.jsp">게시판</a></li>
			<li><a href="contact.jsp">문의</a></li>
		</ul>
	</nav>
</div>
</header>


<article class="post">
<div class="container">

	<h1>YOON'S에 대해서</h1>

	<p>YOON'S는 창조적인 아이디어활동과 관련된 정보 제공, 애플리케이션 개발, 사용자 지원 등을 위해 설립된 기업입니다. YOON'S 서비스는 사용자가 일상 생활을 더 열심히 즐길 수 있게 하는 것을 목표로 하고 있습니다.</p>

	<p>최근에는 국외 데이터 센터를 활용해 국내 뿐만 아니라 해외에도 서비스를 제공하고 있습니다.</p>

</div>
</article>

<aside class="history">
<div class="container">
	<div class="photo"></div>
	<div class="text">
		<h2>History</h2>
		<table>
		<tr>
			<th>2019년 4월</th>
			<td>YOON'S 설립</td>
		</tr>
		<tr>
			<th>2019년 10월</th>
			<td>YOON'S온라인 매거진 창간</td>
		</tr>
		<tr>
			<th>2019년 12월</th>
			<td>해외 기업과의 제휴를 통한 온라인 데이터 공유 서비스 시작</td>
		</tr>
		<tr>
			<th>2020년 1월</th>
			<td>YOON'S 서비스 시작</td>
		</tr>
		</table>
	</div>
</div>
</aside>


<footer>
<div class="container">

	<div class="footA">
		<h2>YOON'S</h2>
		<p>
		주소: 서울시 관악구 신림동<br>
		<a href="http://logger.nett/">http://YOON'S.net/</a>
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
		ⓒ YOON'S corp. All rights reserved.
	</div>

</div>
</footer>


</body>
</html>