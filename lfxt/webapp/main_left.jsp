<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="com.base.User"%>
<%@ page import="com.base.DBcontrol"%>
<%@ page import="com.util.RRUtil"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>美容美发管理系统</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script src="../js/menujs.js" type="text/javascript"></script>
</head>
<%
	if(session.getAttribute("user")!=null){
		User user = new User();
		user = (User)session.getAttribute("user");
		String cdid = user.getCdid();
		String sql = "";
		DBcontrol fac = new DBcontrol();
		Connection conn = fac.getConn();
		Statement stmt = null;
		ResultSet rs = null;
%>
<body>
<div id="mian_left">
 <div class="left_menu01">
   <div class="left_menu01_a">平台管理</div>
 </div>
<%
%>
<%
 	int i = 0;
  	sql = "select ljdz,cdmc,pxh from cdb where id in ("+cdid+") order by pxh";
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while(rs.next()){
%>
	<div class="glx"><div class="glx_bg"><a href="<%=rs.getString("ljdz") %>" target="mainFrame"><%=rs.getString("cdmc") %></a></div></div>
<%
		i++;
	}
	if(rs!=null)rs.close();
	if(stmt!=null)stmt.close();
%>
 <div class="fhsy"> <a href="main_right.jsp" target="mainFrame">返回首页</a></div>	  
</div>
</body>
<%
		if(conn!=null)conn.close();
		fac.closeConn();
	}else{
%>
	<script>
		window.top.document.location.href="index.jsp";
	</script>
<%
	}
%>
</html>
