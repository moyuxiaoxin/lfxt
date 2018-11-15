<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.util.Enumeration"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../css/login_qr.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">
	function keyDown(e){
		var ev =window.event||e;
		if (ev.keyCode==13) {
			formList.submit();
		}
	}
	function CheckUserFormInput(theform){
		if(theform.username.value==''){
			alert("请输入您的用户名！");
			theform.username.focus();
			return false;
		}
		if(theform.password.value==''){
			alert("请输入您的密码！");
			theform.password.focus();
			return false;
		}
		if(theform.checkcode.value==''){
			alert("请输入验证码！");
			theform.checkcode.focus();
			return false;
		}
		theform.Submit.disabled="disabled";
		return true;
	}
</script>
</head>
<%
	String message = "";
	if (null != session.getAttribute("MESSAGE")) {
		message = (String) session.getAttribute("MESSAGE");
	}
	java.util.Vector vect = new java.util.Vector();
	Enumeration sessionItems = session.getAttributeNames();
	String s = null;
	try {
		while(sessionItems.hasMoreElements())
		{
			 s = (String)sessionItems.nextElement();
			 vect.add(s);
		}
	}
	catch(Exception e) {
		System.out.println("e="+e);
	}
	for (int i=0; i< vect.size();i++ ) {
		session.removeAttribute(vect.get(i).toString());
	}
%>
<body>
<div class="login_nav">
   <div class="login_nav_left">
     <form action="loginCheck.jsp" method="post" name="theForm" onsubmit="return CheckUserFormInput(this)">
     <table width="100%" border="0" class="login_tab01">
       <tr>
         <td align="right">用户名：</td>
         <td align="left">
           <input name="name" type="text" class="login_input01" />
         </td>
       </tr>
       <tr>
         <td align="right">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
         <td align="left"><input name="password" type="password" class="login_input02" size="24"/></td>
       </tr>
       <tr>
         <td align="right">验证码：</td>
         <td align="left"><input name="checkcode" type="text" class="login_input03" size="4"/>&nbsp;<img src="image.jsp" /></td>
       </tr>
       <tr>
         <td height="30">&nbsp;</td>
         <td align="left"><input type="submit" name="Submit" value="登录" class="login_but01" /></td>
       </tr>
       <tr>
         <td>&nbsp;</td>
         <td align="left"><%=message %></td>
       </tr>
     </table>
     </form>
   </div>
</div>
</body>
</html>