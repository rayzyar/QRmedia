package com.fyp.qrmedia;

import java.io.IOException;
import java.util.ArrayList;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class LoadCommentServlet extends HttpServlet {
	
	String mComments;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		resp.setContentType("text/plain");
		String key = req.getParameter("key");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		FileInfo file = null;
		try {
			file = pm.getObjectById(FileInfo.class, key);
		} finally {
			pm.close();
		}
		ArrayList<String> comments = file.getComments();
		if(comments.isEmpty()) {
			resp.getWriter().print("0++HuaLiDeFenGeXian++");
		} else {
			createResponse(comments);
			resp.getWriter().print(mComments);
		}
	}

	private void createResponse(ArrayList<String> comments) {
		// TODO Auto-generated method stub
		mComments="";
		mComments += (Integer.toString(comments.size()) + "++HuaLiDeFenGeXian++");
		for(int i=0; i<comments.size(); i++) {
			mComments += (comments.get(i) + "++HuaLiDeFenGeXian++");
		}
	}

}
