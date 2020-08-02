package com.zixue.shop.manager.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zixue.shop.bean.Datas;
import com.zixue.shop.bean.GoodsCategory;
import com.zixue.shop.manager.dao.GoodsCategoryDao;
import com.zixue.shop.manager.service.GoodsCategoryService;

@Service
public class GoodsCategoryServiceImp implements GoodsCategoryService
{
    @Autowired
    private GoodsCategoryDao goodsCategoryDao;
    
    public List<GoodsCategory> queryPageData(Map<String, Object> paramMap)
    {
       
        return  goodsCategoryDao.queryPageData( paramMap);
    }
    public int queryPageCount(Map<String, Object> paramMap)
    {
       
        return  goodsCategoryDao.queryPageCount( paramMap);
    }
    public int insertGood(GoodsCategory goodsCategory)
    {
        
        return goodsCategoryDao.insertGood(goodsCategory);
    }
    public GoodsCategory queryById(Integer id)
    {
       
        return goodsCategoryDao.queryById(id);
    }
    public int updateGood(GoodsCategory goodsCategory)
    {
        
        return goodsCategoryDao.updateGood(goodsCategory);
    }
    public int deleteGoodById(GoodsCategory goodsCategory)
    {
        
        return goodsCategoryDao.deleteGoodById(goodsCategory);
    }
    public int deleteGoodsById( Datas ds){
        return goodsCategoryDao.deleteGoodsById( ds);
    }
    public List<GoodsCategory> queryAll()
    {
        
        return goodsCategoryDao.queryAll();
    }
}
