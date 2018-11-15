package com.util;

import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Random;

/**
 * @Name DataUtil
 * @Description 定义时间类型数据处理类
 * @Author Daniel Chen
 * @Date 2005-12-25
 */
public class DateUtil {

	public static int day = 25;
	
	/**
	 * 把字符型变量[YYYY-MM-DD]转化为日历型
	 * 
	 * @param tmpDate
	 * @return Calendar
	 */
	public static Calendar getCalendar(String tmpDate) {
		Calendar result = null;
		String tmpYear = "";
		String tmpMonth = "";
		String tmpDay = "";
		try {
			if (tmpDate != null) {
				if (!tmpDate.equals("")) {
					tmpYear = tmpDate.substring(0, 4);
					tmpDate = tmpDate.substring(5);
					tmpMonth = tmpDate.substring(0, tmpDate.indexOf("-"));
					tmpDay = tmpDate.substring(tmpDate.indexOf("-") + 1);
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		result = getCalendar(tmpYear, tmpMonth, tmpDay);
		return result;
	}

	/**
	 * 把字符型变量[YYYY-MM-DD hh:ff:ss]转化为日历型
	 * 
	 * @param tmpDate
	 * @return Calendar
	 */
	public static Calendar getLongCalendar(String tmpDate) {
		Calendar result = null;
		String tmpYear = "";
		String tmpMonth = "";
		String tmpDay = "";
		String tmpHour = "";
		String tmpMinute = "";
		String second = "";
		try {
			if (tmpDate != null) {
				if (!tmpDate.equals("")) {
					tmpYear = tmpDate.substring(0, 4);
					tmpMonth = tmpDate.substring(5, 7);
					tmpDay = tmpDate.substring(8, 10);
					tmpHour = tmpDate.substring(11, 13);
					tmpMinute = tmpDate.substring(14, 16);
					second = tmpDate.substring(17, 19);
				} else {
					return null;
				}
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		result = getCalendar(tmpYear, tmpMonth, tmpDay, tmpHour, tmpMinute,
				second);
		return result;
	}

	/**
	 * 根据指定的分隔符把字符型变量[YYYY(strSplit)MM(strSplit)DD]转化为日历型
	 * 
	 * @param tmpDate
	 * @param strSplit
	 * @return Calendar
	 */
	public static Calendar getCalendar(String tmpDate, String strSplit) {

		Calendar result = null;
		String tmpYear = "";
		String tmpMonth = "";
		String tmpDay = "";
		String[] tmpResult = tmpDate.split(strSplit);
		switch (tmpResult.length) {
		case 3:
			tmpDay = tmpResult[2];
		case 2:
			tmpMonth = tmpResult[1];
		case 1:
			tmpYear = tmpResult[0];
			break;
		}
		result = getCalendar(tmpYear, tmpMonth, tmpDay);
		return result;
	}

	/**
	 * 将年、月、日生成Calendar对象
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @return Calendar
	 */
	public static Calendar getCalendar(String year, String month, String day) {
		try {
			if (!year.equals("") && !month.equals("") && !day.equals("")) {
				Calendar tmpData = Calendar.getInstance();
				tmpData.set(Integer.valueOf(year).intValue(), Integer.valueOf(
						month).intValue() - 1, Integer.valueOf(day).intValue());
				return tmpData;
			} else if (!year.equals("") && !month.equals("") && day.equals("")) {
				Calendar tmpData1 = Calendar.getInstance();
				tmpData1.set(Integer.valueOf(year).intValue(), Integer.valueOf(
						month).intValue() - 1, 1);
				return tmpData1;
			} else if (!year.equals("") && month.equals("") && day.equals("")) {
				Calendar tmpData2 = Calendar.getInstance();
				tmpData2.set(Integer.valueOf(year).intValue(), 0, 1);
				return tmpData2;
			} else
				return null;
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 将年、月、日、分、秒生成Calendar对象
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @return Calendar
	 */
	public static Calendar getCalendar(String year, String month, String day,
			String hour, String minute, String second) {
		try {
			if (!year.equals("") && !month.equals("") && !day.equals("")
					&& !minute.equals("") && !second.equals("")) {
				Calendar tmpData = Calendar.getInstance();
				tmpData.set(Integer.valueOf(year).intValue(), Integer.valueOf(
						month).intValue() - 1, Integer.valueOf(day).intValue(),
						Integer.valueOf(hour).intValue(), Integer.valueOf(
								minute).intValue(), Integer.valueOf(second)
								.intValue());
				return tmpData;
			}
			// TODO
			// else if (!year.equals("") && !month.equals("") && day.equals(""))
			// {
			// Calendar tmpData1 = Calendar.getInstance();
			// tmpData1.set(Integer.valueOf(year).intValue(), Integer.valueOf(
			// month).intValue() - 1, 1);
			// return tmpData1;
			// } else if (!year.equals("") && month.equals("") &&
			// day.equals("")) {
			// Calendar tmpData2 = Calendar.getInstance();
			// tmpData2.set(Integer.valueOf(year).intValue(), 0, 1);
			// return tmpData2;
			// }
			else
				return null;
		} catch (Exception e) {
			return null;
		}
	}

	/**
	 * 把[yyyy年mm月dd日]字符型变量转化为Calendar型
	 * 
	 * @param tmpDate
	 * @return Calendar
	 */
	public static Calendar getCalendarFromCN(String tmpDate) {
		if (tmpDate != null) {
			if (!tmpDate.equals("")) {
				String tmpYear = tmpDate.substring(0, 4);
				int tmpLength = tmpDate.length();
				tmpLength = tmpLength - 1;
				tmpDate = tmpDate.substring(5, tmpLength);
				tmpLength = tmpDate.length();
				// tmpDate=tmpDate.substring()
				String tmpDay = tmpDate.substring(tmpDate.indexOf("月") + 1);
				String tmpMonth = tmpDate.substring(0, tmpDate.indexOf("月"));
				Calendar tmpDayA = getCalendar(tmpYear, tmpMonth, tmpDay);
				// String tempDate = GenericUtilities.getDateString(tmpDayA);
				return tmpDayA;
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	/**
	 * 将Timestamp转化为Calendar对象
	 * 
	 * @param pTimestamp
	 * @return Calendar
	 */
	public static Calendar getCalendar(java.sql.Timestamp pTimestamp) {
		Calendar pCalendarDate = null;
		if (pTimestamp != null) {
			pCalendarDate = java.util.Calendar.getInstance();
			pCalendarDate.setTime(pTimestamp);
		}
		return pCalendarDate;
	}

	/**
	 * 将Calendar对象转化成大写中文数字的字符串[例：二零零四年二月二十八日]
	 * 
	 * @param date
	 * @return String
	 */
	public static String getChineseDate(Calendar date) {
		String[] chNumber = { "零", "一", "二", "三", "四", "五", "六", "七", "八", "九",
				"十" };

		String year = getYear(date);
		String month = getMonth(date);
		String day = getDay(date);
		String retStr = "";
		for (int i = 0; i < year.length(); i++) {
			retStr += chNumber[Character.getNumericValue(year.charAt(i))];
		}
		retStr += "年";
		if (Integer.parseInt(month) <= 10) {
			retStr += chNumber[Integer.parseInt(month)];
		} else {
			if (Integer.parseInt(month) < 20) {
				retStr += "十" + chNumber[Integer.parseInt(month) - 10];
			} else {
				retStr += chNumber[Character.getNumericValue(month.charAt(0))]
						+ "十";
				if (Character.getNumericValue(month.charAt(1)) != 0)
					retStr += chNumber[Character.getNumericValue(month
							.charAt(1))];
			}
		}
		retStr += "月";
		if (Integer.parseInt(day) <= 10) {
			retStr += chNumber[Integer.parseInt(day)];
		} else {
			if (Integer.parseInt(day) < 20) {
				retStr += "十" + chNumber[Integer.parseInt(day) - 10];
			} else {
				if (Character.getNumericValue(day.charAt(0)) == 2)
					retStr += "二十";
				if (Character.getNumericValue(day.charAt(0)) == 3)
					retStr += "三十";
				if (Character.getNumericValue(day.charAt(1)) != 0)
					retStr += chNumber[Character.getNumericValue(day.charAt(1))];
			}
		}
		retStr += "日";
		try {
			retStr = new String(retStr.getBytes("gb2312"), "GBk");
		} catch (Exception e) {
			return "";
		}

		return retStr;

	}

	/**
	 * getDate - 输入日历型数据，得到"YYYY-MM-DD"型的字符串。
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getDateString(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getDate - 输入日历型数据，得到"YYYY-MM-DD"型的字符串。
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getYearMonth(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getYMd - 输入日历型数据，得到"YYYYMM"型的字符串。
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getYMd(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyyMMdd");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}
	
	/**
	 * getYM - 输入日历型数据，得到"YYYY-MM"型的字符串。
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getYM(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getMonthDay - 输入日历型数据，得到"MM-dd"型的字符串。
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getMonthDay(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("MM-dd");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getDateTime - 得到日历型的 "yyyy-MM-dd HH:mm:ss" 形式的字符串
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getDateTime(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat(
					"yyyy-MM-dd HH:mm:ss");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getDateTime - 得到日历型的 "MM-DD-YYYY , HH:MM:SS" 形式的字符串
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getDateTime(long longTime) {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date(longTime));
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat(
					"MM-dd-yyyy HH:mm:ss");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getDateTime - 得到日历型的 "yyyyMMdd_HHmmss" 形式的字符串
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getNumberDateTime(java.util.Calendar cal) {
		return getDateString(cal, "yyyyMMdd_HHmmss");
	}

	/**
	 * getDateString - 根据给定的格式对Calendar进行字符串格式化
	 * 
	 * @param cal
	 * @param strFormat
	 * @return String
	 */
	public static String getDateString(java.util.Calendar cal, String strFormat) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat(strFormat);
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getDate - 输入日历型数据，得到"MM-DD-YYYY"形式的字符串
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getDateWestFormat(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("MM-dd-yyyy");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getDay - 由calendar 得到日
	 * 
	 * @param pCal
	 * @return String
	 */
	public static String getDay(java.util.Calendar pCal) {
		Timestamp timestamp = getTimestamp(pCal);
		if (timestamp != null) {
			String dateString = timestamp.toString();
			String strDay = dateString.substring(8, 10);
			if (strDay.substring(0, 1).equals("0")) {
				strDay = strDay.substring(1);
			}
			return strDay;
		} else {
			return "";
		}
	}

	/**
	 * 将Calendar对象格式化成[YYYY年MM月DD日]
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getFormatedDate(java.util.Calendar cal) {

		String dateString = "";

		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date theDate = cal.getTime();
			dateString = dateFormatter.format(theDate);
		}

		String year = "";
		String month = "";
		String day = "";

		int pos = -1;
		int startPos;
		pos = dateString.indexOf("-");
		if (pos >= 0) {
			year = dateString.substring(0, pos);
			startPos = pos;
			pos = dateString.indexOf("-", pos + 1);
			if (pos >= 0) {
				month = dateString.substring(startPos + 1, pos);
				startPos = pos;
				day = dateString.substring(pos + 1);
			} else {
				month = dateString.substring(startPos + 1);
			}
		} else {
			year = dateString;
			return dateString;
		}

		String strDate = year + "年" + Integer.toString(Integer.parseInt(month))
				+ "月" + Integer.toString(Integer.parseInt(day)) + "日";
		try {
			strDate = new String(strDate.getBytes("gb2312"), "GBk");
		} catch (Exception e) {
			return "0";
		}
		return strDate;

	}

	/**
	 * 把yyyy年mm月dd日字符型变量转化为yyyy-mm-dd型
	 * 
	 * @param tmpDate
	 * @return String
	 */
	public static String getFormatedDateFromCN(String tmpDate) {
		if (tmpDate != null) {
			if (!tmpDate.equals("")) {
				String tmpYear = tmpDate.substring(0, 4);
				int tmpLength = tmpDate.length();
				tmpLength = tmpLength - 1;
				tmpDate = tmpDate.substring(5, tmpLength);
				tmpLength = tmpDate.length();
				// tmpDate=tmpDate.substring()
				String tmpDay = tmpDate.substring(tmpDate.indexOf("月") + 1);
				String tmpMonth = tmpDate.substring(0, tmpDate.indexOf("月"));
				Calendar tmpDayA = getCalendar(tmpYear, tmpMonth, tmpDay);
				String tempDate = getDateString(tmpDayA);
				return tempDate;
			} else {
				return null;
			}
		} else {
			return null;
		}
	}

	/**
	 * function - 由calendar 得到月
	 * 
	 * @param pCal
	 * @return String
	 */
	public static String getMonth(java.util.Calendar pCal) {
		Timestamp timestamp = getTimestamp(pCal);
		if (timestamp != null) {
			String dateString = timestamp.toString();
			String strMonth = dateString.substring(5, 7);
			if (strMonth.substring(0, 1).equals("0")) {
				strMonth = strMonth.substring(1);
			}
			return strMonth;
		} else {
			return "";
		}
	}

	/**
	 * 获得任意字符串的双字节长度
	 * 
	 * @param tmpString
	 * @return int
	 */
	public static int getStringBitLength(String tmpString) {
		int tmpLength = 0;
		for (int i = 0; i < tmpString.length(); i++) {
			char c = tmpString.charAt(i);
			if (c < 255) {
				tmpLength++;
			} else {
				tmpLength = tmpLength + 2;
			}
		}
		return tmpLength;
	}

	/**
	 * getTime - 得到日历型数据的"HH:MM:SS"样式的字符串
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getTime(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("HH:mm:ss");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * function :translate Calemdar into Timestamp
	 * 
	 * @param cal
	 * @return Timestamp
	 */
	public static Timestamp getTimestamp(java.util.Calendar cal) {
		if (cal != null) {
			java.util.Date tempDate = cal.getTime();
			return new Timestamp(tempDate.getTime());
		} else {
			return null;
		}
	}

	/**
	 * function - 由calendar 得到年
	 * 
	 * @param pCal
	 * @return String
	 */
	public static String getYear(java.util.Calendar pCal) {
		Timestamp timestamp = getTimestamp(pCal);
		if (timestamp != null) {
			String dateString = timestamp.toString();
			String strYear = dateString.substring(0, 4);
			return strYear;
		} else {
			return "";
		}
	}

	/**
	 * 获得YYYYMMDD格式的字符串
	 * 
	 * @param aCal
	 * @return String
	 */
	public static String getNumberDate(Calendar aCal) {
		String aYear, aMonth, aDay;

		if (aCal != null) {
			aYear = getYear(aCal);
			aMonth = getMonth(aCal);
			aDay = getDay(aCal);
			aMonth = Integer.parseInt(aMonth) < 10 ? ("0" + aMonth) : aMonth;
			aDay = Integer.parseInt(aDay) < 10 ? ("0" + aDay) : aDay;
			return aYear + aMonth + aDay;

		} else {
			return "00000000";
		}

	}

	/**
	 * 将字符串按照双字节长度进行格式化，超过部分代替为[...]
	 * 
	 * @param curString
	 * @param length
	 * @return String
	 */
	public static String formatStringLength(String curString, int length) {
		if (getStringBitLength(curString) > length) {
			curString = curString.substring(0, (int) length / 2) + "...";
		}
		return curString;
	}

	public DateUtil() {
	}

	/**
	 * filterIntoHTML - 将特殊字符进行HTML转移符转换
	 * 
	 * @param tmpString
	 * @return String
	 */
	public static String filterIntoHTML(String tmpString) {
		tmpString = tmpString.replaceAll("'", "&#39;");
		tmpString = tmpString.replaceAll(" ", "&nbsp;");
		tmpString = tmpString.replaceAll("\n", "<br>");

		return tmpString;
	}

	/**
	 * 将double类型转化为百分数
	 * 
	 * @param divisor
	 * @param number
	 * @return String
	 */
	public static String toPercent(double divisor, double number) {
		NumberFormat format = NumberFormat.getPercentInstance(Locale
				.getDefault());
		if (divisor == 0 || number == 0) {
			return "0%";
		}
		return format.format(number / divisor);
	}

	/**
	 * 将数字格式化为固定长度的字符串型不够位数补[0]，超过位数截取最后的几位
	 * 
	 * @param curValue
	 * @param length
	 * @return String
	 */
	public static String formatNumber(int curValue, int length) {
		String tmpValue = Integer.toString(curValue);
		if (tmpValue.length() > length) {
			tmpValue = tmpValue.substring(tmpValue.length() - length);
		} else {
			int loop = length - tmpValue.length();
			for (int i = 0; i < loop; i++) {
				tmpValue = "0" + tmpValue;
			}
		}

		return tmpValue;
	}

	/**
	 * 获得一个随机数
	 * 
	 * @param seed
	 * @return randomNumber
	 */
	public static String getRandomNumber(int seed) {
		Random tmpRandom = new Random();
		String randomNumber = Integer.toString(tmpRandom.nextInt(seed));
		return randomNumber;
	}

	/**
	 * 将中文字符转化为UTF-8编码
	 * 
	 * @param s
	 * @return String
	 */
	public static String formatWithUTF8(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = Character.toString(c).getBytes("utf-8");
				} catch (Exception ex) {
					System.out.println(ex);
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0)
						k += 256;
					sb.append("%" + Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}

	/**
	 * 根据日期对比两个 Calendar对象
	 * 
	 * @param targetCalendar
	 * @param compareCalendar
	 * @return boolean
	 */
	public static boolean compareCalendarByDate(Calendar targetCalendar,
			Calendar compareCalendar) {
		if ((targetCalendar != null && compareCalendar == null)
				|| (targetCalendar == null && compareCalendar != null)) {
			return false;
		}
		if (targetCalendar != null && compareCalendar != null) {
			String targetDate = getDateString(targetCalendar);
			String compareDate = getDateString(compareCalendar);
			if (!targetDate.equals(compareDate)) {
				return false;
			}
		}
		return true;
	}

	/**
	 * 获得日期对应的周几
	 * 
	 * @param Cal
	 * @return String
	 */
	public static String getDayOfWeekName(Calendar Cal) {
		int dayofweek = 0;
		String tmp = Cal.toString();
		tmp = tmp.substring(tmp.indexOf("DAY_OF_WEEK=") + 12, tmp
				.indexOf("DAY_OF_WEEK=") + 13);
		dayofweek = Integer.parseInt(tmp);
		String DayName = "";
		switch (dayofweek) {
		case 2:
			DayName = "星期一";
			break;
		case 3:
			DayName = "星期二";
			break;
		case 4:
			DayName = "星期三";
			break;
		case 5:
			DayName = "星期四";
			break;
		case 6:
			DayName = "星期五";
			break;
		case 7:
			DayName = "星期六";
			break;
		case 1:
			DayName = "星期天";
			break;
		}
		try {
			DayName = new String(DayName.getBytes("gb2312"), "GBk");
		} catch (Exception e) {
			return "0";
		}
		return DayName;
	}

	/**
	 * 获得src的n次方
	 * 
	 * @param src
	 * @param nTime
	 * @return int
	 */
	public static int nPower(int src, int nTime) {
		int ret = 1;
		for (int i = 0; i < nTime; i++) {
			ret = ret * src;
		}
		return ret;
	}

	/**
	 * 获得src的 reventPower
	 * 
	 * @param src
	 * @param code
	 * @return ArrayList
	 */
	public static ArrayList reventPower(int src, int code) {
		ArrayList codeMap = new ArrayList();
		int count = 0;
		while (code >= nPower(src, count)) {
			if ((code & nPower(src, count)) != 0) {
				codeMap.add(Integer.toString(count + 1));
			}
			count++;
		}
		return codeMap;
	}

	/**
	 * 获得无间隔的时间字符串
	 * 
	 * @param cal
	 * @return String
	 */
	public static String getDateTimeStamp(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat(
					"yyyyMMddHHmmss");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * getHours - 得到日历型数据的"HH"样式的字符串
	 */
	public static String getHours(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("HH");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}
	
	/**
	 * getMonths - 得到日历型数据的"MM"样式的字符串
	 */
	public static String getMonths(java.util.Calendar cal) {
		if (cal != null) {
			SimpleDateFormat dateFormatter = new SimpleDateFormat("MM");
			java.util.Date theDate = cal.getTime();
			return dateFormatter.format(theDate);
		} else
			return "";
	}

	/**
	 * 获得Calendar对象
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @param hour
	 * @return Calendar
	 */
	public static Calendar getCalendar(String year, String month, String day,
			String hour) {
		if (!year.equals("") && !month.equals("") && !day.equals("")
				&& !day.equals("")) {
			Calendar tmpData = Calendar.getInstance();
			tmpData.set(Integer.valueOf(year).intValue(), Integer
					.valueOf(month).intValue() - 1, Integer.valueOf(day)
					.intValue(), Integer.valueOf(hour).intValue(), 0);
			return tmpData;
		} else if (!year.equals("") && !month.equals("") && !day.equals("")
				&& day.equals("")) {
			Calendar tmpData1 = Calendar.getInstance();
			tmpData1.set(Integer.valueOf(year).intValue(), Integer.valueOf(
					month).intValue() - 1, Integer.valueOf(day).intValue(), 0,
					0);
			return tmpData1;
		} else if (!year.equals("") && !month.equals("") && day.equals("")) {
			Calendar tmpData1 = Calendar.getInstance();
			tmpData1.set(Integer.valueOf(year).intValue(), Integer.valueOf(
					month).intValue() - 1, 1, 0, 0);
			return tmpData1;
		} else if (!year.equals("") && month.equals("") && day.equals("")) {
			Calendar tmpData2 = Calendar.getInstance();
			tmpData2.set(Integer.valueOf(year).intValue(), 0, 1, 0, 0);
			return tmpData2;
		} else
			return null;
	}

	/**
	 * 返回首字母为小写的字符串
	 * 
	 * @param tmpString
	 * @return String
	 */
	public static String getFirstCharLowerCase(String tmpString) {
		if (tmpString != null) {
			if (tmpString.length() > 1) {
				String firstChar = tmpString.substring(0, 1);
				tmpString = firstChar.toLowerCase() + tmpString.substring(1);
			} else {
				tmpString.toLowerCase();
			}
		} else {
			return "";
		}
		return tmpString;
	}

	/**
	 * 将String类型转化为long类型
	 * 
	 * @param string
	 * @return long
	 */
	public static long longValue(String string) {
		long result = -999999;
		try {
			result = Long.parseLong(string);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/**
	 * 根据生日获得年龄
	 * 
	 * @param birthDay
	 * @return int
	 */
	public static int getAge(Calendar birthDay) {
		return getAge(birthDay, Calendar.getInstance());
	}

	/**
	 * 根据生日和当前日期获得年龄
	 * 
	 * @param birthDay
	 * @param curDate
	 * @return int
	 */
	public static int getAge(Calendar birthDay, Calendar curDate) {
		int age = -99;
		if (birthDay != null) {
			Calendar now = curDate;
			if (birthDay.before(now)) {
				age = Integer.parseInt(getYear(now))
						- Integer.parseInt(getYear(birthDay));
			}
		}
		return age;
	}

	/*
	 * 根据〖中华人民共和国国家标准 GB 11643-1999〗中有关公民身份号码的规定，公民身份号码是特征组
	 * 合码，由十七位数字本体码和一位数字校验码组成。排列顺序从左至右依次为：六位数字地址码，八位数 字出生日期码，三位数字顺序码和一位数字校验码。
	 * 地址码表示编码对象常住户口所在县(市、旗、区)的行政区划代码。生日期码表示编码对象出生的年、月
	 * 、日，其中年份用四位数字表示，年、月、日之间不用分隔符。顺序码表示同一地址码所标识的区域范围
	 * 内，对同年、月、日出生的人员编定的顺序号。顺序码的奇数分给男性，偶数分给女性。校验码是根据前 面十七位数字码，按照ISO
	 * 7064:1983.MOD 11-2校验码计算出来的检验码。下面举例说明该计算方法。
	 * 15位的身份证编码首先把出生年扩展为4位，简单的就是增加一个19，但是这对于1900年出生的人不使用 （这样的寿星不多了）
	 * 某男性公民身份号码本体码为34052419800101001，首先按照公式⑴计算： ∑(ai×Wi)(mod
	 * 11)……………………………………(1) 公式(1)中： i----表示号码字符从由至左包括校验码在内的位置序号；
	 * ai----表示第i位置上的号码字符值； Wi----示第i位置上的加权因子，其数值依据公式Wi=2（n-1）(mod 11)计算得出。 i 18
	 * 17 16 15 14 13 12 11 10 9 8 7 6 5 4 3 2 1 ai 3 4 0 5 2 4 1 9 8 0 0 1 0 1
	 * 0 0 1 a1 Wi 7 9 10 5 8 4 2 1 6 3 7 9 10 5 8 4 2 1 ai×Wi 21 36 0 25 16 16
	 * 2 9 48 0 0 9 0 5 0 0 2 a1 根据公式(1)进行计算： ∑(ai×Wi)
	 * =（21+36+0+25+16+16+2+9+48++0+0+9+0+5+0+0+2) = 189 189 ÷ 11 = 17 + 2/11
	 * ∑(ai×Wi)(mod 11) = 2 然后根据计算的结果，从下面的表中查出相应的校验码，其中X表示计算结果为10： ∑(ai×WI)(mod
	 * 11) 0 1 2 3 4 5 6 7 8 9 10 校验码字符值ai 1 0 X 9 8 7 6 5 4 3 2
	 * 根据上表，查出计算结果为2的校验码为所以该人员的公民身份号码应该为 34052419800101001X。
	 */
	/**
	 * 身份证号码升位
	 * 
	 * @param _15idnum
	 *            15位身份证号码
	 * @return 18位身份证号码
	 * @author apan
	 */
	public static String updateIDNum15to18(String _15IDNum) {
		String _18idnum = "";// 升位后18位身份证号码
		_15IDNum = _15IDNum.trim();// 15位号码除空格
		int sum = 0;
		int j = 0;
		int[] w = { 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 };// 加权因子
		String[] a = { "1", "0", "x", "9", "8", "7", "6", "5", "4", "3", "2" };// 验证码
		if (_15IDNum.length() != 15) {
			return _15IDNum;// 如果身份证号码不是15位，返回原来值。
		} else {
			// 补充年份80－－>1980
			_18idnum = _15IDNum.substring(0, 6) + "19" + _15IDNum.substring(6);
		}
		// 求和
		for (int i = 0; i < 17; i++) {
			j = w[i] * Integer.parseInt(_18idnum.substring(i, i + 1));
			sum = sum + j;
		}
		// 取余数
		sum = sum % 11;
		// 添加验证码
		_18idnum = _18idnum + a[sum];
		// 返回18位身份证号码
		return _18idnum;
	}

	/**
	 * 将value转化成中文数字的大小写
	 * 
	 * @param value
	 * @param type
	 *            1:大写中文 2：小写中文
	 * @return String
	 */
	public static String convertChineseNumber(long value, int type) {
		String[] chNumber = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒", "捌", "玖" };
		String[] digit = { "", "拾", "佰", "仟", "万", "十", "百", "仟" };
		switch (type) {
		case 1:
			String[] capsCNumber = { "零", "壹", "贰", "叁", "肆", "伍", "陆", "柒",
					"捌", "玖" };
			chNumber = capsCNumber;
		case 2:
			String[] minCNumber = { "零", "一", "二", "三", "四", "五", "六", "七",
					"八", "九" };
			chNumber = minCNumber;
		}
		String retStr = "";

		String inputStr = Long.toString(value);
		for (int i = inputStr.length(); i > 0; i--) {
			char ch = inputStr.charAt(i - 1);
			if (ch != '0') {

				retStr = chNumber[ch - '0'] + digit[inputStr.length() - i]
						+ retStr;
			} else {
				if (inputStr.length() - i == 4)
					retStr = "零万" + retStr;
				else
					retStr = "零" + retStr;
			}
		}

		int pos = retStr.indexOf("零零");
		while (pos >= 0) {
			retStr = retStr.replaceAll("零零", "零");
			pos = retStr.indexOf("零零");
		}

		retStr = retStr.replaceAll("零万", "万");

		try {
			retStr = new String(retStr.getBytes("gb2312"), "GBk");
		} catch (Exception e) {
			return "0";
		}
		return retStr;
	}

	/**
	 * 验证日期是否合法
	 * 
	 * @param text
	 * @param string
	 * @param i
	 * @return boolean
	 */
	public static boolean checkDate(String text, String split, int checkType) {
		try {
			String[] dateString = text.split(split);
			switch (checkType) {
			case 1:
				// Full Date Check;
				if (dateString.length == 3) {
					int year = Integer.parseInt(dateString[0]);
					int month = Integer.parseInt(dateString[1]);
					int day = Integer.parseInt(dateString[2]);
					return checkDate(year, month, day);
				}
				break;
			case 2:
				break;
			default:
				break;
			}
			return false;
		} catch (Exception e) {
			return false;
		}
	}

	/**
	 * 验证日期是否合法
	 * 
	 * @param year
	 * @param month
	 * @param day
	 * @return boolean
	 */
	private static boolean checkDate(int year, int month, int day) {
		if (year > 1800) {
			if (month > 0 && month < 13) {
				if (day > 0) {
					switch (month) {
					case 2:
						if (isLeapYear(year)) {
							if (day < 30) {
								return true;
							}
						} else {
							if (day < 29) {
								return true;
							}
						}
						break;
					case 1:
					case 3:
					case 5:
					case 7:
					case 8:
					case 10:
					case 12:
						if (day < 32) {
							return true;
						}
						break;
					case 4:
					case 6:
					case 9:
					case 11:
						if (day < 31) {
							return true;
						}
					}
				}
			}
		}
		return false;

	}

	/**
	 * 判断是否是闰年
	 * 
	 * @param year
	 * @return boolean
	 */
	public static boolean isLeapYear(int year) {
		if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 获得花费的时间
	 * 
	 * @param startTime
	 * @param tmpTime
	 * @return long
	 */
	public static long getSpendTime(Calendar startTime, Calendar endTime,
			long count) {
		long result = endTime.getTimeInMillis() - startTime.getTimeInMillis();
		return (long) (result * count / 60000);
	}

	/**
	 * 获得花费的秒数
	 * 
	 * @param startTime
	 * @param tmpTime
	 * @return long
	 */
	public static long getSpendSecond(Calendar startTime, Calendar endTime,
			long count) {
		long result = endTime.getTimeInMillis() - startTime.getTimeInMillis();
		return (long) (result * count / 1000);
	}

	/**
	 * 获得花费的分钟数
	 * 
	 * @param startTime
	 * @param tmpTime
	 * @return long
	 */
	public static long getSpendMinutes(Calendar startTime, Calendar endTime,
			long count) {
		long result = getSpendSecond(startTime, endTime, count);
		return (long) (result / 60);
	}

	/**
	 * 获得花费的小时数
	 * 
	 * @param startTime
	 * @param tmpTime
	 * @return long
	 */
	public static long getSpendHours(Calendar startTime, Calendar endTime,
			long count) {
		long result = getSpendMinutes(startTime, endTime, count);
		return (long) (result / 60);
	}

	/**
	 * 获得花费的天数
	 * 
	 * @param startTime
	 * @param tmpTime
	 * @return long
	 */
	public static long getSpendDays(Calendar startTime, Calendar endTime,
			long count) {
		long result = getSpendHours(startTime, endTime, count);
		return (long) (result / 24);
	}

	/**
	 * 获得预计还需多少时间
	 * 
	 * @param startTime
	 * @param endTime
	 * @param leftTimes
	 * @return String
	 */
	public static String getIntendingTime(Calendar startTime, Calendar endTime,
			int leftTimes) {
		String intendingTime = "";
		long speedTime = getSpendSecond(startTime, endTime, leftTimes);
		long hours = speedTime / (60 * 60);
		long minutes = (speedTime - hours * 60) / 60;
		long seconds = speedTime - hours * 60 - minutes * 60;
		intendingTime = "预计还需" + hours + "小时" + minutes + "分" + seconds + "秒";
		return intendingTime;
	}

	/**
	 * 获得间隔多少时间
	 * 
	 * @param startTime
	 * @param tmpTime
	 * @return long
	 */
	public static long getIntervalTime(Calendar startTime, Calendar endTime) {
		long result = endTime.getTimeInMillis() - startTime.getTimeInMillis();
		return (long) (result / 1000);
	}

	/**
	 * 获得季度
	 * 
	 * @param tmpCalendar
	 * @return String
	 */
	public static String getYearSeason(Calendar tmpCalendar) {
		String yearSeason = "";
		if (tmpCalendar != null) {
			String season = "";
			switch (getQuarter(tmpCalendar)) {
			case 1:
				season = "第一季度";
				break;
			case 2:
				season = "第二季度";
				break;
			case 3:
				season = "第三季度";
				break;
			case 4:
				season = "第四季度";
				break;
			}
			yearSeason = tmpCalendar.get(Calendar.YEAR) + "年" + season;
		}
		return yearSeason;
	}

	/**
	 * 获得年月周格式的时间
	 * 
	 * @param tmpCalendar
	 * @return String
	 */
	public static String getYearMonthWeek(Calendar tmpCalendar) {
		String yearMonthWeek = "";
		if (tmpCalendar != null) {
			yearMonthWeek = tmpCalendar.get(Calendar.YEAR) + "年"
					+ tmpCalendar.get(Calendar.MONTH) + "月第"
					+ tmpCalendar.get(Calendar.WEEK_OF_MONTH) + "周";
		}
		return yearMonthWeek;
	}

	/**
	 * 获得时间刻
	 * 
	 * @param tmpCalendar
	 * @return int
	 */
	public static int getQuarter(Calendar tmpCalendar) {
		int quarter = tmpCalendar.get(Calendar.MONTH) + 1;
		if (quarter % 3 > 0) {
			quarter = quarter / 3 + 1;
		} else {
			quarter = quarter / 3;
		}
		return quarter;
	}

	/**
	 * 将value格式为[#,###,###,##0.00]格式的数据
	 * 
	 * @param value
	 * @return String
	 */
	public static String format(double value) {
		return format(value, "#,###,###,##0.00");
	}

	/**
	 * 将value格式话format定义的格式
	 * 
	 * @param value
	 * @param format
	 * @return String
	 */
	public static String format(double value, String format) {
		DecimalFormat df = new DecimalFormat(format);
		return df.format(value);
	}

	/**
	 * 返回一个定长的随机字符串(只包含数字)
	 * 
	 * @param length
	 *            随机字符串长度
	 * @return 随机字符串
	 */
	public static String generateString(int length) {
		StringBuffer sb = new StringBuffer();
		String numberChar = "0123456789";
		Random random = new Random();
		for (int i = 0; i < length; i++) {
			sb.append(numberChar.charAt(random.nextInt(numberChar.length())));
		}
		return sb.toString();
	}
}
