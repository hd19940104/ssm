package com.zixue.shop.manager.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zixue.shop.bean.User;
import com.zixue.shop.manager.dao.UserDao;
import com.zixue.shop.manager.service.UserService;

@Service
public class UserServiceImpl implements UserService
{
    @Autowired
    private UserDao userDao;
    
    public User queryLoginUser(User user)
    {
        return userDao.queryLoginUser(user);
    }
    public User queryLoginUserByLoginacct(String loginacct){
        return userDao.queryLoginUserByLoginacct(loginacct);
    }
}
