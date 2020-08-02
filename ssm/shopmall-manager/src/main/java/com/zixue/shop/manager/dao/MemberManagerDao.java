package com.zixue.shop.manager.dao;

import java.util.List;
import java.util.Map;



import com.zixue.shop.bean.Member;

/**
 * 会员管理
 * @author 一只会飞的小猴子
 *
 */

public interface MemberManagerDao
{
    public List<Member> queryPageData(Map<String, Object> paramMap);
    public int queryPageCount(Map<String, Object> paramMap);
}
