package com.zixue.shop.manager.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zixue.shop.bean.AJAXResult;
import com.zixue.shop.bean.Member;
import com.zixue.shop.bean.User;
import com.zixue.shop.controller.BaseController;
import com.zixue.shop.manager.service.UserService;
import com.zixue.shop.util.MD5Util;
/**
 * 后台管理员
 * @author 一只会飞的小猴子
 *
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController
{
    private Logger      logger = Logger.getLogger(UserController.class);
    
    @Autowired
    private UserService userService;
    
   
    /**
     * AJAX请求登录
     * @param user
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/doAJAXLogin")
    public Object doAJAXLogin(String loginacct, String userpaswd, HttpSession session)
    {
        start();
        //提供错误码
        /*
         * 1 正确
         * -1 账户不存在
         * -2 密码错误
         * -3 权限不对
         */
        
        int error_no = 0;
        String error_info = "";
        try
        {
         User dbUser   = userService.queryLoginUserByLoginacct(loginacct);
            System.out.println(dbUser.toString());
            if ( loginacct == null )
            {
                error_no = -1;
                error_info="账户不存在，请重新输入或点击注册";
                fail();
            }
            else
            {
                String dbUserpswd = dbUser.getUserpaswd();
                //拿到登录密码进行md5加密
                String digest = MD5Util.digest(userpaswd);
                System.out.println("--------------"+digest);
                System.out.println("--------------"+dbUserpswd);
                if ( digest.equals(dbUserpswd) )
                {
                    error_no = 1;
                    error_info="登录成功";
                    success();
                    session.setAttribute("loginUser", dbUser);
                }
                else
                {
                    error_info="密码错误！请重新输入";
                    error_no = -2;
                    fail();
                }
                
            }
        }
        catch (Exception e)
        {
            error_info="系统出现异常，请联系管理员！";
            error_no = -3;
            fail();
            e.printStackTrace();
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("error_no", error_no);
        map.put("error_info", error_info);
        map.put("loginacct", loginacct);
        setMap(map);
        return end();
        
    }
}
