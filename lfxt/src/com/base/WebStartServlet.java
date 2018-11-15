package com.base;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class WebStartServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public static String dburl = "";//设置数据库引擎配置文件路径
	
	public void init(ServletConfig config) throws ServletException {
		super.init(config);

		InputStream is = getClass().getResourceAsStream("/db.properties");
		Properties dbProps = new Properties();
		try {
			dbProps.load(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		dburl = dbProps.getProperty("dburl");
		
	}
}
