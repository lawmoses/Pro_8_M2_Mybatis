<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>샘플</title>
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
		<a href="index.jsp" class="headA">LOGGER</a>

		<button type="button" class="headC">
			<span class="fa fa-bars" title="MENU"></span>
		</button>
	</div>

	<nav class="headB">
		<ul>
			<li><a href="index.jsp">TOP</a></li>
			<li><a href="contents.jsp">콘텐츠</a></li>
			<li><a href="about.jsp">ABOUT</a></li>
			<li><a href="contact.jsp">문의</a></li>
		</ul>
	</nav>
</div>
</header>

<section class="conA compact">
<div class="container">
		<h1>LOGGER</h1>
		<p>맛있고 즐거운 라이프로그</p>
</div>
</section>


<section class="listB">
<h1 class="sr-only">RECENT POSTS</h1>
<div class="container">
	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p01.jpg);"></div>
		<div class="text">
			<h2>노란 꽃으로 꾸며보기</h2>
			<p>노란 꽃으로 방을 꾸미면 좋은 일이 있을지도 몰라요. 이유는...</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p02.jpg);"></div>
		<div class="text">
			<h2>야채 키우기 일기</h2>
			<p>최근 키우고 있는 야채들이 무럭무럭 자라고 있어요. 재미로 야채 키우는 것을 일기로 작성해보겠습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p03.jpg);"></div>
		<div class="text">
			<h2>딸기 맛있게 먹는 방법</h2>
			<p>가끔 딸기를 여러 곳에서 많이 받아 처리가 힘들었는데요, 이제 괜찮아요. 다양한 방법으로 맛있게 요리할 수 있습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p04.jpg);"></div>
		<div class="text">
			<h2>악기 다루기</h2>
			<p>취미로 피아노와 기타 같은 악기를 다뤄보는 것이 어떨까요?</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p05.jpg);"></div>
		<div class="text">
			<h2>귀여운 문양</h2>
			<p>여러 곳에 숨은 귀여운 문양을 찾아보았습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p06.jpg);"></div>
		<div class="text">
			<h2>설탕과 수분의 달콤한 관계</h2>
			<p>생명체에게 수분은 빼놓을 수 없는 요소입니다. 물론 달콤한 음식도...!</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p07.jpg);"></div>
		<div class="text">
			<h2>라이프로그 시작하기</h2>
			<p>일상 생활을 기록해서 데이터로 남기는 것을 "라이프로그"라고 합니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p08.jpg);"></div>
		<div class="text">
			<h2>라이프로그 시작하기</h2>
			<p>귀찮은 설정, 데이터 관리, 애플리케이션과의 연동은 모두 맡겨주세요.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p09.jpg);"></div>
		<div class="text">
			<h2>해외에서 살아보기</h2>
			<p>한국에서의 일상이 지루해졌다면 해외로 나가서 잠시 살아보다 오는 것은 어떨까요?</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p10.jpg);"></div>
		<div class="text">
			<h2>공중에 몸을 맡기기</h2>
			<p>패러글라이딩을 해봤어요. 조금 무서웠지만 즐거웠습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p11.jpg);"></div>
		<div class="text">
			<h2>샐러드 일기</h2>
			<p>세상에는 다양한 종류의 샐러드가 있습니다.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p12.jpg);"></div>
		<div class="text">
			<h2>오래된 친구에게 연락해보기</h2>
			<p>오래된 친구에게 연락해서 간단한 이야기를 나눠봐요.</p>
		</div>
	</a>
	</article>
</div>
</section>


<footer>
<div class="container">

	<div class="footA">
		<h2>LOGGER</h2>
		<p>
		주소: IT 전문서시 위키구 북스동<br>
		<a href="http://logger.nett/">http://logger.nett/</a>
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
		ⓒ LOGGER corp. All rights reserved.
	</div>

</div>
</footer>


</body>
</html>