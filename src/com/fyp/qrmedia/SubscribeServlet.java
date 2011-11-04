package com.fyp.qrmedia;

import java.io.IOException;
import java.util.ArrayList;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class SubscribeServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		resp.setContentType("text/plain");
		
		String key = req.getParameter("key");
		String email = req.getParameter("email");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			AuthorProfile ap = pm.getObjectById(AuthorProfile.class, key);
			ArrayList<String> subscribers = ap.getSubscribers();
			if(!subscribers.contains(email)) {
				ap.addSubscriber(email);
				ap.increaseSubscriberNo();
			}
		} finally {
			pm.close();
		}
		resp.getWriter().print("Subscription successful");
	}

}
