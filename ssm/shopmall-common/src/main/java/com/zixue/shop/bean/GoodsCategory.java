package com.zixue.shop.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * 分类
 * @author 一只会飞的小猴子
 *
 */
public class GoodsCategory
{
    private Integer id; //商品id
    private String name; //商品名字
    private String remark; //商品描述
    private Integer orderid;  //商品排序号
    private String createTime;
    private String updateTime;
    private List<Goods> goodsDatas = new ArrayList<Goods>();
   
    public List<Goods> getGoodsDatas()
    {
        return goodsDatas;
    }
    public void setGoodsDatas(List<Goods> goodsDatas)
    {
        this.goodsDatas = goodsDatas;
    }
    public String getUpdateTime()
    {
        return updateTime;
    }
    public void setUpdateTime(String updateTime)
    {
        this.updateTime = updateTime;
    }
    public String getCreateTime()
    {
        return createTime;
    }
    public void setCreateTime(String createTime)
    {
        this.createTime = createTime;
    }
    public Integer getId()
    {
        return id;
    }
    public void setId(Integer id)
    {
        this.id = id;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public String getRemark()
    {
        return remark;
    }
    public void setRemark(String remark)
    {
        this.remark = remark;
    }
    public Integer getOrderid()
    {
        return orderid;
    }
    public void setOrderid(Integer orderid)
    {
        this.orderid = orderid;
    }
   
}
