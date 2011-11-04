package com.fyp.qrmedia;

import java.io.IOException;
import java.net.URL;

import com.google.gdata.client.youtube.YouTubeService;
import com.google.gdata.data.media.mediarss.MediaCategory;
import com.google.gdata.data.media.mediarss.MediaDescription;
import com.google.gdata.data.media.mediarss.MediaKeywords;
import com.google.gdata.data.media.mediarss.MediaTitle;
import com.google.gdata.data.youtube.FormUploadToken;
import com.google.gdata.data.youtube.VideoEntry;
import com.google.gdata.data.youtube.YouTubeMediaGroup;
import com.google.gdata.data.youtube.YouTubeNamespace;
import com.google.gdata.util.AuthenticationException;
import com.google.gdata.util.ServiceException;




public class YTB {
	public static final	String YOUTUBE_CLIENTID="QRINFOZ";
	public static final String YOUTUBE_DEVELOPERKEY="AI39si7HI3sZ20mBBAkY1v2nKOPuVv3TKBV9Eu1cLDlNDtmypOU6xmIKUygPA5q3WnZTzVyKU1KsY90Bark9Rs_7q9v49VmxZA";	
	public static final String YOUTUBE_USERNAME = "ray.zezhou@gmail.com";
	public static final String YOUTUBE_PASSWORD = "gk3rc8wh";
	private static YouTubeService service;
	public static String token;
	public static String formUrl;

	public static void init() {
		  if (service == null) {
		    service = new YouTubeService(YOUTUBE_CLIENTID, YOUTUBE_DEVELOPERKEY);
		    String username = YOUTUBE_USERNAME;
		    String password = YOUTUBE_PASSWORD;
		    try {
		      service.setUserCredentials(username, password);
		    } catch (AuthenticationException ae) {
		      ae.printStackTrace();
		    }
		  }
	}
	public static void setFormDetails() throws IOException {
	  VideoEntry newEntry = new VideoEntry();
	  YouTubeMediaGroup mg = newEntry.getOrCreateMediaGroup();
	 
	  String videoTitle = "QRmedia Video";
	 
	  mg.addCategory(new MediaCategory(YouTubeNamespace.CATEGORY_SCHEME, "Autos"));
	  mg.setTitle(new MediaTitle());
	  mg.setPrivate(false);
	  mg.setKeywords(new MediaKeywords());
	  mg.getKeywords().addKeyword("");
	  mg.getTitle().setPlainTextContent(videoTitle);
	  mg.setDescription(new MediaDescription());
	  mg.getDescription().setPlainTextContent(videoTitle);
	 
	  URL uploadUrl = new URL("http://gdata.youtube.com/action/GetUploadToken");
	 
	  try {
	    FormUploadToken fut = service.getFormUploadToken(uploadUrl, newEntry);
	    token = fut.getToken();
	    formUrl = fut.getUrl();
	  } catch (ServiceException se) {
	    se.printStackTrace();
	  }
	}
	
}
