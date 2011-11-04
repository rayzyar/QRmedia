package com.fyp.qrmedia;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.datastore.KeyFactory;

@SuppressWarnings("serial")
public class AndroidServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		resp.setContentType("text/plain");
		String response = "";
		String key = req.getParameter("key");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		FileInfo file = null;
		try {
			file = pm.getObjectById(FileInfo.class, key);
		}catch(Exception e){
			//e.printStackTrace();
		}finally {
		}
		if (file!=null){
			RemoteIP remoteIP = null;
			String keyOfFile = KeyFactory.createKeyString("FileInfo",file.getId());
			String keyOfRemoteIP = req.getRemoteAddr()+keyOfFile;
			try{
				remoteIP = pm.getObjectById(RemoteIP.class, keyOfRemoteIP);
			}catch(Exception e){
				//e.printStackTrace();
			}
			finally{
			}
			if (remoteIP == null){
				AuthorProfile ap = pm.getObjectById(AuthorProfile.class, file.getAuthor().getEmail());
				ap.increaseTotalViews();
				Long unixTime = System.currentTimeMillis() / 1000L;
				
				remoteIP = new RemoteIP(keyOfRemoteIP, unixTime);
				pm.makePersistent(remoteIP);
				file.setViewCount(file.getViewCount()+1);
			}
			response = file.encode();
		}
		else {
			response = "";
		}
		pm.close();
		PrintWriter out = resp.getWriter();
		out.print(response);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		//resp.setContentType("text/plain");
		String key = req.getParameter("key");
		String comment = req.getParameter("comment");
		float rating = Float.parseFloat(req.getParameter("rating"));
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			FileInfo file = pm.getObjectById(FileInfo.class, key);
			if(rating != 0) {
				file.setRating(rating);
			}
			if(!comment.isEmpty()) {
				file.setComments(comment);
			}
		} finally {
			pm.close();
		}
	}
}
