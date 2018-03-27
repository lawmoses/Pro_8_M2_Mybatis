<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

<%@ page import="board.BoardDBBean"%>
<%@ page import="board.BoardDataBean"%>
<%@ page import="java.util.List"%> 
<%@ page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Yoon's</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet">
<link rel="stylesheet" href="/Pro_8/view/style.css">

<!-- ���� -->
<script type="text/javascript" src="script/member.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<!-- ������� -->



<!-- �Խ��� �߰� -->
<%
	request.setCharacterEncoding("euc-kr");
%>

<%
	String boardid = request.getParameter("boardid");
	if (boardid == null) {
			boardid = "1";
		}
%>


<%
	int pageSize = 5;
	//�� �������� ������ �� ����
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum = request.getParameter("pageNum");
	//������ ��ȣ
	if (pageNum == null || pageNum == "") {
		pageNum = "1";
		}
	//ó���� ���ö��� 1���� �� (�Ѿ���� pageNum�� ���� ������)
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1; 
	//db���� ������ �������� ��(currentPage�� ����Ǵ� ���� ����)
	int endRow = currentPage * pageSize;
	//db���� ������ �������� ������ �� (currentPage�� ����Ǵ� ���� �Ʒ� ��)
	int count = 0;
	int number = 0;
	List articleList = null;
	//���� list�� �޾���
	BoardDBBean dbPro = BoardDBBean.getInstance();
	//DBBean�� ������ ��ü instance�� �ּ� ��
	count = dbPro.getArticleCount(boardid);
	//�� �Խñ� ����
	if (count > 0) {
		articleList = dbPro.getArticles(startRow, endRow, boardid);
	}
	number = count - (currentPage - 1) * pageSize;
	//������ �� �� ���� �ֽű��� �� ��ȣ(current)
%>


	



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
		
		<%
		if (session.getAttribute("name")==null) {
		%>
		<a href="list-c.jsp" class="headA">Yoon's
		</a>
       <% } else { %>
       <%=session.getAttribute("name") %> :  <%=session.getAttribute("userid") %>
           
       <% } %> 	   
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
			<li><a href="about.jsp">ABOUT</a></li>
			<li><a href="contact.jsp">����</a></li>

<!-- ���� -->			
<!-- �α��� â -->
	<div id="id01" class="w3-modal">
    <div class="w3-modal-content w3-card-4 w3-animate-zoom" style="max-width:600px">

        <div class="w3-center"><br>
            <span onclick="document.getElementById('id01').style.display='none'" 
            	class="w3-button w3-xlarge w3-hover-red w3-display-topright" title="Close Modal">&times;</span>
            <img src="img_avatar4.png" alt="Avatar" style="width:30%" class="w3-circle w3-margin-top">
        </div>

        <form class="w3-container" action="/Pro_8/member/loginPro.jsp" method="post" name="frm">
            <div class="w3-section">
                <label><b>Username</b></label>
                <input class="w3-input w3-border w3-margin-bottom" type="text" 
                		placeholder="Enter Username" name="userid" value="${userid}" required>
                <label><b>Password</b></label>
                <input class="w3-input w3-border" type="password" placeholder="Enter Password" name="pwd" required>
                <button class="w3-button w3-block w3-green w3-section w3-padding" 
                		type="submit" onclick="return loginCheck()" >Login</button>
<!-- ����-->      <button class="w3-button w3-block w3-green w3-section w3-padding" 
						type="submit" ><a href="/Pro_8/member/join.jsp">ȸ������</a></button>
<!-- ����-->		<button class="w3-button w3-block w3-green w3-section w3-padding" 
						type="submit" ><a href="/Pro_8/member/memberUpdate.jsp">ȸ����������</a></button>
                <input class="w3-check w3-margin-top" type="checkbox" checked="checked"> Remember me
            </div>
        </form>

        <div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
            <button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-button w3-red">Cancel</button>
            <span class="w3-right w3-padding w3-hide-small">Forgot <a href="#">password?</a></span>
        </div>
    </div>
</div>
<!-- �α��� â -->
			
		</ul>
	</nav>
</div>
</header>

<section class="conA compact">
<div class="container">
		<h1>Yoon's</h1>
		<p>���̵��� ������ �ٲٴ�</p>
</div>
</section>

 <!--  -->


<p class="w3-left" style="padding-left: 30px;"></p>
<div class="w3-container">
<span class="w3-center  w3-large">
<h3><%=boardid%>(��ü ��:<%=count%>)</h3>
</span>
<p class="w3-right w3-padding-right-large">
	<a href="/Pro_8/oldview/writeForm.jsp">�۾���</a>
</p>
<%
	if (count == 0) {
%>
<table class="table-bordered" width="700">
	<tr class="w3-grey">
		<td align="center">�Խ��ǿ� ����� ���� �����ϴ�.</td>
</table>
<%
	} else {
%>
<table class="w3-table-all" width="700">
	<tr class="w3-grey">
		<td align="center" width="50">��ȣ</td>
		<td align="center" width="250">�� ��</td>
		<td align="center" width="100">�ۼ���</td>
		<td align="center" width="150">�ۼ���</td>
		<td align="center" width="50">�� ȸ</td>
		<td align="center" width="100">IP</td>
	</tr>
<%
	for (int i = 0; i < articleList.size(); i++) {
		BoardDataBean article = (BoardDataBean) articleList.get(i); 
		//for�� ���鼭 list���� �� �� ������
%>
	<tr height="30">
		<td align="center" width="50"><%=number--%></td>
		<td width="250">
<%
	//��� �κ�	*ref >���� �׷� , re_level >��� �� �Խù��� +1, re_step >����Ʈ ����
	//��> ��۸�� ����
	int wid = 0;
		if (article.getRe_level() > 0) {
			wid = 5 * (article.getRe_level());//re_level 0�̸� 0��
%> 
			<img src="../images/level.gif" width="<%=wid%>" height="16"> 
			<img src="../images/re.gif"> 
<%
		} else {
%> 
			<img src="../images/level.gif" width="<%=wid%>" height="16"> 
<%
		}
%>
	<a href="/Pro_8/oldview/content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
	<%-- �� ���� Ŭ�� �� ���뺸��� �Ѿ --%>
		<%=article.getSubject()%></a> 
<%
		if (article.getReadcount() >= 20) {
		//��ȸ���� 20���� Ŭ �� 
%> 		
			<img src="../images/hot.gif" border="0" height="16">
<%
		}
%>
		</td>
		<td align="center" width="100"><%=article.getWriter()%></td>
		<!-- �۾��� ��� -->
		<td align="center" width="150"><%=sdf.format(article.getReg_date())%></td>
		<!-- �۾� ��¥ ��� -->
		<td align="center" width="50"><%=article.getReadcount()%></td>
		<!-- ��ȸ�� ��� -->
		<td align="center" width="100"><%=article.getIp()%></td>
		<!-- ip ��� -->
	</tr>
<%
	}//for �ݺ��� ����. articleList size��ŭ �� ��µ�
%>
</table>
<%
}
%>

<!-- �Խñ� ��� ������ �ϴ��� ������ �̵� �κ� [1][2][3]  -->
<div class="w3-center">
<%
		int bottomLine = 3;
		//����Ǵ� �ϴ� ������ �� 
		if (count > 0) {
		int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
		//pageSize<�� �������� ������ �� ����
		//pageCount<�� �������� ����
		int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
		//1,4,7.. 
		int endPage = startPage + bottomLine - 1;
		//3,6,9...
		if (endPage > pageCount)
			endPage = pageCount;
		//startPage�� ���� endPage�� ��ü �������� ���� ũ�� endPage=pageCount�� ��������
		if (startPage > bottomLine) {
		//[����] <- ǥ�õǴ� ����
%>
		<a href="/Pro_8/oldview/list.jsp?pageNum=<%=startPage - bottomLine%>">[����]</a>
		<!-- [����] ������ 4,5,6 �̸� > 1,2,3 ���� �̵��� -->
		<!-- ������ ��ȣ�� pageNum(String)���� �Ѱ���>CurrentPage�� ��-->
<%
}
%>
<%
		for (int i = startPage; i <= endPage; i++) {
		// �ϴ� [1][2][3] ����Ʈ
%>
			<a href="/Pro_8/oldview/list.jsp?pageNum=<%=i%>"> 
		<!-- pageNum�ѱ� -->
<% 		//���� �������� ��� ������ ��Ʈ
		if (i != currentPage)
			out.print("[" + i + "]");
		else
			out.print("<font color='red'>[" + i + "]</font>");
%>
</a>
<%
		}
		if (endPage < pageCount) {
%>
		<a href="/Pro_8/oldview/list.jsp?pageNum=<%=startPage + bottomLine%>">[����]</a>
<%
		}
	}
%>
</div>
</div>




<!--  -->



<footer>
<div class="container">

	<div class="footA">
		<h2>YOON'S</h2>
		<p>
		�ּ�: <br>
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
		�� YOON'S corp. All rights reserved.
	</div>

</div>
</footer>

</body>
</html>
