package com.zixue.shop.manager.dao;

import com.zixue.shop.bean.User;

public interface UserDao
{
    
    public User queryLoginUser(User user);
    public User queryLoginUserByLoginacct(String loginacct);
}
