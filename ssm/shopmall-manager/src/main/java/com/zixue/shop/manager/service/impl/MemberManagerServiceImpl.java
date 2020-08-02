package com.zixue.shop.manager.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zixue.shop.bean.Member;
import com.zixue.shop.manager.dao.MemberManagerDao;
import com.zixue.shop.manager.service.MemberManagerService;
@Service
public class MemberManagerServiceImpl implements MemberManagerService
{
    @Autowired
    private MemberManagerDao managerDao;
    public List<Member> queryPageData(Map<String, Object> paramMap)
    {
        // TODO Auto-generated method stub
        return managerDao.queryPageData(paramMap);
    }
    public int queryPageCount(Map<String, Object> paramMap)
    {
        // TODO Auto-generated method stub
        return managerDao.queryPageCount(paramMap);
    }
    
}
