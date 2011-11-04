package com.fyp.qrmedia;

import java.util.ArrayList;
import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.users.User;

@PersistenceCapable
public class FileInfo {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long Id;
	
	@Persistent
	private String category;
	
	@Persistent
	private String blobKey;
	
	@Persistent
	private User author;
	
	@Persistent
	private Date date;
	
	@Persistent
	private Long fileSize;
	
	@Persistent
	private String fileName;
	
	@Persistent
	private String fileDescription;
	
	@Persistent
	private String fileType;
	
	@Persistent
	private long viewCount;
	
	@Persistent
	private long ratingCount;
	
	@Persistent
	private float rating;
	
	@Persistent
	private long commentCount;
	
	@Persistent
	private ArrayList<String> comments;
	
	@Persistent
	private String url;
	
	public FileInfo(String category, String blobKey, User author, Date date, Long fileSize, String fileName, String fileDescription, String fileType, String url) {
		this.blobKey = blobKey;
		this.author = author;
		this.date = date;
		this.fileSize = fileSize;
		this.fileName = fileName;
		this.fileDescription = fileDescription;
		this.fileType = fileType;
		this.viewCount = 0;
		this.ratingCount = 0;
		this.rating = 0;
		this.commentCount = 0;
		this.comments = new ArrayList<String>();
		this.url = url;
		this.category =category;
	}
	
	public String encode() {
		String response = "<?xml version='1.0'?>";
		response +="<fileinfo>";
		response += "<category>" + getCategory() + "</category>";
		response += "<filename>" + getFileName() + "</filename>";
		response += "<author>" + getAuthor().getEmail() + "</author>";
		response += "<date>" + getDate().toString() + "</date>";
		response += "<filesize>" + Long.toString(getFileSize()) + "</filesize>";
		response += "<filedescription>" + getFileDescription() + "</filedescription>";
		response += "<filetype>" + getFileType() + "</filetype>";
		response += "<viewcount>" + Long.toString(getViewCount()) + "</viewcount>";
		response += "<rating>" + Float.toHexString(getRating()) + "</rating>";
		response += "<ratingcount>" + Long.toString(getRatingCount()) + "</ratingcount>";
		response += "<commentcount>" + Long.toString(getCommentCount()) + "</commentcount>";
		response += "<url>" + getUrl() + "</url>";
		response += "<blobkey>" + getBlobKey() + "</blobkey>";
		response +="</fileinfo>";
		return response;
	}
	
	public Long getId() {
		return Id;
	}
	
	public String getCategory() {
		return category;
	}
	
	public String getBlobKey() {
		return blobKey;
	}
	
	public User getAuthor() {
		return author;
	}
	
	public Date getDate() {
		return date;
	}
	
	public Long getFileSize() {
		return fileSize;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public String getFileDescription() {
		return fileDescription;
	}
	
	public String getFileType() {
		return fileType;
	}
	
	public long getViewCount() {
		return viewCount;
	}
	
	public long getRatingCount() {
		return ratingCount;
	}
	
	public float getRating() {
		return rating;
	}
	
	public long getCommentCount() {
		return commentCount;
	}
	
	public ArrayList<String> getComments() {
		return comments;
	}
	
	public String getUrl() {
		return url;
	}
	
	public void setCategroy(String category) {
		this.category = category;
	}
	
	public void setBlobKey(String blobKey) {
		this.blobKey = blobKey;
	}
	
	public void setAuthor(User author) {
		this.author = author;
	}
	
	public void setDate(Date date) {
		this.date = date;
	}
	
	public void setFileSize(Long fileSize) {
		this.fileSize = fileSize;
	}
	
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public void setFileDescription(String fileDescription) {
		this.fileDescription = fileDescription;
	}
	
	public void setViewCount(long viewCount) {
		this.viewCount = viewCount;
	}
	/*
	public void setRatingCount() {
		this.ratingCount++;
	}
	*/
	public void setRating(float rating) {
		this.rating = this.rating*this.ratingCount + rating;
		this.ratingCount++;
		this.rating = this.rating/this.ratingCount;
	}
	
	public void setComments(String comment) {
		this.comments.add(comment);
		this.commentCount++;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
}
