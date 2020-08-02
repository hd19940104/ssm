package com.zixue.shop.manager.service;

import java.util.List;
import java.util.Map;

import com.zixue.shop.bean.Datas;
import com.zixue.shop.bean.GoodsCategory;

public interface GoodsCategoryService
{

    public List<GoodsCategory> queryPageData(Map<String, Object> paramMap);
    public int queryPageCount(Map<String, Object> paramMap);
    public  int insertGood(GoodsCategory goodsCategory);
    public GoodsCategory  queryById(Integer id);
    public  int updateGood(GoodsCategory goodsCategory);
    public  int deleteGoodById(GoodsCategory goodsCategory);
    public int deleteGoodsById( Datas ds);
    public List<GoodsCategory> queryAll();
}
