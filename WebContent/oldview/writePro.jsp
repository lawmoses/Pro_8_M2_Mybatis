<%@page import="board.BoardDBBean"%> 
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%  request.setCharacterEncoding("euc-kr"); %>

<%
  String boardid = request.getParameter("boarid");
  if (boardid==null) boardid = "1";
%>

<jsp:useBean id="article"  class="board.BoardDataBean">
   <jsp:setProperty name="article" property="*"/>
</jsp:useBean>

<%  System.out.println(article); %>
<!-- 답글해도 article 에 저장이 될거고 인서트 한다. -->

<%  BoardDBBean  dbPro = BoardDBBean.getInstance();//인스턴스 가져옴
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null || pageNum == "") {
	pageNum = "1";	}
    
	article.setIp(request.getRemoteAddr());
	//ip주소 form 에서 안넘어 오기 때문에 request로 받아줌
	
	dbPro.insertArticle(article); 
	//db에 데이터 삽입하는 부분
		/*  ref 계산 후에 이것 수정해야한다 */
	
	/* writepro 한 다음에 바로 오는 것으로 */	
    response.sendRedirect("list.jsp?pageNum="+pageNum+"&boardid="+boardid);
    /* sendRedirect 는 서버단에서 보내주는 것이다. */

%>



</body>
</
html>