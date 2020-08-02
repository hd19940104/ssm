package com.zixue.shop.protal.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zixue.shop.bean.Goods;
import com.zixue.shop.bean.GoodsInfo;
import com.zixue.shop.bean.GoodsTag;
import com.zixue.shop.bean.Member;
import com.zixue.shop.bean.SellerInfo;
import com.zixue.shop.protal.dao.MemberDao;
import com.zixue.shop.protal.service.MemberService;

@Service
public class MemberServiceImp implements MemberService
{
    @Autowired
    private MemberDao memberDao;
    
    public Member queryLoginMemberByLoginacct(String loginacct)
    {
        // TODO Auto-generated method stub
        return memberDao.queryLoginMemberByLoginacct(loginacct);
    }
    
    public Member queryLoginMemberByEmail(String email)
    {
        // TODO Auto-generated method stub
        return memberDao.queryLoginMemberByEmail(email);
    }
    
    public int insertMember(Member member)
    {
        return memberDao.insertMember(member);
    }
    public int updateMember(Member member){
        return memberDao.updateMember( member);
    }

    public Member queryLoginMember(Member member)
    {
        // TODO Auto-generated method stub
        return memberDao.queryLoginMember(  member);
    }

    public void insertGoods(Goods goods, SellerInfo sellerInfo, int[] tags)
    {
        System.out.println("-----------------"+goods.toString());
        //添加商品
        memberDao.insertGoods(goods);
        //添加卖家信息
        memberDao.insertSellerInfo(sellerInfo);
        //添加标签信息
        List<GoodsTag> goodsTags = new ArrayList<GoodsTag>();
       
        for (int tagid : tags)
        {
            GoodsTag t = new GoodsTag();
            t.setTagid(tagid);
            t.setGoodsid(goods.getId());
            goodsTags.add(t);
        }
        System.out.println("==============="+goodsTags.toString());
        memberDao.insertGoodsTags(goodsTags);
        //添加商品详情
       GoodsInfo goodsInfo = new GoodsInfo();
       goodsInfo.setGoodsid(goods.getId());
       memberDao.insertGoodsInfo(goodsInfo);
        
        
    } 
}
