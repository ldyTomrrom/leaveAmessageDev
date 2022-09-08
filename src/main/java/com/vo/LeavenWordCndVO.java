package com.vo;

import org.springframework.util.StringUtils;

public class LeavenWordCndVO {
    private String name;
    private String context;
    private String startDt;
    private String endDt;

    public LeavenWordCndVO() {
    }

    public LeavenWordCndVO(String name, String context, String startDt, String endDt) {
        this.name = name;
        this.context = context;
        this.startDt = startDt;
        this.endDt = endDt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getStartDt() {
        return startDt;
    }

    public void setStartDt(String startDt) {
        this.startDt = startDt;
    }

    public String getEndDt() {
        return endDt;
    }

    public void setEndDt(String endDt) {
        this.endDt = endDt;
    }

    @Override
    public String toString() {
        String r="查询信息:{";
        if (!StringUtils.isEmpty(getName())){
            r+="留言人:"+getName();
        }
        if (!StringUtils.isEmpty(getContext())){
            r+="留言内容:"+getContext();
        }
        if (!StringUtils.isEmpty(getStartDt())){
            r+="开始日期:"+getStartDt();
        }
        if (!StringUtils.isEmpty(getEndDt())){
            r+="结束日期:"+getEndDt();
        }
        return r+"}";
    }
}
