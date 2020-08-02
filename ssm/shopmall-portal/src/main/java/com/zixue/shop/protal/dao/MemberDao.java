package com.zixue.shop.protal.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zixue.shop.bean.Goods;
import com.zixue.shop.bean.GoodsInfo;
import com.zixue.shop.bean.GoodsTag;
import com.zixue.shop.bean.Member;
import com.zixue.shop.bean.SellerInfo;


public interface MemberDao
{
    public Member  queryLoginMemberByLoginacct( String loginacct);
    public Member queryLoginMemberByEmail(String email);
    public Member queryLoginMember( Member member);
    public int insertMember(Member member);
    public int updateMember(Member member);
    public void insertGoods(Goods goods);
    public void insertSellerInfo(SellerInfo sellerInfo);
    public void insertGoodsTags(@Param("gts")List<GoodsTag> goodsTags);
    public void insertGoodsInfo(GoodsInfo goodsInfo);
}
