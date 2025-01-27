package com.zixue.shop.bean;

import org.springframework.web.multipart.MultipartFile;

/**
 * 商品
 * @author 一只会飞的小猴子
 *
 */
public class Goods {

	private Integer id           ;
	private String name         ;
	private String num          ;
	private Integer memberid     ;
	private String createtime   ;
	private String status       ;
	private Integer stock        ;
	private Integer price        ;
	private String iconpath     ;
	private String iconpath1    ;
	private Integer cost         ;
	private Integer limitstock   ;
	private String hot          ;
	private String newgoods     ;
	private String best         ;
	private String priceunit    ;
	private Integer categoryid   ;
	private String remark       ;
	private MultipartFile goodsHeadImg;
	private MultipartFile goodsDetailImg;
	

	private GoodsInfo goodsInfo;
	private SellerInfo sellerInfo;
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
    public String getNum()
    {
        return num;
    }
    public void setNum(String num)
    {
        this.num = num;
    }
    public Integer getMemberid()
    {
        return memberid;
    }
    public void setMemberid(Integer memberid)
    {
        this.memberid = memberid;
    }
    public String getCreatetime()
    {
        return createtime;
    }
    public void setCreatetime(String createtime)
    {
        this.createtime = createtime;
    }
    public String getStatus()
    {
        return status;
    }
    public void setStatus(String status)
    {
        this.status = status;
    }
    public Integer getStock()
    {
        return stock;
    }
    public void setStock(Integer stock)
    {
        this.stock = stock;
    }
    public Integer getPrice()
    {
        return price;
    }
    public void setPrice(Integer price)
    {
        this.price = price;
    }
    public String getIconpath()
    {
        return iconpath;
    }
    public void setIconpath(String iconpath)
    {
        this.iconpath = iconpath;
    }
    public String getIconpath1()
    {
        return iconpath1;
    }
    public void setIconpath1(String iconpath1)
    {
        this.iconpath1 = iconpath1;
    }
    public Integer getCost()
    {
        return cost;
    }
    public void setCost(Integer cost)
    {
        this.cost = cost;
    }
    public Integer getLimitstock()
    {
        return limitstock;
    }
    public void setLimitstock(Integer limitstock)
    {
        this.limitstock = limitstock;
    }
    public String getHot()
    {
        return hot;
    }
    public void setHot(String hot)
    {
        this.hot = hot;
    }
    public String getNewgoods()
    {
        return newgoods;
    }
    public void setNewgoods(String newgoods)
    {
        this.newgoods = newgoods;
    }
    public String getBest()
    {
        return best;
    }
    public void setBest(String best)
    {
        this.best = best;
    }
    public String getPriceunit()
    {
        return priceunit;
    }
    public void setPriceunit(String priceunit)
    {
        this.priceunit = priceunit;
    }
    public Integer getCategoryid()
    {
        return categoryid;
    }
    public void setCategoryid(Integer categoryid)
    {
        this.categoryid = categoryid;
    }
    public String getRemark()
    {
        return remark;
    }
    public void setRemark(String remark)
    {
        this.remark = remark;
    }
    public MultipartFile getGoodsHeadImg()
    {
        return goodsHeadImg;
    }
    public void setGoodsHeadImg(MultipartFile goodsHeadImg)
    {
        this.goodsHeadImg = goodsHeadImg;
    }
    public MultipartFile getGoodsDetailImg()
    {
        return goodsDetailImg;
    }
    public void setGoodsDetailImg(MultipartFile goodsDetailImg)
    {
        this.goodsDetailImg = goodsDetailImg;
    }
    public GoodsInfo getGoodsInfo()
    {
        return goodsInfo;
    }
    public void setGoodsInfo(GoodsInfo goodsInfo)
    {
        this.goodsInfo = goodsInfo;
    }
    public SellerInfo getSellerInfo()
    {
        return sellerInfo;
    }
    public void setSellerInfo(SellerInfo sellerInfo)
    {
        this.sellerInfo = sellerInfo;
    }
    @Override
    public String toString()
    {
        return "Goods [id=" + id + ", name=" + name + ", num=" + num + ", memberid=" + memberid + ", createtime="
                + createtime + ", status=" + status + ", stock=" + stock + ", price=" + price + ", iconpath="
                + iconpath + ", iconpath1=" + iconpath1 + ", cost=" + cost + ", limitstock=" + limitstock + ", hot="
                + hot + ", newgoods=" + newgoods + ", best=" + best + ", priceunit=" + priceunit + ", categoryid="
                + categoryid + ", remark=" + remark + ", goodsHeadImg=" + goodsHeadImg + ", goodsDetailImg="
                + goodsDetailImg + ", goodsInfo=" + goodsInfo + ", sellerInfo=" + sellerInfo + "]";
    }
	

	
}
