package com.zixue.shop.manager.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zixue.shop.bean.Member;
import com.zixue.shop.bean.Page;
import com.zixue.shop.controller.BaseController;

import com.zixue.shop.manager.service.MemberManagerService;

/**
 * 会员用户管理
 * @author 一只会飞的小猴子
 *
 */
@Controller
@RequestMapping("/memberManager")
public class MemberManagerController extends BaseController
{
    private Logger               logger = Logger.getLogger(MemberManagerController.class);
    @Autowired
    private MemberManagerService  memberManagerService;
    /**
     * 跳转用户管理首页
     * 
     */
    @RequestMapping("/index")
    public String index()
    {
        return "/memberManager/index";
    }
    
    /**
     * 异步分页查询
     * @param pageno
     * @param pagesize
     * @return
     */
    @ResponseBody
    @RequestMapping("/pageQuery")
    public Object pageQuery(Integer pageno, Integer pagesize, @RequestParam(required = false)
    String queryText)
    {
        start();
        logger.info("开始执行异步分页查询");
        try
        {
            //分页查询
            Map<String, Object> paramMap = new HashMap<String, Object>();
            Page<Member> page = new Page<Member>();
            paramMap.put("start", (pageno - 1) * pagesize);
            paramMap.put("size", pagesize);
            paramMap.put("queryText", queryText);
            System.out.println(paramMap);
            logger.info("paramMap:" + paramMap);
            //查询
            List<Member> members = memberManagerService.queryPageData(paramMap);
            
            //计算总条数
            int totalsize = memberManagerService.queryPageCount(paramMap);
            //总页数
            int totalno = 0;
            if ( totalsize % pagesize == 0 )
            {
                totalno = totalsize / pagesize;
            }
            else
            {
                totalno = totalsize / pagesize + 1;
            }
            //包装数据
            page.setDatas(members);
            page.setPageno(pageno);
            page.setPagesize(pagesize);
            page.setTotalno(totalno);
            page.setTotalsize(totalsize);
            
            setObject(page);
            success();
        }
        catch (Exception e)
        {
            e.printStackTrace();
            fail();
        }
        
        return end();
    }
    
    
}
