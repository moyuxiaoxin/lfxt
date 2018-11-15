package com.base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Calendar;
import java.util.StringTokenizer;
import com.util.DateUtil;

public class QueryData {

	// 内部使用的成员变量
	private Connection conn = null;

	// 对外传递的参数
	private ResultSet resultSet = null;
	
	private Statement stmt = null;

	private int query_errcode = 0;

	private String query_errstr = "";

	// 分页信息
	protected int iPageSize = 20; // 每页显示记录

	protected int iPageCount = 0; // 总页数

	protected int iRecordCount = 0; // 总记录数

	protected int iCurrentPage = 0; // 当前页
	
	private static int jrbz = 0; //进入标志
	
	int startID = 1; //单机版初始ID
	/**
	 * QueryData构造函数，获得一个连接
	 */
	public QueryData(Connection conn) {
		this.conn = conn;
	}

	/**
	 * 方法setPageSize设置每页要显示的记录数，计算时用；
	 * 
	 * @param pageSize
	 */
	private void setPageSize(int pageSize) {
		iPageSize = pageSize;
	}

	/**
	 * 根据请求的页数设置计算用的页数
	 * 
	 * @param currentPage
	 */
	private void setCurrentPage(int currentPage) {
		iCurrentPage = currentPage;
		if (iCurrentPage <= 0) {
			iCurrentPage = 1;
		}
		if (iCurrentPage > iPageCount) {
			iCurrentPage = iPageCount;
		}
	}

	/**
	 * 方法setPageCount计算总页数
	 * 
	 * @param recordCount
	 * @param pageSize
	 */
	private void setPageCount(int recordCount, int pageSize) {
		if (pageSize >= 0) {
			iPageCount = (recordCount - 1) / pageSize + 1;
		}
	}

	/**
	 * 方法getResultSet获得结果记录集
	 * 
	 * @return
	 */
	public ResultSet getResultSet() {
		return resultSet;
	}

	/**
	 * 通过getErrorMessage()获取数据库错误信息
	 */
	public String getErrorMessage() {
		return query_errstr;
	}

	/**
	 * 通过getErrorCode()获取数据库错误代码
	 */
	public int getErrorCode() {
		return query_errcode;
	}

	/**
	 * @return总记录数
	 */
	public int getRecordCount() {
		return iRecordCount;
	}

	/**
	 * @return当前页
	 */
	public int getCurrentPage() {
		return iCurrentPage;
	}

	/**
	 * @return总页数
	 */
	public int getPageCount() {
		return iPageCount;
	}
	
	public void closeStatement(){
		if(null!=stmt){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	protected void finalize() throws Throwable {
		//System.out.println("系统自动关闭数据库资源");
		if(null!=stmt){
			try {
				stmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(null!=resultSet){
			try {
				resultSet.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(null!=conn){
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * setRecordCount获得表的记录
	 * 
	 * @param tablenamestr
	 * @param fieldCondition
	 * @param valueCondition
	 */
	public void setRecordCount(String tablenamestr) {
		String sqlstr = "";
		int recordCount = 0;

		try {
			sqlstr = " Select count(*) num from " + tablenamestr;

			stmt = conn.createStatement();
			ResultSet rs_count = stmt.executeQuery(sqlstr);
			if (rs_count.next()) {
				recordCount = rs_count.getInt("num");
			}
			stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();
		}
		iRecordCount = recordCount;
	}

	/**
	 * 2006-01-28 add by yef --
	 * 
	 * @param sql
	 */
	public void setRecordSet(String sql) {
		try {
			stmt = conn.createStatement();
			resultSet = stmt.executeQuery(sql);
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();
			System.out.println(query_errstr);
		}
	}
    /**
     * 方法setRecordSet计算条件下的结果记录集；已经定位到当前页的第一条记录，从当前记录
     * 到最后为当前页的所有记录，不需要判断是否超过当前页
     * @param tablenamestr     ：表名
     * @param fieldarraystr    ：显示的字段
     * @param fieldCondition   ：查询条件的字段
     * @param valueCondition   ：查询条件的值
     * @param fieldSort        ：排序的字段
     * @param sort             ：0 asc; 1 desc;
     * @param currentPage      ：要显示的页
     * @param pageSize         ：每页要显示的记录数
     */

	/**
	 * setMultRecordCount根据多表，字段和条件得到记录数
	 * 
	 * @param tablenamestr
	 * @param field
	 * @param condition
	 */
	public void setMultRecordCount(String tablenamestr, String field,
			String condition) {
		String sqlstr = "Select count(*) as num from " + tablenamestr;
		if (condition != null) {
			if (!condition.trim().equals(""))
				sqlstr += " where " + condition;
		}
		int recordCount = 0;
		if(field!=null&&(field.indexOf("distinct")!=-1||condition.indexOf("group by")!=-1)){
			String aa = "";
			if (condition != null) {
				if (!condition.trim().equals(""))
					aa = " where " + condition;
			}
			sqlstr = "Select count(*) as num from (select "+field+" from "+tablenamestr+aa+")";
		}//System.out.println(sqlstr);
		try {
			stmt = conn.createStatement();
			ResultSet rs_count = stmt.executeQuery(sqlstr);
			if (rs_count.next()) {
				recordCount = rs_count.getInt("num");
			}
			stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();
		}
		iRecordCount = recordCount;
	}
    /**
     * 多表关联查询：分页，排序
     * @param tablenamestr
     * @param fieldarraystr
     * @param conditionstr
     * @param fieldSort
     * @param sort          :0 asc, 1 desc;
     * @param currentPage
     * @param pageSize
     */
    public void setMultRecordSet(String tablenamestr,
                                 String fieldarraystr,
                                 String conditionstr,
                                 String fieldSort,
                                 int  sort,
                                 int currentPage,
                                 int pageSize) {
    	 setMultRecordCount(tablenamestr, fieldarraystr, conditionstr);
         setPageSize(pageSize);
         setPageCount(iRecordCount, iPageSize);
         setCurrentPage(currentPage);
         String sqlstr = "";
         
         sqlstr="select top "+pageSize+" " + fieldarraystr + "  from " + tablenamestr;

         if (conditionstr!= null) {
         	if(!conditionstr.trim().equals(""))
             sqlstr += " where " + conditionstr;
         	 sqlstr +=" and CInt(id)<=(select top 1 min(id) from (select top "+((iCurrentPage-1)*iPageSize+1)+" id from " + tablenamestr+" where "+conditionstr;
         	
         }
         if ( sort == 1 ) {
        	 sqlstr += " order by CInt(id) desc))";
        	 sqlstr += " order by " + fieldSort+" desc";
         }
         //System.out.println(sqlstr);
         try {
        	 stmt = conn.createStatement();
             resultSet = stmt.executeQuery(sqlstr);
         }catch(SQLException sqle) {
           System.out.println("从数据库获取数据发生错误："+sqle.getMessage());
             query_errcode = sqle.getErrorCode();
             query_errstr  = sqle.getMessage();

         }
    }

	public boolean isExist(String table, String field, String value) {
		String sql = " select " + field + " from " + table + " where " + field
				+ " = " + value + " ";
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
			rs.close();
			stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();

		}
		return false;
	}

	public boolean isExist(String table, String fieldStandard,
			String valueStandard, String field, String value) {
		String sql = " select " + field + " from " + table;
		sql += " where " + field + " = " + value + "  and " + fieldStandard
				+ " <> " + valueStandard;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
			rs.close();
			stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();

		}
		return false;
	}

	public boolean isExistField(String table, String field, String conditionStr) {
		String sql = " select " + field + " from " + table;
		sql += " where " + conditionStr;
		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				return true;
			}
			rs.close();
			stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();

		}
		return false;

	}

	public int getID(String table) {
		int id = startID;
		String sql = "";
		try {
			sql = "update xtb set bid=bid+1 where bm='" + table + "'";
			stmt = conn.createStatement();
			int ls = stmt.executeUpdate(sql);
			if(ls==0){
				sql = "insert into xtb(bm,bid) values ('" + table + "',"+startID+")";
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
			}
			sql = "select bid from xtb where bm='" + table + "'";
			ResultSet rs = stmt.executeQuery(sql);
			if (rs.next()) {
				id = rs.getInt(1);
			}
			if (rs != null)rs.close();
			if (stmt != null)stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();

		}
		return id;
	}
//	bz为生成号类型标志：其中1为生产任务单号，2为销售单号，3为退货单号，4为收款单号、5为调价单号、6为确认单号、7为发货单号、8为收货单号,9付款单号,10为合同编号
//	cid为各厂的id
//	编号组成：编号简拼+厂id+日期+流水号 共15位
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
		}else if(bz==11){
			xmh = "BX";//报销单号
		}else if(bz==12){
			xmh = "TKD";//退款单号
		}else{
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
			stmt = conn.createStatement();
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
				stmt1.executeUpdate("insert into bhb(id,bhbz,rq,cid,lsh) values("+this.getID("bhb")+","+bz+",'"+day+"',"+cid+",1)");
				if(stmt1!=null)stmt1.close();
				xmh += day+"001";
			}
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();

		}
		return xmh;
	}
	public void setxmh() {
		Calendar rightNow = Calendar.getInstance();
		String day = DateUtil.getYMd(rightNow);
		String sql = "select rq,lsh from hmb";
		try {
			stmt = conn.createStatement();
			Statement stmtu = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			String rq = "";
			if (rs.next()) {
				rq = rs.getString("rq");
				if(day.equals(rq)){
					sql = "update hmb set lsh=lsh+1";
				}else{
					sql = "update hmb set lsh=1,rq='"+day+"'";
				}
				stmtu.executeUpdate(sql);
			}else{
				sql = "insert into hmb(rq,lsh) values ('" + day + "',1)";
				stmtu.executeUpdate(sql);
			}
			if (stmtu != null)
				stmtu.close();
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
		} catch (SQLException sqle) {
			query_errcode = sqle.getErrorCode();
			query_errstr = sqle.getMessage();
		}
	}
}
