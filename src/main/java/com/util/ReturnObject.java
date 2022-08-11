package com.util;

import java.util.HashMap;

/**
 * 自出洞来无敌手 --
 * 2022/5/1
 */
public class ReturnObject extends HashMap {



    public static ReturnObject  success(){
        ReturnObject r=new ReturnObject();
        r.put("code",1);
        r.put("message","success");
        return r;
    }
    public static ReturnObject  success(Object obj){
        ReturnObject r=new ReturnObject();
        r.put("code",1);
        r.put("message","success");
        r.put("data",obj);
        return r;
    }
    public static ReturnObject  fail(String message){
        ReturnObject r=new ReturnObject();
        r.put("code",0);
        r.put("message",message);
        return r;
    }

}
