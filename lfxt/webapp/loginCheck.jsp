<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="com.base.LoginCheck" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>美容美发管理系统</title>
</head>
<%
	LoginCheck loginCheck = new LoginCheck();
	int ret = loginCheck.Check(session,request);
	if(ret==0){
		response.sendRedirect("main.jsp");
	}else{
		response.sendRedirect("index.jsp");
	}
%>
<body>
</body>
</html>
