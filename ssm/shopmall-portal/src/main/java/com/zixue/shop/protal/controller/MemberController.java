package com.zixue.shop.protal.controller;

import java.awt.Menu;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.zixue.shop.bean.Goods;
import com.zixue.shop.bean.GoodsCategory;
import com.zixue.shop.bean.Member;
import com.zixue.shop.bean.SellerInfo;
import com.zixue.shop.bean.Tag;
import com.zixue.shop.controller.BaseController;
import com.zixue.shop.manager.service.GoodsCategoryService;
import com.zixue.shop.manager.service.TagService;
import com.zixue.shop.protal.service.MemberService;
import com.zixue.shop.util.DateUtil;
import com.zixue.shop.util.MD5Util;

/**
 * 会员登录
 * @author 一只会飞的小猴子
 *
 */
@Controller
@RequestMapping("/member")
public class MemberController extends BaseController
{
    private Logger        logger = Logger.getLogger(MemberController.class);
    
    @Autowired
    private MemberService memberService;
    @Autowired
    private GoodsCategoryService goodsCategoryService;
    @Autowired
    private TagService tagService;
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
         * -4 账户锁定
         * -5 登录失败，更新状态失败
         */
        
        int error_no = 0;
        String error_info = "";
        try
        {
            Member queryLoginMemberByLoginacct = memberService.queryLoginMemberByLoginacct(loginacct);
            
            if ( queryLoginMemberByLoginacct == null )
            {
                error_no = -1;
                error_info="账户不存在，请重新输入或点击注册";
                fail();
            }
            else
            {
                //判断账户锁定状态
                Integer id = queryLoginMemberByLoginacct.getId();
                Integer loginnum = queryLoginMemberByLoginacct.getLoginnum(); //登录次数 
                String lockstatus = queryLoginMemberByLoginacct.getLockstatus();//锁定状态 0未锁 1锁定
                String loginstatus = queryLoginMemberByLoginacct.getLoginstatus();//登录状态  0 未登录  1登录
                if("1".equals(lockstatus)){
                    error_info="账户已被锁定，请联系管理员！";
                    error_no = -4;
                    fail();
                    
                }else {
                    
                   
                    String dbMemberpswd = queryLoginMemberByLoginacct.getMemberpswd();
                    //拿到登录密码进行md5加密
                    String digest = MD5Util.digest(userpaswd);
                    if ( digest.equals(dbMemberpswd) )
                    {
                        
                        Member member = new Member();
                        member.setId(id);
                        member.setLoginnum(loginnum+1);
                        member.setLoginstatus("1");
                        member.setLastvisittime(DateUtil.dateToString(new Date()));
                        //修改状态
                        int member2 = memberService.updateMember(member);
                        if ( member2>0 )
                        {
                            error_no = 1;
                            error_info="登录成功";
                            success();
                            session.setAttribute("loginMember", memberService.queryLoginMemberByLoginacct(loginacct));
                        }else {
                            error_no = -5;
                            error_info="登录失败，请联系管理员";
                        }
                    }
                    else
                    {
                        error_info="密码错误！请重新输入";
                        error_no = -2;
                        fail();
                    }
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
    /**
     * 跳转我的商铺
     * @return
     */
    @RequestMapping("/myShop")
    public String myShop()
    {
        return "member/myShop";
    }
    /**
     * 跳转我的购物车
     * @return
     */
    @RequestMapping("/myCart")
    public String myCart()
    {
        return "member/myCart";
    }
    /**
     * 跳转我的订单
     * @return
     */
    @RequestMapping("/myOrder")
    public String myOrder()
    {
        return "member/myOrder";
    }
    /**
     * 跳转商品发布
     */
    @RequestMapping("/addGoods")
    public String addGoods(Model model){
        //查询所有
        List<GoodsCategory> queryAll = goodsCategoryService.queryAll();
       
        
        Tag rootTag= null;
        List<Tag> allTags = tagService.queryAll();
        Map<Integer, Tag> tagMap = new HashMap<Integer, Tag>();
        for ( Tag tag : allTags ) {
            tagMap.put(tag.getId(), tag);
        }
        for ( Tag tag : allTags ) {
            // 子标签
            Tag child = tag;
            if ( child.getPid() == 0 ) {
                rootTag=tag;
            } else {
                // 父标签
                Tag parent = tagMap.get(child.getPid());
                // 组合父子标签的关系
                parent.getChildren().add(child);
            }
        }
        model.addAttribute("goods",queryAll );
        model.addAttribute("rootTag",rootTag );
        return "member/addGoods";
    }
    /**
     * AJAX请求注册
     * @param user
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping("/reg")
    public Object reg(String loginacct, String userpaswd,String email,String nickname, HttpSession session)
    {
        start();
        //提供错误码
        /*
         * 1 正确
         * -1 账户存在
         * -2 邮箱存在
         * -3 异常
         * -4 昵称存在
         */
        Member member = new Member();
        int error_no = 0;
        String error_info = "";
        try
        {
            Member queryLoginMemberByLoginacct = memberService.queryLoginMemberByLoginacct(loginacct);
            Member queryLoginMemberByEmail = memberService.queryLoginMemberByEmail(email);
            Member member1 = new Member();
            member1.setNickname(nickname);
            Member queryLoginMemberByNickname = memberService.queryLoginMember(member1);
            if ( queryLoginMemberByLoginacct != null )
            {
                error_no = -1;
                error_info="该账户存在，请重新输入";
                fail();
            }else if(queryLoginMemberByEmail!=null) {
                error_no = -2;
                error_info="该邮箱存在，请重新输入";
                fail();
            }else if(queryLoginMemberByNickname!=null) {
                error_no = -4;
                error_info="该昵称存在，请重新输入";
                fail();
            }
            else
            {
                //开始注册
                String regtime = DateUtil.dateToString(new Date());
                member.setRegtime(regtime);
                member.setEmail(email);
                member.setLoginacct(loginacct);
                member.setMemberpswd( MD5Util.digest(userpaswd));
                member.setNickname(nickname);
                int insertMember = memberService.insertMember(member);
                if (insertMember>0  )
                {
                    error_no = 1;
                    error_info="注册成功";
                    success();
                    //注册成功之后将信息保存到session中便于跳转登录页面回显
                    //先清楚之前的session值
                    session.removeAttribute("loginMember");
                    session.setAttribute("loginMember", memberService.queryLoginMemberByLoginacct(loginacct));
                }
                else
                {
                    error_info="注册失败，请联系管理员或稍后再试！";
                    error_no = -3;
                    fail();
                }
                
            }
        }
        catch (Exception e)
        {
            error_info="注册失败，请联系管理员或稍后再试！";
            error_no = -3;
            fail();
            e.printStackTrace();
        }
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("error_no", error_no);
        map.put("error_info", error_info);
        setMap(map);
        return end();
        
    }
    
    
    /**
     * 添加商品  测试文件上传
     */
    @RequestMapping("/insertGoods1")
    public String insertGoods1(HttpServletRequest req)
    {
        MultipartHttpServletRequest request 
                                = (MultipartHttpServletRequest) req;
        MultipartFile goodsHeadImg = request.getFile("goodsHeadImg");
        MultipartFile goodsDetailImg = request.getFile("goodsDetailImg");
        
        String name = goodsHeadImg.getName();//表单文件域名称
        String originalFilename = goodsHeadImg.getOriginalFilename();//真实文件名称
        System.out.println(name+"||"+originalFilename);
        //获取当前web应用的目录路径
        ServletContext application = request.getSession().getServletContext();
        String imgSavePath = application.getRealPath("img/goods");
        if (! new File(imgSavePath).exists() )
        {
            new File(imgSavePath).mkdirs();
        }
        
        
        try
        {
            String targetFileNameHeadImg  =  UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));
            File targetFileHeadImg =new File(imgSavePath+File.separator+targetFileNameHeadImg);
            String dbFilleName = imgSavePath+File.separator+targetFileNameHeadImg; 
            goodsHeadImg.transferTo(targetFileHeadImg);
            
            String targetFileNameDetailImg  =  UUID.randomUUID().toString()+originalFilename.substring(originalFilename.lastIndexOf("."));
            File targetFileDetailImg =new File(imgSavePath+File.separator+targetFileNameDetailImg);
            String dbFilleNameDetailImg = imgSavePath+File.separator+targetFileNameDetailImg; 
            goodsDetailImg.transferTo(targetFileDetailImg);
        }
        catch (IllegalStateException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
       
        
        return "member/myShop";
    }
    
    /**
     * 添加商品  
     */
    @RequestMapping("/insertGoods")
    public String insertGoods(Goods goods,SellerInfo sellerInfo,
            int[] tags,HttpSession session,String siremark)
    {
        
        //获取卖家信息 (商家)
        Member loginMember = (Member) session.getAttribute("loginMember");
        goods.setMemberid(loginMember.getId());
        goods.setCreatetime(DateUtil.dateToString(new Date()));
        sellerInfo.setMemberid(loginMember.getId());
        sellerInfo.setRemark(siremark);
       //保存上传图片
        MultipartFile goodsHeadImg = goods.getGoodsHeadImg();
        MultipartFile goodsDetailImg = goods.getGoodsDetailImg();
        
        //获取当前web应用的目录路径
        ServletContext application = session.getServletContext();
        String imgSavePath = application.getRealPath("img/goods");
        if (! new File(imgSavePath).exists() )
        {
            new File(imgSavePath).mkdirs();
        }
        //保存方法
        String dbDetailFilePath = saveFile(imgSavePath, goodsDetailImg);
        String dbHeadFilePath = saveFile(imgSavePath, goodsHeadImg);
        goods.setIconpath(dbHeadFilePath);
        goods.setIconpath1(dbDetailFilePath);
        memberService.insertGoods(goods,sellerInfo,tags);
        
        
        
        
        return "member/myShop";
    }
    
    
    /**
     * 
     * @param savePath 
     * @param fileName 
     * @return
     */
    /**
     * 文件上传保存方法
     * @param savePath 文件服务器目录地址
     * @param file 上传文件
     * @return  数据库保存的文件路径
     */
    public static String saveFile(String savePath,MultipartFile file)
    {
        String fileName = file.getOriginalFilename();
        String uuid =  UUID.randomUUID().toString();
        String suffix = fileName.substring(fileName.lastIndexOf("."));//获取后缀
        String targetFileName = uuid +suffix;//重新命名
        File targetFile =new File(savePath+File.separator+targetFileName);//目标文件
        try
        {
            file.transferTo(targetFile);
        }
        catch (IllegalStateException e)
        {
            e.printStackTrace();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }//框架整合上传方法
        String dbFilleName = savePath+File.separator+targetFileName;  //数据库保存路径
        
        return dbFilleName;
    }
}
