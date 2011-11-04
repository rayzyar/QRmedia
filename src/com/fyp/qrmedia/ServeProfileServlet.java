package com.fyp.qrmedia;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ServeProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		resp.setContentType("text/plain");
		
		String key = req.getParameter("key");
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
			AuthorProfile ap = pm.getObjectById(AuthorProfile.class, key);
			PrintWriter out = resp.getWriter();
			out.print(ap.getUserName());
			out.print("++HuaLiDeFenGeXian++");
			out.print(ap.getUserDescription());
			out.print("++HuaLiDeFenGeXian++");
			out.print(ap.getDateJoined().toString());
			out.print("++HuaLiDeFenGeXian++");
			out.print(ap.getTotalViews());
			out.print("++HuaLiDeFenGeXian++");
			out.print(ap.getTotalUploads());
			out.print("++HuaLiDeFenGeXian++");
			out.print(ap.getSubscriberNo());
			out.print("++HuaLiDeFenGeXian++");
		} finally {
			pm.close();
		}
	}

}
