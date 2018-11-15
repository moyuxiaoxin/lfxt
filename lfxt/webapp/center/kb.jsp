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
			int kid=0;
  			String mc="";
  			int klxxid=0;
  			DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
  			Statement stmt=null;
  			String sql="";
  			ResultSet rs=null;
  			ResultSet rs1=null;
  			if(id>0){
  				stmt=conn.createStatement();
  				sql="select * from kb where id="+id;
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
	<li id="li1" class="right_bt"><span onclick="showdiv(1)">添加卡记录</span></li>
  </ul>
    <div class="mian_right_bgnav">
    <form action="kbok.jsp" method="post" name="cppzform" onsubmit="return checkcppz();">
    <input type="hidden" name="id" value="<%=id %>" />
    	<table width="100%"  class="cx_table01">
    		<tr class="cx_table01_tdbg">
    			<th align="right">卡类别名称：</th>
				<td align="left">
					<select name="klxid" id="klxid">
						<option value="0">请选择</option>
					<%
						sql="select * from klxb order by id";
						stmt=conn.createStatement();
						rs1=stmt.executeQuery(sql);
						while(rs1.next()){
							klxxid=rs1.getInt("id");
						%>
							<option value="<%=klxxid %>" <%if(klxid==klxxid)out.print("selected"); %> ><%=rs1.getString("mc") %></option>
						 <%
						}
						if(rs1!=null)rs1.close();
						if(stmt!=null)stmt.close();
					%>
					</select></td>
				<th align="right">卡号：</th>
				<td align="left"><label><input type="text" name="kh" value="<%=kh %>" /></label></td>
				<tr><th align="right">会员姓名：</th>
				<td align="left"><label><input type="text" name="xm" value="<%=xm %>" /></label></td>
				<th align="right">会员性别：</th>
				<td align="left"><label><input type="radio" name="xb" value="男" <%if(xb.equals("男")==true) out.print("checked"); %>/>男</label>
				<label><input type="radio" name="xb" value="女" <%if(xb.equals("女")==true) out.print("checked"); %>/>女</label>
				</tr>
				<tr><th align="right">会员联系电话：</th>
				<td align="left"><label><input type="text" name="sj" value="<%=sj %>" /></label></td>
				<th align="right">会员住址：</th>
				<td align="left"><label><input type="text" name="dz" value="<%=dz %>" /></label></td></tr>
				<th align="right">总次数：</th>
				<td align="left"><label><input type="text" name="zcs" value="<%=zcs %>" onkeyUp = "DigitInput(this,event)"/></label></td>
				<tr>
				<th align="right">价钱（面额）：</th>
				<td align="left"><label><input type="text" name="jq" value="<%=jq %>" onKeyUp="clearNoNum(event,this)" onBlur="checkNum(this)"/></label></td>
				<th align="right">价钱（实际）：</th>
				<td align="left"><label><input type="text" name="sjjq" value="<%=sjjq %>" onKeyUp="clearNoNum(event,this)" onBlur="checkNum(this)"/></label></td></tr>
				<tr>
				<th align="right">剩余次数：</th>
				<td align="left"><label><input type="text" name="sycs" value="<%=sycs %>" onkeyUp = "DigitInput(this,event);"/></label></td>
				<th align="right">剩余价钱：</th>
				<td align="left"><label><input type="text" name="syjq" value="<%=syjq %>" onKeyUp="clearNoNum(event,this)" onBlur="checkNum(this)"/></label></td></tr>
				<th align="right">卡状态：</th>
				<td align="left"><select name="kzt" id="kzt">
					<option value="0" <%if(kzt==0) out.print("selected"); %>>可用</option>
					<option value="1" <%if(kzt==1) out.print("selected"); %>>停用</option>
				</select></td>
    		</tr>
    		<tr>
    			<th align="right">备注</th>
    			<td align="left"><label><input type="text" name="bz" value="<%=bz %>" /></label></td>
    		</tr>
    		<tr align="center">
    			<td colspan="4">
    			<input name="baocun" type="submit" class="button_bc" value="保 存" />&nbsp;&nbsp;
				<input name="chongtian" type="reset" class="button_bc" value="重 填" />&nbsp;&nbsp;
				<input name="fanhui" type="reset" class="button_bc" value="返 回" onClick="window.location.href='kb_list.jsp'" />
				</td>
    		</tr>
    	</table>
    </form>
    </div>
    </div>
    <script type="text/javascript">
		function checkcppz(){
			if(cppzform.klxid.value==""){
				alert("请填写卡类型名称！")
				cppzform.mc.focus();
				return false;
			}
			if(cppzform.kh.value==""){
				alert("请填写卡号！")
				cppzform.kh.focus();
				return false;
			}
			if(cppzform.zcs.value==""){
				alert("请填写总次数！");
				cppzform.zcs.focus();
				return false;
			}
			if(cppzform.jq.value==""){
				alert("请填写面额价钱！");
				cppzform.jq.focus();
				return false;
			}
			if(cppzform.sj.value==""){
				alert("请填写会员联系电话！");
				cppzform.sj.focus();
				return false;
			}
			if(cppzform.sjjq.value==""){
				alert("请填写实际价钱！");
				cppzform.sjjq.focus();
				return false;
			}
			if(cppzform.sjjq.value==""){
				alert("请填写实际价钱！");
				cppzform.sjjq.focus();
				return false;
			}
			if(cppzform.sycs.value==""){
				alert("请填写剩余次数！");
				cppzform.sycs.focus();
				return false;
			}
			if(cppzform.syjq.value==""){
				alert("请填写剩余价钱！");
				cppzform.syjq.focus();
				return false;
			}
			var khhid=document.getElementById("khid").value;
			if(khhid==0){
				alert("请重新输入卡类型");
				cppzform.khid.focus();
				return false;
			}
			cppzform.baocun.disabled="disabled";
			return true;
		}
		function DigitInput(obj,event) {
  	 	//响应鼠标事件，允许左右方向键移动 
  	    event = window.event||event; 
        if(event.keyCode == 37 | event.keyCode == 39){ 
            return; 
        } 
        obj.value = obj.value.replace(/\D/g,"");      
}
		function clearNoNum(event,obj){ 
        //响应鼠标事件，允许左右方向键移动 
        event = window.event||event; 
        if(event.keyCode == 37 | event.keyCode == 39){ 
            return; 
        } 
        //先把非数字的都替换掉，除了数字和. 
        obj.value = obj.value.replace(/[^\d.]/g,""); 
        //必须保证第一个为数字而不是. 
        obj.value = obj.value.replace(/^\./g,""); 
        //保证只有出现一个.而没有多个. 
        obj.value = obj.value.replace(/\.{2,}/g,"."); 
        //保证.只出现一次，而不能出现两次以上 
        obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
    } 
    function checkNum(obj){ 
        //为了去除最后一个. 
        obj.value = obj.value.replace(/\.$/g,""); 
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
