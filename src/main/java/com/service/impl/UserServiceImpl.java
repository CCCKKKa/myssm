package com.service.impl;


import com.dao.UserMapper;
import com.pojo.User;
import com.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements UserService {
@Resource
    private UserMapper userMapper;//注入userMapper
//添加新用户
    public void addUser(User user) {
           userMapper.addUser(user);//调用userMapper的添加方法
    }

    public User getUserByUsername(String user_name) {
        User user1=userMapper.getUserByUsername(user_name);//调用方法通过用户名获取用户信息
        return user1;
    }
//验证登陆信息
    public User checkLogin(String user_name, String password) {
        User user=userMapper.getUserByUsername(user_name);
        if (user!=null&&user.getPassword().equals(password)){//用来匹配输入的登陆信息
            return user;
        }
            return null;
    }
}
