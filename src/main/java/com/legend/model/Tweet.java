package com.legend.model;

import java.math.BigDecimal;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class Tweet {

	@Id
	@GeneratedValue
	private BigDecimal tweetId;
	@Column(nullable = false)
	private String username;
	@Column(nullable = false)
	private String tweetContent;
	private String parentTweet;
	@Column(nullable = false)
	private Date date;
	
	public Tweet() {
		super();
	}
	public BigDecimal getTweetId() {
		return tweetId;
	}
	public void setTweetId(BigDecimal tweetId) {
		this.tweetId = tweetId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getTweetContent() {
		return tweetContent;
	}
	public void setTweetContent(String tweetContent) {
		this.tweetContent = tweetContent;
	}
	public String getParentTweet() {
		return parentTweet;
	}
	public void setParentTweet(String parentTweet) {
		this.parentTweet = parentTweet;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Tweet [tweetId=" + tweetId + ", username=" + username + ", tweetContent=" + tweetContent
				+ ", parentTweet=" + parentTweet + ", date=" + date + "]";
	}
}
