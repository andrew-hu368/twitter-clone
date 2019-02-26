package com.legend.dao;

import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;

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
}
