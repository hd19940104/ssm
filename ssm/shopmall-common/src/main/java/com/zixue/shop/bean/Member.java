package com.zixue.shop.bean;

/**
 * 会员表--
 * @author 一只会飞的小猴子
 *
 */
public class Member
{
    private Integer    id;
    
    private String loginacct; //会员账号
    
    private String memberpswd;//密码
    
    private String nickname;//昵称
    
    private String avatar;//图像
    
    private String loginstatus;//登录状态
    
    private String authstatus;//实名制认证状态
    
    private String sellerstatus;//商家认证
    
    private String lockstatus;//账号状态
    
    private String regtime;//注册时间
    
    private String lastvisittime;//最近登录时间
    private String email;//邮箱
    private Integer loginnum;//登录次数
    

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public Integer getLoginnum()
    {
        return loginnum;
    }

    public void setLoginnum(Integer loginnum)
    {
        this.loginnum = loginnum;
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

    public String getMemberpswd()
    {
        return memberpswd;
    }

    public void setMemberpswd(String memberpswd)
    {
        this.memberpswd = memberpswd;
    }

    public String getNickname()
    {
        return nickname;
    }

    public void setNickname(String nickname)
    {
        this.nickname = nickname;
    }

    public String getAvatar()
    {
        return avatar;
    }

    public void setAvatar(String avatar)
    {
        this.avatar = avatar;
    }

    public String getLoginstatus()
    {
        return loginstatus;
    }

    public void setLoginstatus(String loginstatus)
    {
        this.loginstatus = loginstatus;
    }

    public String getAuthstatus()
    {
        return authstatus;
    }

    public void setAuthstatus(String authstatus)
    {
        this.authstatus = authstatus;
    }

    public String getSellerstatus()
    {
        return sellerstatus;
    }

    public void setSellerstatus(String sellerstatus)
    {
        this.sellerstatus = sellerstatus;
    }

    public String getLockstatus()
    {
        return lockstatus;
    }

    public void setLockstatus(String lockstatus)
    {
        this.lockstatus = lockstatus;
    }

    public String getRegtime()
    {
        return regtime;
    }

    public void setRegtime(String regtime)
    {
        this.regtime = regtime;
    }

    public String getLastvisittime()
    {
        return lastvisittime;
    }

    public void setLastvisittime(String lastvisittime)
    {
        this.lastvisittime = lastvisittime;
    }
    
}
