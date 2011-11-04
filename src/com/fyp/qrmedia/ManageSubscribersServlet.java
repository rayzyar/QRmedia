package com.fyp.qrmedia;

import java.io.IOException;
import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class ManageSubscribersServlet extends HttpServlet {
	
	private UserService userService = UserServiceFactory.getUserService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		String[] selection = null;
		selection = req.getParameterValues("subscriber");
		if(selection != null) {
			User user = userService.getCurrentUser();
			PersistenceManager pm = PMF.get().getPersistenceManager();
			try {
				AuthorProfile ap = pm.getObjectById(AuthorProfile.class, user.getEmail());
				for(int i=0; i<selection.length; i++) {
					ap.deleteSubscriber(Integer.parseInt(selection[selection.length-1-i].trim()));
					ap.decreaseSubscriberNo();
				}
			} finally {
				pm.close();
			}
		}
		resp.sendRedirect("/editSubscribers.jsp");
	}
	
}
