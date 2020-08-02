package com.zixue.shop.bean;
/**
 * 用户信息
 * @author 一只会飞的小猴子
 *
 */
public class User
{
    private Integer id; //用户id
    private  String loginacct;//登录名
    private String userpswd;//密码
    private String username;//用户名字
    
    public String getUsername()
    {
        return username;
    }
    public void setUsername(String username)
    {
        this.username = username;
    }
    public Integer getId()
    {
        return id;
    }
    public void setId(Integer id)
    {
        this.id = id;
    }
    public String getLoginacct()
    {
        return loginacct;
    }
    public void setLoginacct(String loginacct)
    {
        this.loginacct = loginacct;
    }
    public String getUserpaswd()
    {
        return userpswd;
    }
    public void setUserpaswd(String userpswd)
    {
        this.userpswd = userpswd;
    }
    @Override
    public String toString()
    {
        return "User [id=" + id + ", loginacct=" + loginacct + ", userpswd=" + userpswd + ", username=" + username
                + "]";
    }
    public User()
    {
        super();
        // TODO Auto-generated constructor stub
    }
    
}
