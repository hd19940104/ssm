package com.zixue.shop.manager.service;

import java.util.List;
import java.util.Map;



import com.zixue.shop.bean.Member;


public interface MemberManagerService
{
    public List<Member> queryPageData(Map<String, Object> paramMap);
    public int queryPageCount(Map<String, Object> paramMap);
}
