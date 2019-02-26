package com.legend.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.legend.model.Tweet;
import com.legend.service.TweetService;

@Controller
public class TweetController {
	@Resource(name = "tweetService")
	private TweetService tweetService;
	
	@RequestMapping(value = "/tweets/", method = RequestMethod.POST)
	@ResponseBody
	public Tweet submitTweet(@RequestBody Tweet tweet) {
		System.out.println();
		return tweetService.persistTweet(tweet);
	}
}
