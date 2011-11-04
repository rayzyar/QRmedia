package com.fyp.qrmedia;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class RemoteIP {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private String key;
	
	@Persistent
	private Long unixTime;

	
	public RemoteIP(String ip,Long unixTime){
		this.setKey(ip);
		this.setUnixTime(unixTime);
	}
	
	public Long getUnixTime(){
		return unixTime;
	}
	public void setUnixTime(Long unixTime){
		this.unixTime = unixTime;
	}
	public String getKey(){
		return key;
	}
	public void setKey(String key){
		this.key = key;
	}
}
