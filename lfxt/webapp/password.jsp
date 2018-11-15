<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script language = "JavaScript">
	function tj(){
		if (document.formList.passwordj.value==''){
      		alert('请准确填写您的原密码');
      		document.formList.passwordj.focus();
      		return false;
    	}
    	var password = document.formList.password.value;
		if (password==''){
      		alert('请准确填写您的新密码');
      		document.formList.password.focus();
      		return false;
    	}else if(password.length < 6){
    		alert('您设的新密码不能少于6位');
      		document.formList.password.focus();
      		return false;
    	}else{
    		if(!password.match(/([a-zA-Z])/)){
    			alert('您设的新密码必须含有字母！');
	      		document.formList.password.focus();
	      		return false;
    		}else if(!password.match(/([0-9])/)){
    			alert('您设的新密码必须含有数字！');
	      		document.formList.password.focus();
	      		return false;
    		}else if(!password.match(/([!,@,#,$,%,^,&,*,?,_,~])/)){
    			alert('您设的新密码必须含有特殊符号（例如：!@#等）！');
	      		document.formList.password.focus();
	      		return false;
    		}
    	}
		if (password!=document.formList.password2.value){
      		alert('您两次输入的密码不一致');
      		document.formList.password.focus();
      		return false;
	  	}
		return true;
	}
</script>
</head>
<%
	
%>
<body>
<div class="mian_right">
<div class="right_dh">
     <div class="right_dh_left"></div>
     <div class="right_dh_right">
	    <ul>
		   <li><a href="#" onclick="location.reload();">刷新</a></li>
		   <li class="dhli01"><a href="calendar.jsp">万年历</a></li>
		  </ul>
	   </div>
  </div>
<div class="right_nav" style="height:100%">   
<div id="tab">
		<ul>
		<li id="li01" class="right_bt"><span onclick="showdiv(1)">修改密码</span></li>
		</ul>
	<div id="all">
<form name="formList" method="post" action="passwordok.jsp" onsubmit="return tj()">
<table width="100%" border="0" class="cx_table01">
  <tr class="cx_table01_tdbg">
    <th align="right">原密码：</th>
    <td align="left"><input type="password" name="passwordj" /></td>
	</tr>
	<tr>
		<th align="right">新密码：</th>
		<td align="left"><input type="password" name="password" /></td>
	</tr>
	<tr class="cx_table01_tdbg">
		<th align="right">确认密码：</th>
		<td align="left"><input type="password" name="password2" /></td>
	</tr>
	<tfoot>
	<tr align="center">
		<td colspan="2"><label>
		<input name="Submit" type="submit" class="button_bc" value="确定" />&nbsp;&nbsp;
		<input name="Submit2" type="reset" class="button_bc" value="取消" />
		</label></td>
	</tr>
	</tfoot>
</table>
</form>
</div>
</div>
</div>
</body>
</html>
