package com.pojo;

public class LeaveWord {
    private String id;

    private String context;

    private String owner;

    private String messagetime;

    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getContext() {
        return context;
    }

    public void setContext(String context) {
        this.context = context;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getMessagetime() {
        return messagetime;
    }

    public void setMessagetime(String messagetime) {
        this.messagetime = messagetime;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "LeaveWord{" +
                "id='" + id + '\'' +
                ", context='" + context + '\'' +
                ", owner='" + owner + '\'' +
                ", messagetime='" + messagetime + '\'' +
                ", name='" + name + '\'' +
                '}';
    }
}