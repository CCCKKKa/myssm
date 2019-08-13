package com.service;

import com.pojo.User;

public interface UserService {
    public void addUser(User user);//定义新增用户的方法
    public User getUserByUsername(String user_name);//定义一个通过用户名获取用户的一个方法
    public User checkLogin(String user_name,String password);//定义登陆验证方法

}
