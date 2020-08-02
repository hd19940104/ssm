package com.zixue.shop.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zixue.shop.bean.Member;
import com.zixue.shop.protal.service.MemberService;

/**
 * 调度控制器：登录页面、主页面、退出
 * @author 一只会飞的小猴子
 *
 */
@Controller
public class DispatcherController
{
    @Autowired
    private MemberService memberService;
    /**
     * 登录页面
     * @return
     */
    @RequestMapping("/")
    public String root(){
        
        return "login";
    }
    /**
     * 登录页面
     * @return
     */
    @RequestMapping("/login")
    public String login(){
        
        return "login";
    }
    /**
     * 管理主页面
     * @return
     */
    @RequestMapping("/main")
    public String main(){
        
        return "main";
    }
    /**
     * 会员主页面
     * @return
     */
    @RequestMapping("/member")
    public String member(){
        
        return "member";
    }
    /**
     * 退出
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        //对于会员退出之后需要修改登录状态
        Member member = (Member) session.getAttribute("loginMember");
        if ( member!=null && !"".equals(member) )
        {
            member.setLoginstatus("0");
            memberService.updateMember(member);
        }
        
        
//        session.removeAttribute("userLogin");
        session.invalidate();//清楚session中的信息
       
        
        
        return "redirect:/login";
    }
    /**
     *注册页面
     * @return
     */
    @RequestMapping("/reg")
    public String reg(){
        
        return "reg";
    } 
    
    
}
