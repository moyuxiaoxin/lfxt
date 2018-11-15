<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="com.base.User"%>
<%@ page import="com.base.DBcontrol"%>
<%@ page import="com.util.RRUtil"%>
<%@page import="com.base.Qx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>美容美发管理系统</title>
</head>
<%
	if(session.getAttribute("user")!=null){
		User user = new User();
		user = (User)session.getAttribute("user");
		if(Qx.getLookQx(user.getCdid(),2)){
			%>
			<script>
			window.document.location.href="../wfckgqx.html";
			</script>
			<%
		}else{
			int id = RRUtil.getParameterInt(request,"id");
		    int iReturn = 0;
		    DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
			Statement stmt = conn.createStatement();
			String sql = "";
			sql = "update kb set kzt=1 where id="+id;
			try {
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
			}catch(Exception e) {iReturn=1;e.printStackTrace();}
			if(stmt!=null)stmt.close();
			
			String sHref = "kb_list.jsp";
		   	out.println("<Script Language='javaScript'>");
		   	if (iReturn == 0) {
		       	out.println("alert('操作成功！');");
				out.println("document.location.href=\""+sHref+"\"");
		   	}else {
		       	out.println("alert('操作失败！');");
				out.println("document.location.href=\""+sHref+"\"");
		   	}
		   	out.println("</Script>");
			try {
				if (conn != null) {
				    conn.close();
				}
				fac.closeConn();
		    }catch(Exception e) {e.printStackTrace();}
	    }
	}else{
		%>
		<script>
		window.top.document.location.href="../index.jsp";
		</script>
		<%
	}
%>
<body>
</body>
</html>
