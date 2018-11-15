<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="com.base.User"%>
<%@ page import="com.base.DBcontrol"%>
<%@ page import="com.util.RRUtil"%>
<%@ page import="com.base.QueryData"%>
<%@page import="com.base.Qx"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>美容美发系统</title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/query_yl.js"></script>
  </head>
   <%
  	if(session.getAttribute("user")!=null){
  		User user=new User();
  		user=(User)session.getAttribute("user");
  		if(Qx.getLookQx(user.getCdid(),2)){
  			%>
  				<script type="text/javascript">
  					window.document.location.href="../wfckgqx.html";
  				</script>
  			<%
  		}else{
  			int id=RRUtil.getParameterInt(request,"id");
  			String mc=RRUtil.getParameterString(request,"mc");
  			int zcs=RRUtil.getParameterInt(request,"zcs");
  			double jq=RRUtil.getParameterDouble(request,"jq");
  			String bz=RRUtil.getParameterString(request,"bz");
  			int result=0;
  			DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
  		  	Statement stmt=null;
  		  	ResultSet rs=null;
  		  	String sql="";
  		  		if(id>0){
  		  			sql="update klxb set mc='"+mc+"',zcs="+zcs+",jq="+jq+",bz='"+bz+"' where id="+id;
  		  			try{stmt=conn.createStatement();
  		  			stmt.executeUpdate(sql);
  		  			}catch(Exception e){result=1;e.printStackTrace();}
  		  			if(stmt!=null)stmt.close();
  		  		}else{
  		  		QueryData qd=new QueryData(conn);
		  			int zid = qd.getID("klxb");
					sql = "insert into klxb(mc,zcs,jq,bz) values('"+mc+"',"+zcs+","+jq+",'"+bz+"')";
					stmt = conn.createStatement();
		  			id=zid;
		  			try{stmt=conn.createStatement();
		  			stmt.executeUpdate(sql);
		  			}catch(Exception e){result=1;e.printStackTrace();}
		  			if(stmt!=null)stmt.close();
  		  		}
  		  		String shref="";
  		  		out.println("<Script Language='javaScript'>");
  		  		if(result==0){
  		  			out.println("alert('操作成功！');");
  		  			shref="klxb_list.jsp";
  		  			out.println("document.location.href=\""+shref+"\"");
  		  		}else{
  		  			out.println("alert('操作失败！')");
  		  			out.println("history.go(-1);");
  		  		}
  		  		out.println("</Script>");
  		  	
  		  	try{
  		  		if(conn!=null){conn.close();}
  		  		fac.closeConn();
  		  	}catch(Exception e){e.printStackTrace();}
  		}
  	}else{
  			%>
  				<script type="text/javascript">
  					window.top.document.location.href="../index.jsp";
   				</script>	
  			<%
  		}
  %>
  
  <body>
   
  </body>
</html>