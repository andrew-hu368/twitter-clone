package com.legend.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.legend.dao.FolloweeDao;
import com.legend.model.Followee;
import com.legend.model.FolloweeId;

@Service
public class FolloweeService {

	@Resource(name = "followeeDao")
	private FolloweeDao followeeDao;
	
	public Followee persistFollowee(Followee followee) {
		return followeeDao.persistFollowee(followee);
	}
	
	public Followee deleteFollowee(FolloweeId followeeId) {
		return followeeDao.deleteFollowee(followeeId);
	}
}
