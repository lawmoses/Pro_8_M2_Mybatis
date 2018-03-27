<%@page import="com.saeyan.dto.MemberVO"%>
<%@page import="com.saeyan.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
String userid = request.getParameter("userid");
String pwd = request.getParameter("pwd");
MemberDAO mDao = MemberDAO.getInstance();
int result = mDao.userCheck(userid, pwd);
if (result == 1) {
	MemberVO mVo = mDao.getMember(userid);
	session.setAttribute("name", mVo.getName());
	session.setAttribute("userid", mVo.getUserid());
	response.sendRedirect("/Pro_8/view/list-c.jsp");
	
} else  {
	
	%>
	
	<script>
	alert("nonono");
	history.go(-1);
</script>
	<%} %>
	
	




</body>
</html>