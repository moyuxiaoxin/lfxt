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
  			String mc="";
  			int czcs=0;
  			String czrq="";
  			String kh="";
  			double czje=0.0;
  			double czme=0.0;
  			int khid=0;
  			int kbid=0;
  			int klxid=0;
  			int klxbbid=0;
  			int khhid=0;
  			DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
  			Statement stmt=null;
  			String sql="";
  			ResultSet rs=null;
  			ResultSet rs1=null;
  			if(id>0){
  				stmt=conn.createStatement();
  				sql="select * from ckbhb where id="+id;
  				rs=stmt.executeQuery(sql);
  				if(rs.next()){
  					id=rs.getInt("id");
  					czrq=rs.getString("czrq");
  					khid=rs.getInt("khid");
  					kh=rs.getString("kh");
  					czje=rs.getDouble("czje");
  					czme=rs.getDouble("czme");
  					czcs=rs.getInt("czcs");
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
	<li id="li1" class="right_bt"><span onclick="showdiv(1)">添加充卡记录</span></li>
  </ul>
    <div class="mian_right_bgnav">
    <form action="ckbhbok.jsp" method="post" name="cppzform" onsubmit="return checkcppz();">
    <input type="hidden" name="id" value="<%=id %>" />
    	<table width="100%"  class="cx_table01">
    		<tr class="cx_table01_tdbg">
    			<th align="right">卡号：</th>
				<td align="left">
					<select name="khid" >
					<option value="">请选择</option>
									<%
											sql="select * from kb order by id";
											stmt=conn.createStatement();
											rs1=stmt.executeQuery(sql);
											while(rs1.next()){
												khhid=rs1.getInt("id");
								              %>
								              	<option value="<%=khhid %>" <%if(khid==khhid)out.print("selected"); %> ><%=rs1.getString("kh") %></option>
								              <%
								              	}
								            if(rs1!=null)rs1.close();
								            if(stmt!=null)stmt.close();
										 %>
								</select></td>
				<th align="right">会员姓名：</th>
				<td align="left">
					<select name="khid" id="khid">
						<option value="0">请选择</option>
					<%
						sql="select * from kb order by id";
						stmt=conn.createStatement();
						rs1=stmt.executeQuery(sql);
						while(rs1.next()){
							kbid=rs1.getInt("id");
						%>
							<option value="<%=kbid %>" <%if(khid==kbid)out.print("selected"); %> ><%=rs1.getString("xm") %></option>
						 <%
						}
						if(rs1!=null)rs1.close();
						if(stmt!=null)stmt.close();
					%>
					</select></td>
    		</tr>
    		<tr>
    			<th align="right">充值次数：</th>
    			<td align="left"><input type="text" name="czcs" id="czcs"  value="<%=czcs %>" onkeyUp = "DigitInput(this,event)" /></td>
    		</tr>
    		<tr>
    			<th align="right">充值日期：</th>
    			<td align="left"><input type="text" name="czrq" id="czrq"  value="<%=czrq %>"  onclick="setday(this)" readonly/></td>
    		</tr>
    		<tr>
    			<th align="right">充值金额（实际）：</th>
    			<td align="left"><label><input type="text" id="czje" name="czje" value="<%=czje %>" onKeyUp="clearNoNum(event,this)" onBlur="checkNum(this)"/></label></td>
    		</tr>
    		<tr>
    			<th align="right">充值金额（面额）</th>
    			<td align="left"><label><input type="text" id="czme" name="czme" value="<%=czme %>" onKeyUp="clearNoNum(event,this)" onBlur="checkNum(this)"/></label></td>
    		</tr>
    		<tr align="center">
    			<td colspan="4">
    			<input name="baocun" type="submit" class="button_bc" value="保 存" />&nbsp;&nbsp;
				<input name="chongtian" type="reset" class="button_bc" value="重 填" />&nbsp;&nbsp;
				<input name="fanhui" type="reset" class="button_bc" value="返 回" onClick="window.location.href='ckbhb_list.jsp'" />
				</td>
    		</tr>
    	</table>
    </form>
    </div>
    </div>
    <script type="text/javascript">
		function checkcppz(){
			if(cppzform.kh.value==""){
				alert("请填写卡号！")
				cppzform.kh.focus();
				return false;
			}
			if(cppzform.czje.value==""){
				alert("请填写充值金额！");
				cppzform.czje.focus();
				return false;
			}
			if(cppzform.czme.value==""){
				alert("请填写充值面额！");
				cppzform.czme.focus();
				return false;
			}
			if(cppzform.czcs.value==""){
				alert("请填写充值次数！");
				cppzform.czcs.focus();
				return false;
			}
			if(cppzform.czrq.value==""){
				alert("请填写充值日期！");
				cppzform.czrq.focus();
				return false;
			}
			var khhid=document.getElementById("khid").value;
			if(khhid==0){
				alert("请重新输入会员名");
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
