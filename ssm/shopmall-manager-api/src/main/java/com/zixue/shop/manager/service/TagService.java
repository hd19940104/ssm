package com.zixue.shop.manager.service;

import java.util.List;

import com.zixue.shop.bean.Tag;



public interface TagService {

	List<Tag> queryRootTags();

	List<Tag> queryChildTagsByPid(Integer id);

	List<Tag> queryAll();

}
