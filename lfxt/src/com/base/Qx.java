package com.base;

public class Qx {

	/**
	 * 一般用于添加、修改页的权限判断（一般添加、修改页是一个页面）
	 * @param qx 用户所具有的权限
	 * @param id 记录的id 
	 * @param zj 访问添加页所需权限
	 * @param xg 访问修改页所需权限
	 * @return true 说明不具有该权限
	 */
	public static boolean getSaveQx(String qx,int id,int zj,int xg){
		boolean fh = false;
		if(qx==null||qx.indexOf(","+zj+",")==-1&&qx.indexOf(","+xg+",")==-1||qx.indexOf(","+zj+",")==-1&&id<=0||qx.indexOf(","+xg+",")==-1&&id>0){
			fh = true;
		}
		return fh;
	}
	
	/**
	 * 一般用于查看、列表页的权限判断
	 * @param qx 用户所具有的权限
	 * @param cx 查看该页所需权限
	 * @return true 说明不具有该权限
	 */
	public static boolean getLookQx(String qx,int cx){
		boolean fh = false;
		if(qx==null||qx.indexOf(","+cx+",")==-1){
			fh = true;
		}
		return fh;
	}
}
