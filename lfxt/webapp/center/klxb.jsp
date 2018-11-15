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
  			String mc="";
  			int zcs=0;
  			double jq=0.0;
  			String bz="";
  			DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
  			Statement stmt=null;
  			String sql="";
  			ResultSet rs=null;
  			if(id>0){
  				stmt=conn.createStatement();
  				sql="select * from klxb where id="+id;
  				rs=stmt.executeQuery(sql);
  				if(rs.next()){
  					mc=rs.getString("mc");
  					zcs=rs.getInt("zcs");
  					jq=rs.getDouble("jq");
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
	<li id="li1" class="right_bt"><span onclick="showdiv(1)">添加卡类型记录</span></li>
  </ul>
    <div class="mian_right_bgnav">
    <form action="klxbok.jsp" method="post" name="cppzform" onsubmit="return checkcppz();">
    <input type="hidden" name="id" value="<%=id %>" />
    	<table width="100%"  class="cx_table01">
    		<tr class="cx_table01_tdbg">
    			<th align="right">卡类别名称：</th>
				<td align="left">
					<label><input type="text" name="mc" value="<%=mc %>" /></label></td>
				<th align="right">总次数：</th>
				<td align="left"><label><input type="text" name="zcs" value="<%=zcs %>" onkeyUp = "DigitInput(this,event)"/></label></td>
				<th align="right">价钱（面额）：</th>
				<td align="left"><label><input type="text" name="jq" value="<%=jq %>" onKeyUp="clearNoNum(event,this)" onBlur="checkNum(this)"/></label></td>
    		</tr>
    		<tr>
    			<th align="right">备注</th>
    			<td align="left"><label><input type="text" name="bz" value="<%=bz %>" /></label></td>
    		</tr>
    		<tr align="center">
    			<td colspan="6">
    			<input name="baocun" type="submit" class="button_bc" value="保 存" />&nbsp;&nbsp;
				<input name="chongtian" type="reset" class="button_bc" value="重 填" />&nbsp;&nbsp;
				<input name="fanhui" type="reset" class="button_bc" value="返 回" onClick="window.location.href='klxb_list.jsp'" />
				</td>
    		</tr>
    	</table>
    </form>
    </div>
    </div>
    <script type="text/javascript">
		function checkcppz(){
			if(cppzform.mc.value==""){
				alert("请填写卡类型名称！")
				cppzform.mc.focus();
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
			cppzform.baocun.disabled="disabled";
			return true;
		}
		function DigitInput(obj,event) {
  	 	//响应鼠标事件，允许左右方向键移动 
  	    event = window.event||event; 
        if(event.keyCode == 37 | event.keyCode == 39){ 
            return; 
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
