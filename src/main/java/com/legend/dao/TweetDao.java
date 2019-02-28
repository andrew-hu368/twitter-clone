package com.legend.dao;

import java.util.List;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.legend.model.Tweet;

@Repository
public class TweetDao {
	
	@Resource(name = "emf")
	private EntityManagerFactory emf;
	
	public Tweet persistTweet(Tweet tweet) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		em.persist(tweet);
		et.commit();
		em.close();
		return tweet;
	}

	public List<Object[]> getUserTweets(String username, int tweetFeedOffset) {
		EntityManager em = emf.createEntityManager();
		EntityTransaction et = em.getTransaction();
		et.begin();
		String userTweetFeedSQLQuery = "SELECT t.tweetId, t.parentTweet, t.tweetContent, t.date, t.username "
				+ "FROM Tweet AS t "
				+ "INNER JOIN "
				+ "( "
				+ "SELECT followeeId "
				+ "FROM Followee "
				+ "WHERE username = '" + username + "' "
				+ ") AS f "
				+ "ON f.followeeId = t.username "
				+ "LIMIT 5 OFFSET " + Integer.toString(tweetFeedOffset);
		Query userTweetFeedQuery = em.createNativeQuery(userTweetFeedSQLQuery);
		@SuppressWarnings("unchecked")
		List<Object[]> userTweetFeed = userTweetFeedQuery.getResultList();
		return userTweetFeed;
	}
}
