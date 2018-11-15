package com.base;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class URLAvailability {

	private static URL urlStr;

	private static HttpURLConnection connection;

	private static int state = -1;
	
	private static String Str = "";

	public static String getStr() {
		return Str;
	}

	public static void setStr(String str) {
		Str = str;
	}

	/**
	 * 功能描述 : 检测当前URL是否可连接或是否有效, 最多连接网络 5 次, 如果 5 次都不成功说明该地址不存在或视为无效地址.
	 * 
	 * @param url
	 *            指定URL网络地址
	 * 
	 * @return String
	 */
	public synchronized static boolean isConnect(String url) {
		int counts = 0;
		boolean succ = false;

		if (url == null || url.length() <= 0) {
			return succ;
		}
		while (counts < 5) {
			try {
				urlStr = new URL(url);
				connection = (HttpURLConnection) urlStr.openConnection();
				state = connection.getResponseCode();
				//System.out.println(state);
				if (state == 200) {
					succ = true;
					InputStream in = connection.getInputStream();
					URLAvailability.setStr(convertStreamToString(in));
				}
				break;
			} catch (Exception ex) {ex.printStackTrace();
				counts++;
				continue;
			}
		}
		return succ;
	}

	public static String convertStreamToString(InputStream is) {

		BufferedReader reader = new BufferedReader(new InputStreamReader(is));
		StringBuffer sb = new StringBuffer();

		String line = null;
		try {
			while ((line = reader.readLine()) != null) {
				sb.append(line + "\n");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				is.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return sb.toString();
	}

	public static void main(String[] args) {
		System.out.println(URLAvailability.isConnect("http://10.20.30.42"));
		//System.out.println(URLAvailability.isConnect("http://111.207.224.117"));
	}

}
