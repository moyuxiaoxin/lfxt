package com.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Name RRUtil
 * @Description 定义页面请求处理公用类
 * @Author Daniel Chen
 * @Date 2005-12-25
 */
public class RRUtil {

	/**
	 * 判断当前的参数是否有效[是否在页面中含有]
	 * 
	 * @param request[HttpServletRequest]
	 * @param strParameter
	 * @return boolean
	 */
	public static boolean hasParameter(HttpServletRequest request,
			String strParameter) {
		String tmpString = getParameter(request, strParameter);
		if (tmpString != null) {
			return true;
		}
		return false;
	}

	/**
	 * 判断当前的参数是否有效[是否在页面中含有]
	 * 
	 * @param request[HttpServletRequest]
	 * @param strParameter
	 * @return boolean
	 */
	public static boolean hasParameterValues(HttpServletRequest request,
			String strParameter) {
		String tmpString[] = request.getParameterValues(strParameter);
		if (tmpString != null) {
			return true;
		}
		return false;
	}

	/**
	 * 取得页面的字符串参数，如果为空，返回""，并转换为汉字码
	 * 
	 * @param request
	 * @param paraName
	 * @return String
	 */
	public static String getParameterString(HttpServletRequest request,
			String paraName) {

		String value = null;
		try {
			if (request.getParameter(paraName) != null
					&& !request.getParameter(paraName).equals("&nbsp;"))
				value = new String(request.getParameter(paraName).getBytes(
						"8859_1"), "UTF-8");
			else
				value = "";
		} catch (Exception e) {
			return "";
		}
		return value.trim();
	}

	/**
	 * 取得页面的整形参数，如果为空，返回0，并转换为汉字码
	 * 
	 * @param request
	 * @param paraName
	 * @return int
	 */
	public static int getParameterInt(HttpServletRequest request,
			String paraName) {
		String value = null;
		try {
			value = new String(request.getParameter(paraName)
					.getBytes("8859_1"), "UTF-8");
		} catch (Exception e) {
			return -999999;
		}
		if (value == null || value.equals(""))
			return -999999;
		else
			return Integer.parseInt(value);
	}

	/**
	 * 取得页面的Boolean型参数，如果为空，返回false
	 * 
	 * @param request
	 * @param paraName
	 * @return boolean
	 */
	public static boolean getParameterBoolean(HttpServletRequest request,
			String paraName) {
		String value = null;
		try {
			value = new String(request.getParameter(paraName)
					.getBytes("8859_1"), "UTF-8");

		} catch (Exception e) {
			return false;
		}
		if (value == null || value.equals(""))
			return false;
		else if (value.equals("true"))
			return true;
		else
			return false;
	}

	/**
	 * 返回页面的浮点型参数，并转换为汉字码
	 * 
	 * @param request
	 * @param paraName
	 * @return Double
	 */
	public static Double getParameterDouble(HttpServletRequest request,
			String paraName) {
		String value = "";
		try {
			value = new String(request.getParameter(paraName)
					.getBytes("8859_1"), "UTF-8");
			if (value == null || value.trim().equals("")) {
				value = "-999999";
			}
		} catch (Exception e) {
			value = "-999999";
		}
		return new Double(value);
	}

	/**
	 * 返回页面的长整型参数，并转换为汉字码
	 * 
	 * @param request
	 * @param strParameter
	 * @return long
	 */
	public static long getParameterlong(HttpServletRequest request,
			String strParameter) {
		long tmplong = -999999;
		String strLong = "";
		try {
			strLong = new String(request.getParameter(strParameter).getBytes(
					"8859_1"), "UTF-8");
			if (strLong != null && !strLong.equals("")) {
				tmplong = Long.parseLong(strLong);
			}
		} catch (Exception e) {
			return tmplong;
		}
		return tmplong;
	}

	/**
	 * 获得页面上日期型参数，参数格式为YYYY-MM-DD
	 * 
	 * @param request
	 * @param strParameter
	 * @return tmpCalendar
	 */
	public static Calendar getParameterCalendar(HttpServletRequest request,
			String strParameter) {
		String value = getParameterString(request, strParameter);
		Calendar tmpCalendar = DataUtil.getCalendar(value);
		return tmpCalendar;
	}

	/**
	 * 该方法目前尚未实现
	 * 
	 * @param request
	 * @param strParameter
	 * @return long
	 */
	public static long getParameterTime(HttpServletRequest request,
			String strParameter) {
		return 0;
	}

	/**
	 * 返回页面的参数，并转换为汉字码
	 * 
	 * @param request
	 * @param strParameter
	 * @return String
	 */
	public static String getParameter(HttpServletRequest request,
			String strParameter) {
		String value = null;
		try {
			value = new String(request.getParameter(strParameter).getBytes(
					"8859_1"), "UTF-8");

		} catch (Exception e) {
			return null;
		}
		return value.trim();
	}

	/**
	 * 返回页面的参数，并转换为汉字码
	 * 
	 * @param request
	 * @param strParameter
	 * @return String
	 */
	public static String getParameterGBK(HttpServletRequest request,
			String strParameter) {
		String value = null;
		try {
			value = new String(request.getParameter(strParameter).getBytes(
					"8859_1"), "GBK");

		} catch (Exception e) {
			return null;
		}
		return value.trim();
	}
	/**
	 * 取得页面的字符串参数，如果为空，返回""，并转换为汉字码
	 * 
	 * @param request
	 * @param paraName
	 * @return String
	 */
	public static String getParameterString(HttpServletRequest request,
			String paraName, int i) {

		String[] value = getParameterValues(request, paraName);
		String reValue = "";
		try {
			if (value != null && i < value.length) {
				reValue = value[i];
			}
		} catch (Exception e) {
			return "";
		}
		return reValue.trim();
	}

	/**
	 * 取得页面的整形参数，如果为空，返回0，并转换为汉字码
	 * 
	 * @param request
	 * @param paraName
	 * @return int
	 */
	public static int getParameterInt(HttpServletRequest request,
			String paraName, int i) {
		String[] value = getParameterValues(request, paraName);
		String reValue = "";
		try {
			if (value != null && i < value.length) {
				reValue = value[i];
			}
		} catch (Exception e) {
			return -999999;
		}
		if (reValue == null || reValue.equals(""))
			return -999999;
		else
			return Integer.parseInt(reValue);
	}

	/**
	 * 取得页面的Boolean型参数，如果为空，返回false
	 * 
	 * @param request
	 * @param paraName
	 * @return boolean
	 */
	public static boolean getParameterBoolean(HttpServletRequest request,
			String paraName, int i) {
		String[] value = getParameterValues(request, paraName);
		String reValue = "";
		try {
			if (value != null && i < value.length) {
				reValue = value[i];
			}
		} catch (Exception e) {
			return false;
		}
		if (reValue == null || reValue.equals(""))
			return false;
		else if (reValue.equals("true"))
			return true;
		else
			return false;
	}

	/**
	 * 返回页面的浮点型参数，并转换为汉字码
	 * 
	 * @param request
	 * @param paraName
	 * @return Double
	 */
	public static Double getParameterDouble(HttpServletRequest request,
			String paraName, int i) {
		String[] value = getParameterValues(request, paraName);
		String reValue = "";
		try {
			if (value != null && i < value.length) {
				reValue = value[i];
			}
		} catch (Exception e) {
			return null;
		}
		if (reValue == null || reValue.equals("")) {
			reValue = "-999999";
		}
		return new Double(reValue);
	}

	/**
	 * 返回页面的长整型参数，并转换为汉字码
	 * 
	 * @param request
	 * @param strParameter
	 * @return long
	 */
	public static long getParameterlong(HttpServletRequest request,
			String strParameter, int i) {
		long tmplong = -999999;
		String[] value = getParameterValues(request, strParameter);
		String reValue = "";
		try {
			if (value != null && i < value.length) {
				reValue = value[i];
			}
		} catch (Exception e) {
			return tmplong;
		}
		if (reValue != null && !reValue.equals("")) {
			tmplong = Long.parseLong(reValue);
		}
		return tmplong;
	}

	/**
	 * 获得页面上日期型参数，参数格式为YYYY-MM-DD
	 * 
	 * @param request
	 * @param strParameter
	 * @return Calendar
	 */
	public static Calendar getParameterCalendar(HttpServletRequest request,
			String strParameter, int i) {
		String value = getParameterString(request, strParameter, i);
		Calendar tmpCalendar = DataUtil.getCalendar(value);
		return tmpCalendar;
	}

	/**
	 * 该方法目前尚未实现
	 * 
	 * @param request
	 * @param strParameter
	 * @return long
	 */
	public static long getParameterTime(HttpServletRequest request,
			String strParameter, int i) {
		return 0;
	}

	/**
	 * 返回页面的集合参数，并转换为汉字码
	 * 
	 * @param request
	 * @param paraName
	 * @return String[]
	 */
	public static String[] getParameterValues(HttpServletRequest request,
			String paraName) {
		int i;
		String aa[] = (String[]) request.getParameterValues(paraName);
		if (aa != null)
			for (i = 0; i < aa.length; i++) {
				try {
					aa[i] = new String(aa[i].getBytes("8859_1"), "UTF-8");
					if (aa[i] != null)
						aa[i] = aa[i].trim();
					else
						aa[i] = "";
				} catch (Exception e) {
					e.printStackTrace();
					return null;
				}
			}
		return aa;
	}

	/**
	 * 取得页面的字符串参数，如果为空，返回""
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param paraName
	 * @return String
	 */
	public static String getParameterString(Request request, String strParameter) {
		String value = null;
		try {
			if (request.getParameter(strParameter) != null
					&& !request.getParameter(strParameter).equals("&nbsp;"))
				value = request.getParameter(strParameter);
			else
				value = "";
		} catch (Exception e) {
			return "";
		}
		return value.trim();
	}

	/**
	 * 返回页面的长整型参数
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param strParameter
	 * @return long
	 */
	public static long getParameterlong(Request request, String strParameter) {
		long tmplong = -999999;
		String strLong = "";
		try {
			strLong = request.getParameter(strParameter);
			if (strLong != null && !strLong.equals("")) {
				tmplong = Long.parseLong(strLong);
			}
		} catch (Exception e) {
			return tmplong;
		}
		return tmplong;
	}

	/**
	 * 取得页面的整形参数，如果为空，返回0，并转换为汉字码
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param paraName
	 * @return int
	 */
	public static int getParameterInt(Request request, String paraName) {
		String value = null;
		try {
			value = request.getParameter(paraName);
		} catch (Exception e) {
			return -999999;
		}
		if (value == null || value.equals(""))
			return -999999;
		else
			return Integer.parseInt(value);
	}

	/**
	 * 获得页面上日期型参数，参数格式为YYYY-MM-DD
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param strParameter
	 * @return Calendar
	 */
	public static Calendar getParameterCalendar(Request request,
			String strParameter) {
		String value = getParameterString(request, strParameter);
		Calendar tmpCalendar = DataUtil.getCalendar(value);
		return tmpCalendar;
	}

	/**
	 * 取得页面的Boolean型参数，如果为空，返回false
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param paraName
	 * @return boolean
	 */
	public static boolean getParameterBoolean(Request request, String paraName) {
		String value = null;
		try {
			value = request.getParameter(paraName);

		} catch (Exception e) {
			return false;
		}
		if (value == null || value.equals(""))
			return false;
		else if (value.equals("true"))
			return true;
		else
			return false;
	}

	/**
	 * 返回页面的浮点型参数，并转换为汉字码
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param paraName
	 * @return Double
	 */
	public static Double getParameterDouble(Request request, String paraName) {
		String value = "";
		try {
			value = request.getParameter(paraName);
			if (value == null || value.equals("")) {
				value = "-999999";
			}
		} catch (Exception e) {
			value = "-999999";
		}
		return new Double(value);
	}

	/**
	 * 返回页面的集合参数，并转换为汉字码
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param paraName
	 * @return String[]
	 */
	public static String[] getParameterValues(Request request, String paraName) {
		int i;
		String aa[] = request.getParameterValues(paraName);
		if (aa != null)
			for (i = 0; i < aa.length; i++) {
				try {
					if (aa[i] != null)
						aa[i] = aa[i].trim();
					else
						aa[i] = "";
				} catch (Exception e) {
					e.printStackTrace();
					return null;
				}
			}
		return aa;
	}

	/**
	 * 判断当前的参数是否有效[是否在页面中含有]
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param strParameter
	 * @return boolean
	 */
	public static boolean hasParameter(Request request, String strParameter) {
		String tmpString = request.getParameter(strParameter);
		if (tmpString != null) {
			return true;
		}
		return false;
	}

	/**
	 * 判断当前的参数是否有效[是否在页面中含有]
	 * 
	 * @param request[com.jspsmart.upload.Request]
	 * @param strParameter
	 * @return boolean
	 */
	public static boolean hasParameterValues(Request request,
			String strParameter) {
		String tmpString[] = request.getParameterValues(strParameter);
		if (tmpString != null) {
			return true;
		}
		return false;
	}
/**
 * 输出文件
 * @param response
 * @param tmpIS
 * @param tmpFileName
 * @throws IOException
 */
	public static void outFileStream(HttpServletResponse response,
			InputStream tmpIS, String tmpFileName) throws IOException {
		response.reset();
		response.setContentType("bin;charset=UTF-8");
		response.addHeader("Content-Disposition", "attachment; filename=\""
				+ tmpFileName + "\"");

		byte[] b = new byte[100];
		int len;
		while ((len = tmpIS.read(b)) > 0) {
			ServletOutputStream curServletOutputStream = response
					.getOutputStream();
			curServletOutputStream.write(b, 0, len);
		}
	}

}