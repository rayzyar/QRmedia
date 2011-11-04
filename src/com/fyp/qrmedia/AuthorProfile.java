package com.fyp.qrmedia;

import java.util.ArrayList;
import java.util.Date;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class AuthorProfile {
	@PrimaryKey
	@Persistent
	private String userId;
	
	@Persistent
	private String userName;
	
	@Persistent
	private String userDescription;
	
	@Persistent
	private Date dateJoined;
	
	@Persistent
	private long totalViews;
	
	@Persistent
	private long totalUploads;
	
	@Persistent
	private long subscriberNo;
	
	@Persistent
	private ArrayList<String> subscribers;
	
	public AuthorProfile(String userId, String userName, String userDescription) {
		this.userId = userId;
		this.userName = userName;
		this.userDescription = userDescription;
		this.dateJoined = new Date();
		this.totalViews = 0;
		this.totalUploads = 0;
		this.subscriberNo = 0;
		this.subscribers = new ArrayList<String>();
	}
	
	public String getUserId() {
		return userId;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public String getUserDescription() {
		return userDescription;
	}
	
	public Date getDateJoined() {
		return dateJoined;
	}
	
	public long getTotalViews() {
		return totalViews;
	}
	
	public long getTotalUploads() {
		return totalUploads;
	}
	
	public long getSubscriberNo() {
		return subscriberNo;
	}
	
	public ArrayList<String> getSubscribers() {
		return subscribers;
	}
	
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public void setUserDescription(String userDescription) {
		this.userDescription = userDescription;
	}
	
	public void setDateJoined(Date dateJoined) {
		this.dateJoined = dateJoined;
	}
	
	public void increaseTotalViews() {
		totalViews++;
	}
	
	public void increaseUploadNo() {
		totalUploads++;
	}
	
	public void decreaseUploadNo() {
		totalUploads--;
	}
	
	public void increaseSubscriberNo() {
		subscriberNo++;
	}
	
	public void decreaseSubscriberNo() {
		subscriberNo--;
	}
	
	public void addSubscriber(String email) {
		subscribers.add(email);
	}
	
	public void deleteSubscriber(int index) {
		subscribers.remove(index);
	}
}
