package com.zixue.shop.manager.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zixue.shop.bean.AJAXResult;
import com.zixue.shop.bean.Datas;
import com.zixue.shop.bean.GoodsCategory;
import com.zixue.shop.bean.Page;
import com.zixue.shop.controller.BaseController;
import com.zixue.shop.manager.service.GoodsCategoryService;
import com.zixue.shop.util.DateUtil;

/**
 * 商品分类控制器
 * @author 一只会飞的小猴子
 *
 */
@Controller
@RequestMapping("/goodsCategory")
public class GoodsCategoryController extends BaseController
{
    
    private Logger               logger = Logger.getLogger(GoodsCategoryController.class);
    
    @Autowired
    private GoodsCategoryService goodsCategoryService;
    
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
            Page<GoodsCategory> page = new Page<GoodsCategory>();
            paramMap.put("start", (pageno - 1) * pagesize);
            paramMap.put("size", pagesize);
            paramMap.put("queryText", queryText);
            System.out.println(paramMap);
            logger.info("paramMap:" + paramMap);
            //查询
            List<GoodsCategory> goodsCategorys = goodsCategoryService.queryPageData(paramMap);
            
            //计算总条数
            int totalsize = goodsCategoryService.queryPageCount(paramMap);
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
            page.setDatas(goodsCategorys);
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
    
    /**
     * 跳转商品分类列表(分页查询)
     * @return
     */
    @RequestMapping("index1")
    public String index1(@RequestParam(defaultValue = "1", required = false)
    Integer pageno, @RequestParam(required = false, defaultValue = "10")
    Integer pagesize, Model model)
    {
        
        //分页查询
        Map<String, Object> paramMap = new HashMap<String, Object>();
        paramMap.put("start", (pageno - 1) * pagesize);
        paramMap.put("size", pagesize);
        
        //查询
        List<GoodsCategory> goodsCategorys = goodsCategoryService.queryPageData(paramMap);
        
        //计算总条数
        int totalsize = goodsCategoryService.queryPageCount(paramMap);
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
        //保存结果
        model.addAttribute("gcs", goodsCategorys);
        model.addAttribute("pageno", pageno);
        model.addAttribute("totalno", totalno);
        return "goodsCategory/index";
    }
    
    /**
     * 退出
     * @return
     */
    @RequestMapping("/logout")
    public String logout(HttpSession session)
    {
        //        session.removeAttribute("userLogin");
        session.invalidate();//清楚session中的信息
        return "redirect:/login";
    }
    
    /**
     * 跳转主页面
     * @return
     */
    @RequestMapping("index")
    public String index()
    {
        
        return "goodsCategory/index";
    }
    
    /**
     * 跳转新增页面
     * @return
     */
    @RequestMapping("add")
    public String add()
    {
        
        return "goodsCategory/add";
    }
    
    /**
     * 添加商品信息
     * @param goodsCategory
     * @return
     */
    @RequestMapping("insertGood")
    @ResponseBody
    public Object insertGood(GoodsCategory goodsCategory)
    {
        start();
        //添加数据
        goodsCategory.setCreateTime(DateUtil.dateToString(new Date()));
        goodsCategory.setUpdateTime(DateUtil.dateToString(new Date()));
        int insertGood = goodsCategoryService.insertGood(goodsCategory);
        if ( insertGood > 0 )
        {
            success(true);
        }
        else
        {
            success(false);
        }
        
        return end();
    }
    
    /**
     * 跳转修改页面
     * @return
     */
    @RequestMapping("edit")
    public String edit(Integer id, Model model)
    {
        GoodsCategory goodsCategory = goodsCategoryService.queryById(id);
        model.addAttribute("goodsCategory", goodsCategory);
        return "goodsCategory/edit";
    }
    
    /**
     * 修改商品信息
     * @param goodsCategory
     * @return
     */
    @RequestMapping("updateGood")
    @ResponseBody
    public Object updateGood(GoodsCategory goodsCategory)
    {
        start();
        //修改数据
        
        goodsCategory.setUpdateTime(DateUtil.dateToString(new Date()));
        int updateGood = goodsCategoryService.updateGood(goodsCategory);
        if ( updateGood > 0 )
        {
            success(true);
        }
        else
        {
            success(false);
        }
        
        return end();
    }
    
    /**
     * 根据id删除商品
     * @param goodsCategory
     * @return
     */
    @RequestMapping("deleteGoodById")
    @ResponseBody
    public Object deleteGoodById(GoodsCategory goodsCategory)
    {
        start();
        //修改数据
        
        int deleteGoodById = goodsCategoryService.deleteGoodById(goodsCategory);
        if ( deleteGoodById > 0 )
        {
            success(true);
        }
        else
        {
            success(false);
        }
        
        return end();
    }
    
    /**
     * 根据id 批量删除商品
     * @param goodsCategory
     * @return
     */
    @RequestMapping("deleteGoodsById")
    @ResponseBody
    public Object deleteGoodsById(Datas ds)
    {
        start();
        
        int deleteGoodsById = goodsCategoryService.deleteGoodsById(ds);
        if ( deleteGoodsById == ds.getGcs().size() )
        {
            success(true);
        }
        else
        {
            success(false);
        }
        
        return end();
    }
}
