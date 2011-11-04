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
public class CreateProfileServlet extends HttpServlet {
	
	private UserService userService = UserServiceFactory.getUserService();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		User user = userService.getCurrentUser();
		String operation = req.getParameter("operation");
		String nickName = req.getParameter("nickName");
		String userInfo = req.getParameter("userInfo");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		
		if(operation.equals("Create Profile")) {
			AuthorProfile ap = new AuthorProfile(user.getEmail(), nickName, userInfo);
			try {
				pm.makePersistent(ap);
			}catch (Exception e){
				
			} finally {
				pm.close();
			}
		} else if(operation.equals("Edit Profile")) {
			try {
				AuthorProfile ap = pm.getObjectById(AuthorProfile.class, user.getEmail());
				ap.setUserName(nickName);
				ap.setUserDescription(userInfo);
			}catch (Exception e){
				
			}finally {
				pm.close();
			}
		}
		
		resp.sendRedirect("/myProfile.jsp");
	}

}
