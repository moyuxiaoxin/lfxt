<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>美容美发管理系统</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
</head>
<%
	if(session.getAttribute("user")!=null){
%>
<body>
<div id="mian_right"><div class="right_dh">
     <div class="right_dh_left">美容美发管理系统</div>
     <div class="right_dh_right">
	    <ul>
		   <li><a href="#" onclick="location.reload();">刷新</a></li>
		   <li class="dhli01"><a href="calendar.jsp">万年历</a></li>
		</ul>
	 </div>
  </div>
<div class="right_nav">
  <div class="right_tall"><img src="../images/wel.gif" width="693" height="429" /></div>
</div>

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
