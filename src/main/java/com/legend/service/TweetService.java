package com.legend.service;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.legend.dao.TweetDao;
import com.legend.model.Tweet;

@Service
public class TweetService {

	@Resource(name = "tweetDao")
	private TweetDao tweetDao;
	
	public Tweet persistTweet(Tweet tweet) {
		tweet.setDate(new Date());
		return tweetDao.persistTweet(tweet);
	}

	public List<Object[]> getUserTweets(String username, int tweetFeedOffset) {
		return tweetDao.getUserTweets(username, tweetFeedOffset);
	}
}
