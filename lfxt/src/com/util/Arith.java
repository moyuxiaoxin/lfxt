package com.util;

import java.math.BigDecimal;

public class Arith {
	// 默认除法运算精度
	private static final int DEF_DIV_SCALE = 6;

	// 这个类不能实例化
	private Arith() {
	}

	/**
	 * 提供精确的加法运算。
	 * 
	 * @param v1
	 *            被加数
	 * @param v2
	 *            加数
	 * @return 两个参数的和 此方法得问题：当返回数据整数部分超出7位时，表示为科学计数法，如1.0388822606E8
	 *         用addReturnString()代替
	 */
	public static double add(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));

		return b1.add(b2).doubleValue();
	}

	/**
	 * 提供精确的加法运算。
	 * 
	 * @param v1
	 *            被加数
	 * @param v2
	 *            加数
	 * @return 两个参数的和
	 */
	public static String addReturnString(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		double redouble = b1.add(b2).doubleValue();
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		nf.setGroupingUsed(false);
		return nf.format(redouble);
	}

	/**
	 * 提供精确的减法运算。
	 * 
	 * @param v1
	 *            被减数
	 * @param v2
	 *            减数
	 * @return 两个参数的差
	 */
	public static double sub(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.subtract(b2).doubleValue();
	}

	/**
	 * 提供精确的乘法运算。
	 * 
	 * @param v1
	 *            被乘数
	 * @param v2
	 *            乘数
	 * @return 两个参数的积 此方法得问题：当返回数据整数部分超出7位时，表示为科学计数法，如1.0388822606E8
	 *         用mulReturnString()代替
	 */
	public static double mul(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		return b1.multiply(b2).doubleValue();
	}

	/**
	 * 提供精确的乘法运算。
	 * 
	 * @param v1
	 *            被乘数
	 * @param v2
	 *            乘数
	 * @return 两个参数的积
	 */
	public static String mulReturnString(double v1, double v2) {
		BigDecimal b1 = new BigDecimal(Double.toString(v1));
		BigDecimal b2 = new BigDecimal(Double.toString(v2));
		double redouble = b1.multiply(b2).doubleValue();
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		nf.setGroupingUsed(false);

		return nf.format(redouble);
	}

	/**
	 * 提供（相对）精确的除法运算，当发生除不尽的情况时，精确到 小数点以后10位，以后的数字四舍五入。
	 * 
	 * @param v1
	 *            被除数
	 * @param v2
	 *            除数
	 * @return 两个参数的商
	 */
	public static double div(double v1, double v2) {
		return div(v1, v2, DEF_DIV_SCALE);
	}

	/**
	 * 提供（相对）精确的除法运算。当发生除不尽的情况时，由scale参数指 定精度，以后的数字四舍五入。
	 * 
	 * @param v1
	 *            被除数
	 * @param v2
	 *            除数
	 * @param scale
	 *            表示表示需要精确到小数点以后几位。
	 * @return 两个参数的商
	 */
	public static double div(double v1, double v2, int scale) {
		if (scale < 0) {
			throw new IllegalArgumentException(
					"The scale must be a positive integer or zero");
		}
		if(v2==0)return 0; 
		BigDecimal bv1 = new BigDecimal(Double.toString(v1));
		BigDecimal bv2 = new BigDecimal(Double.toString(v2));
		// BigDecimal b = bv1.divide(bv2);
		// BigDecimal one = new BigDecimal("1");
		// b.divide(one, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
		return bv1.divide(bv2, scale, BigDecimal.ROUND_HALF_UP).doubleValue();
	}

	/**
	 * 格式化输入的值，防止出现科学计数法
	 * 
	 * @param d1
	 * @return
	 */
	public static String formatDouble(double d1) {
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		nf.setGroupingUsed(false);
		return nf.format(d1);
	}

	/**
	 * 格式化输入的值，防止出现科学计数法
	 * 
	 * @param f1
	 * @return
	 */
	public static String formatFloat(float f1) {
		java.text.NumberFormat nf = java.text.NumberFormat.getInstance();
		nf.setGroupingUsed(false);
		return nf.format(f1);
	}
	
	/**
	 * 格式化指定浮点数值，由scale参数指 定精度，以后的数字四舍五入。
	 * 
	 * @param v
	 *            要格式化的浮点数
	 * @param scale
	 *            表示表示需要精确到小数点以后几位。
	 * @return 格式化的数值
	 */	
	public static double round(double v,int scale){
	       if(scale<0){
	           throw new IllegalArgumentException(
	               "The scale must be a positive integer or zero");
	       }
	       BigDecimal b = new BigDecimal(Double.toString(v));
	       BigDecimal one = new BigDecimal("1");
	       return b.divide(one,scale,BigDecimal.ROUND_HALF_UP).doubleValue();
	   }
}
