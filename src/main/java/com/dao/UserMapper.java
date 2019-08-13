package com.dao;

import com.pojo.User;

public interface UserMapper {
    public void addUser(User user);//添加用户信息
    public User getUserByUsername(String user_name);//通过user_name获取user信息
}
