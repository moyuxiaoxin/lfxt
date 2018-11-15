<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="com.base.User"%>
<%@ page import="com.base.DBcontrol"%>
<%@ page import="com.util.RRUtil"%>
<%
	if(session.getAttribute("user")!=null){
		String passwordj = "";
		String password = "";
		String kpassword = "";
		String url = "index.jsp";
		if (null != request.getParameter("passwordj"))passwordj = RRUtil.getParameterString(request,"passwordj");
		if (null != request.getParameter("password"))password = RRUtil.getParameterString(request,"password");
		User user = new User();
		user = (User)session.getAttribute("user");
		DBcontrol fac = new DBcontrol();
		Connection conn = fac.getConn();
		Statement stmt = conn.createStatement();
		String sql = "select password from userb where id="+user.getId();
		ResultSet rs = stmt.executeQuery(sql);
		if (rs.next()){
			kpassword = rs.getString("password");
		}
		if(rs!=null)rs.close();
		if(stmt!=null)stmt.close();
		if(kpassword.equals(passwordj)){
			int uReturn = 0;
			stmt = conn.createStatement();
			sql = "update userb set password='"+password+"' where id="+user.getId();
			try{
				stmt.executeUpdate(sql);
			}catch(Exception e) {
				e.printStackTrace();
				uReturn++;
			}
			if(uReturn==0){
	%>
		<script language="javascript"> 
		alert("密码修改成功，请重新登录！");
		window.top.document.location.href="<%=url%>";
		</script>
	<%
			}else{
	%>
		<script language="javascript"> 
		alert("密码修改失败，请重试！");
		document.location.href="password.jsp";
		</script>
	<%
			}
		}else{
	%>
		<script language="javascript"> 
		alert("您所输入的原密码不正确！");
		document.location.href="password.jsp";
		</script>
	<%
		}
		try {
			if (conn != null)conn.close();
			fac.closeConn();
	    }catch(Exception e) {
	    	e.printStackTrace();
	    }
	}else{
		%>
		<script>
		window.top.document.location.href="index.jsp";
		</script>
		<%
	}
%>
