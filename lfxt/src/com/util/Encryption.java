package com.util;

import java.security.Security;

public class Encryption {

    public Encryption() {
    }

    public static String getEncrypt(String temp){
        String result = "";
        byte[] data = null;
        Security.addProvider(new com.sun.crypto.provider.SunJCE());
        data = temp.getBytes();
        result = new sun.misc.BASE64Encoder().encode(data);
        return result ;
    }

    public static  String getDecrypt(String temp){
        String result = "";
        try {
            byte[] data = new sun.misc.BASE64Decoder().decodeBuffer(temp);
            result = new String(data);
        }
        catch(java.io.IOException e){
            return result;
        }
        return result;
    }

    public static void main(String[] args) {
        Encryption encryp = new Encryption();
        //String str_in  = "218.205.197.18@orcl@lqerpc@jl@xh@xz";
        //String str_in  = "10.20.30.42@tianbo@lqerpc@jl@lq";
        String str_in  = "北京路新沥青混凝土有限公司一分公司";
        String str_out = encryp.getEncrypt(str_in);
        str_in = encryp.getDecrypt("sbG+qQ==");
        System.out.println("str_in="+str_in);
        System.out.println("str_out="+str_out);
    }

}