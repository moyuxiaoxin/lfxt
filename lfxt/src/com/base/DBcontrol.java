package com.base;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;

import com.util.DateUtil;

public class DBcontrol {

	private Connection conn = null;
	public Connection getConn(){
		String strurl = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+WebStartServlet.dburl;
		try {
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
			conn = DriverManager.getConnection(strurl);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public void closeConn(){
		try {
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public String getHao(int bz,int cid) {
		String xmh = "";
		if(bz==1){
			xmh = "RW";//生产任务单号
		}else if(bz==2){
			xmh = "XS";//销售单号
		}else if(bz==3){
			xmh = "TH";//退货单号
		}else if(bz==4){
			xmh = "SK";//收款单号
		}else if(bz==5){
			xmh = "TJ";//调价单号
		}else if(bz==6){
			xmh = "QR";//确认单号
		}else if(bz==7){
			xmh = "FH";//发货单号
		}else if(bz==8){
			xmh = "SH";//收货单号
		}else if(bz==9){
			xmh = "FK";//付款单号
		}else if(bz==10){
			xmh = "HT";//合同单号
		}
		else{
			return "无效号";
		}
		if(cid<10){
			xmh += "0"+cid;
		}else if(cid<100){
			xmh += cid;
		}else{
			return "无效号";
		}
		Calendar rightNow = Calendar.getInstance();
		String day = DateUtil.getYMd(rightNow);
		Statement stmt1 = null;
		String sql = "select id,rq,lsh from bhb where bhbz="+bz+" and cid="+cid;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String rq = "";
			int lsh = 0;
			if (rs.next()){
				rq = rs.getString("rq");
				lsh = rs.getInt("lsh")+1;
				if(day.equals(rq)){
					stmt1 = conn.createStatement();
					stmt1.executeUpdate("update bhb set lsh=lsh+1 where id="+rs.getInt("id"));
					if(stmt1!=null)stmt1.close();
					if(lsh<10){
						xmh += day+"00"+lsh;
					}else if(lsh<100){
						xmh += day+"0"+lsh;
					}else if(lsh<1000){
						xmh += day+lsh;
					}else{
						return "无效号";
					}
				}else{
					stmt1 = conn.createStatement();
					stmt1.executeUpdate("update bhb set lsh=1,rq='"+day+"' where id="+rs.getInt("id"));
					if(stmt1!=null)stmt1.close();
					xmh += day+"001";
				}
			}else{
				stmt1 = conn.createStatement();
				stmt1.executeUpdate("insert into bhb(bhbz,rq,cid,lsh) values("+bz+",'"+day+"',"+cid+",1)");
				if(stmt1!=null)stmt1.close();
				xmh += day+"001";
			}
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		} catch (SQLException sqle) {

		}
		return xmh;
	}
	public String getHao1(int bz,int cid,String shsj) {
		String xmh = "";
		if(bz==8){
			xmh = "SH";//收货单号
		}
		else{
			return "无效号";
		}
		if(cid<10){
			xmh += "0"+cid;
		}else if(cid<100){
			xmh += cid;
		}else{
			return "无效号";
		}//System.out.println(shsj);
		Calendar sccal = Calendar.getInstance();
		sccal = DateUtil.getCalendar(shsj);
		String day = DateUtil.getYMd(sccal);  //System.out.println(day);
		Statement stmt1 = null;
		String sql = "select id,rq,lsh from bhb where bhbz="+bz+" and cid="+cid;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String rq = "";
			int lsh = 0;
			if (rs.next()){
				rq = rs.getString("rq");
				lsh = rs.getInt("lsh")+1;
				if(day.equals(rq)){
					stmt1 = conn.createStatement();
					stmt1.executeUpdate("update bhb set lsh=lsh+1 where id="+rs.getInt("id"));
					if(stmt1!=null)stmt1.close();
					if(lsh<10){
						xmh += day+"00"+lsh;
					}else if(lsh<100){
						xmh += day+"0"+lsh;
					}else if(lsh<1000){
						xmh += day+lsh;
					}else{
						return "无效号";
					}
				}else{
					stmt1 = conn.createStatement();
					stmt1.executeUpdate("update bhb set lsh=1,rq='"+day+"' where id="+rs.getInt("id"));
					if(stmt1!=null)stmt1.close();
					xmh += day+"001";
				}
			}else{
				stmt1 = conn.createStatement();
				stmt1.executeUpdate("insert into bhb(bhbz,rq,cid,lsh) values("+bz+",'"+day+"',"+cid+",1)");
				if(stmt1!=null)stmt1.close();
				xmh += day+"001";
			}
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		} catch (SQLException sqle) {

		}
		return xmh;
	}
	/**
	 * 主要用于获取某产品的外加剂及其含量的方法
	 * @param gccpid 工程产品id
	 * @return 外加剂及其含量（例：温拌剂 3‰+抗车辙 5‰）
	 */
	public String getWjjhl(int gccpid){
		String mc = "";
		String sql = "SELECT wjj FROM (SELECT gccp id,ltrim(MAX(sys_connect_by_path(trim(wjid), '+')), '+') wjj FROM (SELECT gccp, wjid, row_number() over(PARTITION BY gccp ORDER BY gccp) rn FROM (select b.gccp,c.bm||' '||b.wjbfb||'‰' wjid from cpwjb b,ylggb c where c.id=b.wjid order by c.bm,b.wjbfb)) START WITH rn = 1 CONNECT BY rn - 1 = PRIOR rn AND gccp = PRIOR gccp GROUP BY gccp ORDER BY gccp) where id="+gccpid;
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()){
				mc = rs.getString("wjj");
			}
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mc;
	}
}
