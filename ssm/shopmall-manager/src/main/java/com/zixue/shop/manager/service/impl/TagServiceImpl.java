package com.zixue.shop.manager.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zixue.shop.bean.Tag;
import com.zixue.shop.manager.dao.TagDao;
import com.zixue.shop.manager.service.TagService;




@Service
public class TagServiceImpl implements TagService {

	@Autowired
	private TagDao tagDao;

	public List<Tag> queryRootTags() {
		return tagDao.queryRootTags();
	}

	public List<Tag> queryChildTagsByPid(Integer id) {
		return tagDao.queryChildTagsByPid(id);
	}

	public List<Tag> queryAll() {
		return tagDao.queryAll();
	}
}
