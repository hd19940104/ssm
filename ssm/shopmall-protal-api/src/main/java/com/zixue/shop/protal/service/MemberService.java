package com.zixue.shop.protal.service;

import com.zixue.shop.bean.Goods;
import com.zixue.shop.bean.Member;
import com.zixue.shop.bean.SellerInfo;

public interface MemberService
{
    public Member queryLoginMemberByLoginacct( String loginacct);
    public Member queryLoginMemberByEmail( String email);
    public Member queryLoginMember( Member member);
    public int insertMember(Member member);
    public int updateMember(Member member);
    public void insertGoods(Goods goods, SellerInfo sellerInfo, int[] tags);
}
