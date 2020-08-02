package com.zixue.shop.bean;

import java.util.List;


/**
 * 包装类；用于AJAX提交多选框数据
 * @author 一只会飞的小猴子
 *
 */
public class Datas
{
    private List<Integer> ids;
    private List<GoodsCategory> gcs;

   

    public List<GoodsCategory> getGcs()
    {
        return gcs;
    }

    public void setGcs(List<GoodsCategory> gcs)
    {
        this.gcs = gcs;
    }

    public List<Integer> getIds()
    {
        return ids;
    }

    public void setIds(List<Integer> ids)
    {
        this.ids = ids;
    }

   
    
}
