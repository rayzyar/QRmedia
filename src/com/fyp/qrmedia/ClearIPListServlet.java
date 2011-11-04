package com.fyp.qrmedia;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.jdo.Query;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
public class ClearIPListServlet extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try{
			Query query = pm.newQuery(RemoteIP.class);
			Long timeParameter = System.currentTimeMillis() / 1000L - 86400;
// delete old IPs exists in the list more than one day
			query.setFilter("unixTime < timeParameter");
			query.declareParameters("Long timeParameter");
			query.deletePersistentAll(timeParameter);
		}catch (Exception e) {
			// TODO: handle exception
		}
		finally{
			pm.close();
		}
	}
}
