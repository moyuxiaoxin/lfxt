<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<html>
<head>
<meta http-equiv="Expires" CONTENT="0">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<%
	if(session.getAttribute("user")!=null){
%>
<frameset rows="90,*,31" cols="*" frameborder="NO" border="0" framespacing="0">
  <frame src="main_top.jsp" name="topFrame" scrolling="NO" noresize >
  <frameset cols="210,*" frameborder="NO" border="0" framespacing="0">
    <frame src="main_left.jsp" name="menuFrame" scrolling="AUTO">
    <frame src="main_right.jsp" name="mainFrame" id="mainFrame" scrolling="yes">
  </frameset>
  <frame src="main_bottom.jsp" scrolling="NO" noresize>
</frameset>
<noframes><body>

</body></noframes>
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