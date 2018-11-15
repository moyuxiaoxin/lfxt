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
  			String xm="";
  			String xb="";
  			String sj="";
  			String dz="";
  			int klxid=0;
  			int zcs=0;
  			double jq=0.0;
  			double sjjq=0.0;
  			int sycs=0;
  			double syjq=0.0;
  			int kzt=0;
  			String bz="";
  			String mc="";
  			int kid=0;
  			DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
  			Statement stmt=null;
  			String sql="";
  			ResultSet rs=null;
  			ResultSet rs1=null;
			stmt=conn.createStatement();
			sql = "select * from kb where id="+id;
			rs=stmt.executeQuery(sql);
			if(rs.next()){
					kid=rs.getInt("id");
					kh=rs.getString("kh");
					xm=rs.getString("xm");
					xb=rs.getString("xb");
					sj=rs.getString("sj");
					dz=rs.getString("dz");
					klxid=rs.getInt("klxid");
					zcs=rs.getInt("zcs");
					jq=rs.getDouble("jq");
					sjjq=rs.getDouble("sjjq");
					sycs=rs.getInt("sycs");
					syjq=rs.getDouble("syjq");
					kzt=rs.getInt("kzt");
					bz=rs.getString("bz");
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
	<li id="li1" class="right_bt"><span onclick="showdiv(1)">查看卡详细情况</span></li>
  </ul>
    <div class="mian_right_bgnav">
    <form action="#" method="post" name="pbbform" onsubmit="return checkcplb();">
		<table width="100%" class="cx_table01">
			<tr class="cx_table01_tdbg">
				<tr><th align="right" >会员姓名：</th>
				<td align="left"><%=xm %></td>
				<th align="right" >性别：</th>
				<td align="left"><%=xb %></td>
				<th align="right" >联系电话：</th>
				<td align="left"><%=sj %></td>
				<th align="right" >联系地址：</th>
				<td align="left"><%=dz %></td></tr>
				<tr><th align="right" >卡类型名称：</th>
				<td align="left"><%
					sql="select * from klxb where id="+klxid;
					stmt=conn.createStatement();
					rs1=stmt.executeQuery(sql);
					while(rs1.next()){
						out.print(rs1.getString("mc")); 
					}
					if(rs1!=null)rs1.close();
					if(stmt!=null)stmt.close();
				 %></td>
				<th align="right" >总次数：</th>
				<td align="left"><%=zcs %></td>
				<th align="right">价钱（面额）：</th>
	            <td align="left"><%=jq %></td>
	            <th align="right" >价钱（面额）：</th>
				<td align="left"><%=sjjq %></td></tr>
				<th align="right" >剩余次数：</th>
				<td align="left"><%=sycs %></td>
				<th align="right" >剩余价钱：</th>
				<td align="left"><%=syjq %></td>
				<th align="right" >卡状态：</th>
				<td align="left"><% if (kzt == 0)
													out.print("可用");
												else
													out.print("不可用");%></td>
	            <tr><th align="right">备注：</th>
	            <td width="89" align="left"><%=bz %></td></tr>
			</tr>
		</table>
			<table width="100%" class="cx_table01">
			<tfoot>
			<tr align="center">
				<td colspan="4">
				<input name="fanhui" type="reset" class="button_bc" value="返 回" onClick="window.location.href='kb_list.jsp'" />
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