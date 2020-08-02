package com.zixue.shop.manager.service;

import com.zixue.shop.bean.User;

public interface UserService
{
    public User queryLoginUser(User user);
    public User queryLoginUserByLoginacct(String loginacct);
    
}
