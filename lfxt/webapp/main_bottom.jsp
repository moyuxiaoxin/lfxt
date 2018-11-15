<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<%@ page import="com.base.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>美容美发管理系统</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<%
	if(session.getAttribute("user")!=null){
		User user = (User)session.getAttribute("user");
%>
<body>
<div id="mian_bottom">
   <div class="bottom_left">当前登录用户：<%=user.getUsername() %></div>
   <div class="bottom_right">版权所有：美容美发管理系统 &nbsp;&nbsp;&nbsp;&nbsp;网络链接状态：<img src="../images/xt_66.gif" width="14" height="11" /> </div>
</div>
</body>
<%
	}else{
%>
	<script>
		window.top.document.location.href="index.jsp";
	</script>
<%
	}
%>
</html>
