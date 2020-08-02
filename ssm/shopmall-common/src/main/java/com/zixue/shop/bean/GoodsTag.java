package com.zixue.shop.bean;

/**
 * 商品标签
 * @author 一只会飞的小猴子
 *
 */
public class GoodsTag {
	private Integer id      ;
	private Integer goodsid ;
	private Integer tagid   ;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGoodsid() {
		return goodsid;
	}
	public void setGoodsid(Integer goodsid) {
		this.goodsid = goodsid;
	}
	public Integer getTagid() {
		return tagid;
	}
	public void setTagid(Integer tagid) {
		this.tagid = tagid;
	}
    @Override
    public String toString()
    {
        return "GoodsTag [id=" + id + ", goodsid=" + goodsid + ", tagid=" + tagid + "]";
    }
	
}
