package com.base;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import com.util.RRUtil;
import com.base.DBcontrol;

public class LoginCheck {
	public int Check(HttpSession session, HttpServletRequest request) {
			int ret = 9;
			String name = RRUtil.getParameter(request, "name");
			String password = RRUtil.getParameter(request, "password");
			String checkcode = RRUtil.getParameter(request, "checkcode");
			String sessionCheckcode = (String) session.getAttribute("rand");
			// 3.用户验证
			if (sessionCheckcode!=null&&!sessionCheckcode.equals(checkcode)) {
				session.setAttribute("MESSAGE", "  验证码输入错误！");
				return ret;
			}
			DBcontrol fac = new DBcontrol();
			Connection conn = fac.getConn();
			String sql = "select id,username,password,ygid,cdid from userb where username='" + name + "'";
			Statement stmt = null;
			ResultSet rs = null;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					String yhmm = rs.getString("password");
					if(yhmm.equals(password))
					{
						int id = rs.getInt("id");
						String uname = rs.getString("username");
						int ygid = rs.getInt("ygid");
						User user = new User();
						user.setId(id);
						user.setUsername(uname);
						user.setYgid(ygid);
						user.setCdid(rs.getString("cdid"));
						session.setAttribute("user", user);
						ret = 0;
					}else{
						session.setAttribute("MESSAGE", "您的密码输入有误！");
					}
				} else {
					session.setAttribute("MESSAGE", "您的输入有误！");
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally {
				try {
					if (rs != null)rs.close();
					if (stmt != null)stmt.close();
					fac.closeConn();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		/*}else{
			session.setAttribute("MESSAGE", "您的服务器连接正常，请勿使用脱机系统！");
		}*/
		return ret;
	}
}
