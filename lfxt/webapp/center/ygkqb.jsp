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
<title>美容美发管理系统</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/query_yl.js"></script>
<script type="text/javascript" src="../js/date.js"></script>
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
  			int kqid=0;
  			String xm="";
  			String rq="";
  			int ygid=0;
  			int kqbz=0;
  			int yggid=0;
  			String xmm="";
  			DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
  			Statement stmt=null;
  			String sql="";
  			ResultSet rs=null;
  			ResultSet rs1=null;
  			if(id>0){
  				stmt=conn.createStatement();
  				sql="select * from ygkqb where id="+id;
  				rs=stmt.executeQuery(sql);
  				if(rs.next()){
  					kqid=rs.getInt("id");
  					ygid=rs.getInt("ygid");
  					xm=rs.getString("xm");
  				    rq=rs.getString("rq");
  				  	kqbz=rs.getInt("kqbz");
  				}
  				if(rs!=null)rs.close();
  				if(stmt!=null)stmt.close();
  			}else{
  				id=0;
  			}
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
	<li id="li1" class="right_bt"><span onclick="showdiv(1)">添加员工考勤情况</span></li>
  </ul>
    <div class="mian_right_bgnav">
    <form action="ygkqbok.jsp" method="post" name="cppzform" onsubmit="return checkcppz();">
    <input type="hidden" name="id" value="<%=id %>" />
    	<table width="100%"  class="cx_table01">
    		<tr class="cx_table01_tdbg">
    			<th align="right">员工姓名：</th>
				<td align="left">
					<select name="ygid" id="ygid" onchange="yg(this.options[this.selectedIndex].value);">
						<option value="0">请选择</option>
					<%
						sql="select * from ygb order by id";
						stmt=conn.createStatement();
						rs1=stmt.executeQuery(sql);
						while(rs1.next()){
							yggid=rs1.getInt("id");
							xmm=rs1.getString("xm");
						%>
							<option value="<%=yggid %>" <%if(ygid==yggid)out.print("selected"); %> ><%=xmm %></option>
						 <%
						}
						if(rs1!=null)rs1.close();
						if(stmt!=null)stmt.close();
					%> 
					</select></td>
				<th align="right">日期：</th>
				<td align="left">
           		<input type="text" name="rq" id="rq"  value="<%=rq %>"  onclick="setday(this)" readonly/>
           		</td>
				<th align="right">考勤标志：</th>
				<td align="left"><select name="kqbz" id="kqbz">
					<option value="-1">请选择</option>
					<option value="0" <%if(kqbz==0) out.print("selected"); %>>出勤</option>
					<option value="1" <%if(kqbz==1) out.print("selected"); %>>请假</option>
				</select></td>
    		</tr>
    		<tr align="center">
    			<td colspan="6">
    			<input name="baocun" type="submit" class="button_bc" value="保 存" />&nbsp;&nbsp;
				<input name="chongtian" type="reset" class="button_bc" value="重 填" />&nbsp;&nbsp;
				<input name="fanhui" type="reset" class="button_bc" value="返 回" onClick="window.location.href='ygkqb_list.jsp'" />
				</td>
    		</tr>
    	</table>
    </form>
    </div>
    </div>
    <script type="text/javascript">
		function checkcppz(){
			if(cppzform.ygid.value==""){
				alert("请填写员工姓名！")
				cppzform.ygid.focus();
				return false;
			}
			if(cppzform.rq.value==""){
				alert("请填写日期！");
				cppzform.rq.focus();
				return false;
			}
			if(cppzform.kqbz.value==""){
				alert("请填写考勤标志！");
				cppzform.kqbz.focus();
				return false;
			}
			var yyid=document.getElementById("ygid").value;
			if(yyid==0){
				alert("请重新选择员工姓名");
				cppzform.ygid.focus();
				return false;
			}
			var kqbzz=document.getElementById("kqbz").value;
			if(kqbzz=-1){
				alert("请重新选择考勤标志");
				cppzform.kqbz.focus();
				return false;
			}
			cppzform.baocun.disabled="disabled";
			return true;
		}
	</script>
  </body>
  
  
  <%
  	try{
  		if(conn!=null){
  			conn.close();
  		}
  		fac.closeConn();
  	}catch(Exception e){e.printStackTrace();}
  	}
  }
  else{
  	%>
  		<script type="text/javascript">
  			window.top.document.location.href="../index.jsp";
  		</script>
  	<%
  }
   %>
</html>
