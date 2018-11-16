<%@ page import="com.base.WriterWJ"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>北京市政路桥建材集团有限公司ERP</title>
</head>

<body>
请稍后，数据上传中。。。。。。。。
<%
	//远程仓库修改+本地更改文件
	WriterWJ r = new WriterWJ();
	r.createFile();
	int gg=0;
	gg = r.fileUp();
	out.println("<Script Language='javaScript'>");
   	if (gg == 0) {
       	out.println("alert('操作成功！');");
   	}else {
       	out.println("alert('操作失败！');");
   	}
   	out.println("document.location.href=\"index.jsp\"");
   	out.println("</Script>");
%>
</body>
</html>
