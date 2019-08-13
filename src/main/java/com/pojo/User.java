package com.pojo;

public class User {
    private int id;
    private String user_name;
    private String password;
    private String phone;
    private String smsCode;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public String getSmsCode() {
        return smsCode;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public void setSmsCode(String smsCode) {
        this.smsCode = smsCode;
    }
}
