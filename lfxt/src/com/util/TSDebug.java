package com.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Calendar;

/**
 * @Name TSDebug
 * @Description 定义调试处理类
 * @Author Daniel Chen
 * @Date 2005-12-25
 */
public class TSDebug {

	static File debugLogFile;

	static boolean useLogFile = false;

	private static FileOutputStream logger;
/**
 * 在前台打印出调试信息
 * @param e
 */
	public static void printStackTrace(Throwable e) {
		outPrint(e.getLocalizedMessage());
		e.printStackTrace();
	}

	/**
	 * 输出调试信息
	 * @param strMSG
	 */
	public static void outPrint(String strMSG) {
		String strOutPrint = getTS_DEBUG_HEADER() + strMSG;
		if (useLogFile) {
			outPrint(logger, strMSG);
		}		
	}
/**
 * 取得调试日期信息
 * @return
 */
	public static String getTS_DEBUG_HEADER() {
		return "[TS_SDK Debug Info("
				+ DataUtil.getDateTime(Calendar.getInstance()) + ")]";
	}

	/**
	 * 输出调试信息
	 * @param logger
	 * @param string
	 */
	public static void outPrint(FileOutputStream logger, String strMSG) {
		String strOutPrint = getTS_DEBUG_HEADER() + strMSG;
		try {
			strOutPrint = strOutPrint + "\n";
			logger.write(strOutPrint.getBytes());
		} catch (IOException e) {
			printStackTrace(e);
		}
	}

	/**
	 * 输出日志信息
	 * @param logger
	 * @param string
	 * @throws FileNotFoundException
	 */
	public static void outPrintLog(String strMSG) {
		outPrint(logger, strMSG);
	}
/**
 * 调试启动
 * @param rootPath
 * @throws FileNotFoundException
 */
	public static void start(String rootPath) throws FileNotFoundException {
		String fileName = rootPath + "/log/ST_DEBUG_LOG_"
				+ DataUtil.getNumberDateTime(Calendar.getInstance()) + ".log";
		
		debugLogFile = new File(fileName);
		logger = new FileOutputStream(debugLogFile);
		useLogFile = true;
		outPrint("成功创建日志文件[" + fileName + "]");
	}

}
