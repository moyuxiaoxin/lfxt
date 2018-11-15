<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>美容美发管理系统</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript"> 
	function tuichu(){
		if (confirm("您真的要退出系统？请您确定！"))  {
   			window.top.document.location.href="qq.jsp";
   		}
	}
	function xg(){
		window.parent.frames.mainFrame.location.href="password.jsp";
	}
</script>

</head>
<%
	if(session.getAttribute("user")!=null){
%>
<body class="top_bg">
<div id="mian_top">
<div class="mian_top_left">
    <div class="mian_top_leftdz"></div>
</div>
  <div class="mian_top_ta">
  <div class="mian_top_ta01">
  <table width="100%">
  <tr>
    <td width="20"><img src="../images/xt_05.gif" width="15" height="14" /></td>
    <td><a href="main_right.jsp" target="mainFrame">返回桌面</a></td>
    <td width="20"><img src="../images/xt_04.gif" width="16" height="16" /></td>
    <td><a href="#">操作帮助</a></td>
  </tr>
  <tr>
    <td width="20"><img src="../images/xt_06.gif" width="16" height="15" /></td>
    <td><a href="#" onclick="javascript:xg();">密码设置</a></td>
    <td width="20"><img src="../images/xt_08.gif" width="16" height="15" /></td>
    <td><a href="#" onclick="javascript:tuichu();">注销关闭</a></td>
  </tr>
</table>
</div>
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
