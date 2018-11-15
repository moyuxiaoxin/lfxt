<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="com.base.User"%>
<%@ page import="com.base.DBcontrol"%>
<%@ page import="com.util.RRUtil"%>
<%@page import="com.base.Qx"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>美容美发管理系统</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/num_ylmc.js"></script>
<script type="text/javascript" src="../js/util.js"></script>
<script type="text/javascript" src="../js/float_util.js"></script>
  </head>
 <% 
 	if(session.getAttribute("user")!=null){
 		User user=new User();
 		user=(User)session.getAttribute("user");
 		int id=RRUtil.getParameterInt(request,"id");  	
		if(Qx.getLookQx(user.getCdid(),2)){
	%>
		<script type="text/javascript">
			window.document.location.href="../wfckgqx.html";
		</script>
	<%
 		}
 		else{
 			String kh="";
 			double czje=0.0;
 			double czme=0.0;
 			int czcs=0;
 			String czrq="";
 			int khid=0;	
  			DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
  			Statement stmt=null;
  			String sql="";
  			ResultSet rs=null;
  			ResultSet rs1=null;
			stmt=conn.createStatement();
			sql = "select * from ckbhb where id="+id;
			rs=stmt.executeQuery(sql);
			if(rs.next()){
					czrq=rs.getString("czrq");
					khid=rs.getInt("khid");
					kh=rs.getString("kh");
					czje=rs.getDouble("czje");
					czme=rs.getDouble("czme");
					czcs=rs.getInt("czcs");
			}
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
 		%>
  <body>
 	 <div class="mian_right">
	<div class="right_dh">
     <div class="right_dh_left"></div>
     <div class="right_dh_right">
	    <ul>
		   <li><a href="#" onclick="location.reload();">刷新</a></li>
		   <li class="dhli01"><a href="../calendar.jsp">万年历</a></li>
		  </ul>
	   </div>
  </div>
  <div class="right_nav">
  <ul>
	<li id="li1" class="right_bt"><span onclick="showdiv(1)">查看充卡详细情况</span></li>
  </ul>
    <div class="mian_right_bgnav">
    <form action="#" method="post" name="pbbform" onsubmit="return checkcplb();">
		<table width="100%" class="cx_table01">
			<tr class="cx_table01_tdbg">
				<tr><th align="right" >会员姓名：</th>
				<td align="left"><%
					sql="select * from kb where id="+khid;
					stmt=conn.createStatement();
					rs1=stmt.executeQuery(sql);
					while(rs1.next()){
						out.print(rs1.getString("xm")); 
					}
					if(rs1!=null)rs1.close();
					if(stmt!=null)stmt.close();
				 %></td>
	            <th align="right" >卡号：</th>
				<td align="left"><%=kh %></td></tr>
				<th align="right" >充值日期：</th>
				<td align="left"><%=czrq %></td>
				<th align="right" >充值金额（面额）：</th>
				<td align="left"><%=czme %></td>
				<tr><th align="right" >充值金额（实际）：</th>
				<td align="left"><%=czje %></td>
	            <th align="right">充值次数：</th>
	            <td align="left"><%=czcs %></td></tr>
			</tr>
		</table>
			<table width="100%" class="cx_table01">
			<tfoot>
			<tr align="center">
				<td colspan="4">
				<input name="fanhui" type="reset" class="button_bc" value="返 回" onClick="window.location.href='ckbhb_list.jsp'" />
				</td>
			</tr>
			</tfoot>
		</table>
	</form>
    </div>
    </div>
  </body>
 <%
	try{
		if(conn!=null){
			conn.close();
		}fac.closeConn();
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
</html>