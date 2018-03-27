<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>����</title>
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
			<li><a href="contents.jsp">������</a></li>
			<li><a href="about.jsp">ABOUT</a></li>
			<li><a href="contact.jsp">����</a></li>
		</ul>
	</nav>
</div>
</header>

<section class="conA compact">
<div class="container">
		<h1>LOGGER</h1>
		<p>���ְ� ��ſ� �������α�</p>
</div>
</section>


<section class="listA">
<h1 class="sr-only">RECENT POSTS</h1>
<div class="container">
	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p01.jpg);"></div>
		<div class="text">
			<h2>��� ������ �ٸ纸��</h2>
			<p>��� ������ ���� �ٹ̸� ���� ���� �������� �����. ������...</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p02.jpg);"></div>
		<div class="text">
			<h2>��ä Ű��� �ϱ�</h2>
			<p>�ֱ� Ű��� �ִ� ��ä���� �������� �ڶ�� �־��. ��̷� ��ä Ű��� ���� �ϱ�� �ۼ��غ��ڽ��ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p03.jpg);"></div>
		<div class="text">
			<h2>���� ���ְ� �Դ� ���</h2>
			<p>���� ���⸦ ���� ������ ���� �޾� ó���� ������µ���, ���� �����ƿ�. �پ��� ������� ���ְ� �丮�� �� �ֽ��ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p04.jpg);"></div>
		<div class="text">
			<h2>�Ǳ� �ٷ��</h2>
			<p>��̷� �ǾƳ�� ��Ÿ ���� �Ǳ⸦ �ٷﺸ�� ���� ����?</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p05.jpg);"></div>
		<div class="text">
			<h2>�Ϳ��� ����</h2>
			<p>���� ���� ���� �Ϳ��� ������ ã�ƺ��ҽ��ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p06.jpg);"></div>
		<div class="text">
			<h2>������ ������ ������ ����</h2>
			<p>����ü���� ������ ������ �� ���� ����Դϴ�. ���� ������ ���ĵ�...!</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p07.jpg);"></div>
		<div class="text">
			<h2>�������α� �����ϱ�</h2>
			<p>�ϻ� ��Ȱ�� ����ؼ� �����ͷ� ����� ���� "�������α�"��� �մϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p08.jpg);"></div>
		<div class="text">
			<h2>�������α� �����ϱ�</h2>
			<p>������ ����, ������ ����, ���ø����̼ǰ��� ������ ��� �ð��ּ���.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p09.jpg);"></div>
		<div class="text">
			<h2>�ؿܿ��� ��ƺ���</h2>
			<p>�ѱ������� �ϻ��� ���������ٸ� �ؿܷ� ������ ��� ��ƺ��� ���� ���� ����?</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p10.jpg);"></div>
		<div class="text">
			<h2>���߿� ���� �ñ��</h2>
			<p>�з��۶��̵��� �غþ��. ���� ���������� ��ſ����ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p11.jpg);"></div>
		<div class="text">
			<h2>������ �ϱ�</h2>
			<p>���󿡴� �پ��� ������ �����尡 �ֽ��ϴ�.</p>
		</div>
	</a>
	</article>

	<article>
	<a href="#">
		<div class="photo" style="background-image: url(img/p12.jpg);"></div>
		<div class="text">
			<h2>������ ģ������ �����غ���</h2>
			<p>������ ģ������ �����ؼ� ������ �̾߱⸦ ��������.</p>
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
		�ּ�: IT �������� ��Ű�� �Ͻ���<br>
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
		�� LOGGER corp. All rights reserved.
	</div>

</div>
</footer>


</body>
</html>