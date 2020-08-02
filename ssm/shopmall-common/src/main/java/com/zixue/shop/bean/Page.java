package com.zixue.shop.bean;

import java.util.List;

/**
 * 分页对象
 * @author 一只会飞的小猴子
 *
 */
public class Page<T>
{
    private List<T> datas; //对象集合
    private int totalsize;//总条数
    private int totalno;//总页码
    private int pageno;//页码
    private int pagesize;//每页条数
   
    public List<T> getDatas()
    {
        return datas;
    }
    public void setDatas(List<T> datas)
    {
        this.datas = datas;
    }
    public int getTotalsize()
    {
        return totalsize;
    }
    public void setTotalsize(int totalsize)
    {
        this.totalsize = totalsize;
    }
    public int getTotalno()
    {
        return totalno;
    }
    public void setTotalno(int totalno)
    {
        this.totalno = totalno;
    }
    public int getPageno()
    {
        return pageno;
    }
    public void setPageno(int pageno)
    {
        this.pageno = pageno;
    }
    public int getPagesize()
    {
        return pagesize;
    }
    public void setPagesize(int pagesize)
    {
        this.pagesize = pagesize;
    }
    
}
