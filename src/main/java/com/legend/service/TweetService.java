package com.legend.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.legend.dao.TweetDao;
import com.legend.model.Tweet;

@Service
public class TweetService {

	@Resource(name = "tweetDao")
	private TweetDao tweetDao;
	
	public Tweet persistTweet(Tweet tweet) {
		return tweetDao.persistTweet(tweet);
	}
}
