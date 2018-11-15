package com.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;

public final class MD5 {

	/**
	 * 得到文件的MD5码,用于校验
	 * @param path
	 * @return
	 */
	public static String getMD5(String path) {
        FileInputStream fis = null;
        try {
        	File file = new File(path);
            MessageDigest md = MessageDigest.getInstance("MD5");
            fis = new FileInputStream(file);
            byte[] buffer = new byte[8192];
            int length = -1;
            //System.out.println("开始算");
            while ((length = fis.read(buffer)) != -1) {
                md.update(buffer, 0, length);
            }
            //System.out.println("算完了");
            return (new java.math.BigInteger(md.digest())).toString(16);
        } catch (IOException ex) {
            Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                fis.close();
            } catch (IOException ex) {
                Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * 得到文件的SHA码,用于校验
     * @param path
     * @return
     */
    public static String getSHA(String path) {
        FileInputStream fis = null;
        try {
        	File file = new File(path);
            MessageDigest md = MessageDigest.getInstance("SHA");
            fis = new FileInputStream(file);
            byte[] buffer = new byte[8192];
            int length = -1;
            System.out.println("开始算");
            while ((length = fis.read(buffer)) != -1) {
                md.update(buffer, 0, length);
            }
            System.out.println("算完了");
            return (new java.math.BigInteger(md.digest())).toString(16);
        } catch (IOException ex) {
            Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } catch (NoSuchAlgorithmException ex) {
            Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, ex);
            return null;
        } finally {
            try {
                fis.close();
            } catch (IOException ex) {
                Logger.getLogger(MD5.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public static void main(String[] args) {
    	System.out.println(MD5.getMD5("G:/q.txt"));
    	System.out.println(MD5.getMD5("G:/a.txt"));
    }
}
