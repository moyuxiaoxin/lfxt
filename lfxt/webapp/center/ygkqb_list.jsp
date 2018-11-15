<%@ page import="com.util.RRUtil"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="com.base.User"%>
<%@ page import="com.util.DateUtil"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="com.base.DBcontrol"%>
<%@ page import="com.base.Arith"%>
<%@ page import="com.base.QueryData"%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" language="java" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>美容美发管理系统</title>
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/date.js"></script>
<script language = "JavaScript">
	function DelCheck(id)
{
	if (confirm("您确定此操作吗?"))  {
		window.location.href='ygkqb_delete.jsp?id='+id;
	}
}
</script>
</head>
<%

	User user = new User();
	user = (User)session.getAttribute("user");
	//int id = RRUtil.getParameterInt(request,"id");
	//分页
	String zTable = "";
	String zField = "";
	String zCond = "";
	String strPage = request.getParameter("page");	
	int iCurrentPage = 1;
	int iPageSize = 15;
	int iRecordCount = 0;
	int iPageCount = 0;
	String sql = "";
	Statement stmt = null;	
	int id=0;
	String xm="";
	int kqzt=-1;
	int ygid=0;
	String rq="";
	int ygbbid=0;
	DBcontrol fac = new DBcontrol();
	Connection conn = fac.getConn();
	ResultSet rs = null;
	ResultSet rslb=null;
	QueryData queryData = new QueryData(conn);
	String sFieldSort = "id";
	 if(strPage != null&&!"".equals(strPage)){
		      iCurrentPage = Integer.parseInt(strPage);
		    }
	zTable = "ygb a,ygkqb b";
	zField = "b.id,a.xm,b.rq,b.kqbz";
	zCond = "a.id=b.ygid and 1=1";
	String pageHref = "ygkqb_list.jsp?1=1";
	
	if(request.getParameter("kqzt")!=null&&!"".equals(request.getParameter("kqzt").trim())&&!"-1".equals(request.getParameter("kqzt").trim())){
		kqzt=RRUtil.getParameterInt(request,"kqzt");
		zCond+=" and b.kqbz="+kqzt;
		pageHref +="&&kqzt="+kqzt;
	}
	if(request.getParameter("ygid")!=null&&!"".equals(request.getParameter("ygid").trim())&&!"-1".equals(request.getParameter("ygid").trim())){
		ygid=RRUtil.getParameterInt(request,"ygid");
		zCond+=" and b.ygid="+ygid;
		pageHref +="&&ygid="+ygid;
	}
	if(request.getParameter("rq")!=null&&!"".equals(request.getParameter("rq").trim())){
		rq=RRUtil.getParameter(request,"rq");
		zCond+=" and b.rq = '"+rq+"'";
		pageHref+="&&rq="+rq;
	}
	if(request.getParameter("xm")!=null&&!"".equals(request.getParameter("xm").trim()))
	{
		xm = RRUtil.getParameter(request,"xm");
		zCond += " and a.xm like '%"+xm+"%'";
		pageHref += "&&xm="+xm;
	}
	sql="select "+zField+" from "+zTable+" where "+zCond+" order by b.id";
	//System.out.print(sql);
	stmt = conn.createStatement();
	rs= stmt.executeQuery(sql);
	queryData.setMultRecordSet(zTable,zField,zCond,sFieldSort,1,iCurrentPage,iPageSize);
	iRecordCount = queryData.getRecordCount();
	iPageCount = queryData.getPageCount();
	iCurrentPage = queryData.getCurrentPage();
	
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
	<li id="li1" class="right_bt"><span onclick="showdiv(1)">员工考勤管理</span></li>
  </ul>
<div class="list_navpad">
<form name="form1"  action="ygkqb_list.jsp"  method="post">
  <div class="list_cxbut">
  <input type=hidden name="page" onMouseOver="this.focus()" onFocus="this.select()"  value="<%=iCurrentPage %>" maxlength=3/>
  <table width="100%" class="cx_tjtd">
    <tr>
      <td align="left">
	  <table width="100%">
          <td align="left">员工姓名：</td>
              <td align="left">
			  	<select name="ygid" >
					<option value="">请选择</option>
						<%
							sql="select * from ygb order by id";
							stmt=conn.createStatement();
							rslb=stmt.executeQuery(sql);
							while(rslb.next()){
								ygbbid=rslb.getInt("id");
								  %>
								<option value="<%=ygbbid %>" <%if(ygid==ygbbid)out.print("selected"); %> ><%=rslb.getString("xm") %></option>
								  <%
								              	}
								            if(rslb!=null)rslb.close();
								            if(stmt!=null)stmt.close();
										 %>
								</select></td>
          </td>
       	  <td align="left">日期：</td><td><input name="rq" type="text" size="10" class="input_sz" value="<%=rq %>" readonly="readonly" onclick="setday(this)" /></td>
          </td>
          <td align="left">
												考勤标志：
												<select id="kqzt" name="kqzt">
													<option value="">
														请选择
													</option>
													<option value="0" <%if(kqzt==0)out.print("selected"); %>>
														出勤
													</option>
													<option value="1" <%if(kqzt==1)out.print("selected"); %>>
														请假
													</option>
												</select>
											</td>
								</select></td>
       
      </table>
	  </td>
      </tr>
    <tr>
      <td align="right"><label>
        <input name="Submit4" type="submit" class="button_bc" value="查 询" />
        <input type="button" name="Submit2" value="添加新信息" class="button_bc" onclick="window.location.href='ygkqb.jsp'" />
      </label></td>
      </tr>
  </table>
</div>
  <div class="right_cxall">
  <table width="100%" class="cx_table01">
  <thead>
    <tr>
     
      <td width="3%" nowrap="nowrap">序号</td>
      <td width="6%" nowrap="nowrap">员工姓名</td>
      <td width="6%" nowrap="nowrap">日期</td>
      <td width="6%" nowrap="nowrap">考勤标志</td>
      <td width="15%" nowrap="nowrap">操作</td>
    </tr>
  </thead>
<%
	int i = 1;
	String msg = ""; 
	while(rs.next())
	{
		id=rs.getInt("id");
%>
     <tr<%if(i%2==0){ %> class="row_trbg"<%} %>>
			<td><%=i+(iCurrentPage-1)*iPageSize %></td>
        <td class="left_padding" nowrap="nowrap"><a href="ygkqb_look.jsp?id=<%=id %>"><%=rs.getString("xm") %></a></td>
        <td class="left_padding" nowrap="nowrap"><%=rs.getString("rq") %></td>
        <td class="left_padding" nowrap="nowrap"><%
									if (rs.getInt("kqbz") == 1)
													out.print("请假");
												else
													out.print("出勤");
								%></td>
      	<td><img src="../images/jcjt_87.gif" width="16" height="16" onClick="window.location.href='ygkqb.jsp?id=<%=id %>'"  alt="修改信息" style="cursor:hand;"/>
      &nbsp;&nbsp;&nbsp;&nbsp;<img src="../images/jcjt_89.gif" width="16" height="16" onClick="javascript:DelCheck('<%=id %>');"   alt="删除信息" style="cursor:hand;"/>
       </td> 
      
    </tr>
<%
	i++;
	}
	if(rs!=null)rs.close();
	queryData.closeStatement();
%>
  </table>
  </form>
  <div class="list_fyptop">
  <form name="form2" method="post" action="kb_list.jsp">
 <input type="hidden" name="xm" value="<%=xm %>" />
  <input type="hidden" name="rq" value="<%=rq %>" />
  <table width="100%" class="cx_table03">
    <tr>
      <td width="17"><img src="../images/jcjt_106.gif" width="16" height="14" /></td>
      <td align="left">修改信息</td>
      <td width="17"><img src="../images/jcjt_114.gif" width="14" height="14" /></td>
      <td align="left">删除信息</td>
      <td align="right">共<%=iRecordCount %>条记录 | 分<%=iPageCount%>页 | 每页<%=iPageSize %>条记录 | 当前第<%=iCurrentPage%>页
        <label>
          <input name="page" type=text class="input2" id="page" onFocus="this.select()" onMouseOver="this.focus()"  value="<%=iCurrentPage%>" size=3 maxlength=3 />
          <input type="submit" name="Submit3" value="跳转" class="button_bc" />
          <% if (iCurrentPage > 1) {%>
          <input type="button" name="Submit32" value="首页" class="button_bc" onClick="window.location.href='<%=pageHref%>1'" />
          <input type="button" name="Submit33" value="上一页" class="button_bc" onClick="window.location.href='<%=pageHref%><%=iCurrentPage - 1%>'" />
          <% } else { %>
          <input type="button" name="Submit32" value="首页" class="button_bc" />
          <input type="button" name="Submit33" value="上一页" class="button_bc" />
          <% } %>
          <% if (iCurrentPage < iPageCount) {%>
          <input type="button" name="Submit34" value="下一页" class="button_bc" onClick="window.location.href='<%=pageHref%><%=iCurrentPage + 1%>'" />
          <input type="button" name="Submit35" value="尾页" class="button_bc" onClick="window.location.href='<%=pageHref%><%=iPageCount%>'" />
          <% } else { %>
          <input type="button" name="Submit34" value="下一页" class="button_bc" />
          <input type="button" name="Submit35" value="尾页" class="button_bc" />
          <% } %>
        </label></td>
    </tr>
  </table>
  </form>
  </div>
</div>
</div>
</body>
<%
	try {
		if(rs!=null)rs.close();
		
		if (conn != null) {
		    conn.close();
		}
		fac.closeConn();
    }
    catch(Exception e) {e.printStackTrace();}


%>
</html>
