package com.zixue.shop.manager.dao;

import java.util.List;

import com.zixue.shop.bean.Tag;


public interface TagDao {

	List<Tag> queryRootTags();

	List<Tag> queryChildTagsByPid(Integer id);

	List<Tag> queryAll();

}
