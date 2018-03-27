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
<title>YOON'S</title>
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
			<li><a onclick="document.getElementById('id01').style.display='block'" >�α���</a></li>
			<li><a href="/Pro_8/member/logoutPro.jsp">�α׾ƿ�</a></li>
			<li><a href="contents.jsp">������</a></li>
			<li><a href="board.jsp">�Խ���</a></li>
			<li><a href="contact.jsp">����</a></li>
		</ul>
	</nav>
</div>
</header>


<article class="post">
<div class="container">

	<h1>����</h1>

	<p>YOON'S�� ���ǰ� �ִٸ� ���� ����ó�� �������ּ���.</p>

	<div class="contact-wrap">
		<div class="contact">
			<span class="fa fa-phone"></span>
			<h2>��ȭ</h2>
			<a href="010-9192-8057">010-9192-8057</a>
		</div>

		<div class="contact">
			<span class="fa fa-envelope"></span>
			<h2>�̸���</h2>
			<a href="mailto:lawmoses12@gmail.com">lawmoses12@gmail.com</a>
		</div>
	</div>

</div>
</article>


<aside class="location">
<h2>LOCATION</h2>
<iframe src="https://www.google.co.kr/maps/@37.4811291,126.9530553,17z" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>
</aside>


<footer>
<div class="container">

	<div class="footA">
		<h2>YOON'S</h2>
		<p>
		�ּ�: ����� ���Ǳ� �Ÿ���<br>
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
				<li><a href="#">����</a></li>
				<li><a href="#">�ּ�</a></li>
				<li><a href="#">����</a></li>
				<li><a href="#">������</a></li>
			</ul>
		</div>

		<div>
			<h3>SUPPORT</h3>
			<ul>
				<li><a href="#">�ٿ�ε�</a></li>
				<li><a href="#">�Ŵ���</a></li>
				<li><a href="#">���� ���� ����</a></li>
				<li><a href="#">����</a></li>
			</ul>
		</div>

		<div>
			<h3>CONTENTS</h3>
			<ul>
				<li><a href="#">��������</a></li>
				<li><a href="#">����Ͻ�</a></li>
				<li><a href="#">������</a></li>
				<li><a href="#">������</a></li>
				<li><a href="#">��α�</a></li>
			</ul>
		</div>
	</nav>

	<div class="footC">
		��YOON'S corp. All rights reserved.
	</div>

</div>
</footer>


</body>
</html>
