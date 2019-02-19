package com.legend.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.legend.dao.FolloweeDao;
import com.legend.model.Followee;

@Service
public class FolloweeService {

	@Resource(name = "followeeDao")
	private FolloweeDao followeeDao;
	
	public void persistFollowee(Followee followee) {
		followeeDao.persistFollowee(followee);
	}
}
