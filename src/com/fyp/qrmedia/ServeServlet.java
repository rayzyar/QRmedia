package com.fyp.qrmedia;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.DatastoreServiceFactory;

@SuppressWarnings("serial")
public class ServeServlet extends HttpServlet {
	
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	private final BlobInfoFactory blobInfoFactory = new BlobInfoFactory(DatastoreServiceFactory.getDatastoreService());
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doGet(req, resp);
		BlobKey blobKey = new BlobKey(req.getParameter("blob-key"));
//		String key = blobKey.getKeyString();
		
		PersistenceManager pm = PMF.get().getPersistenceManager();
		try {
//			FileInfo fileInfo = pm.getObjectById(FileInfo.class, key);
//			AuthorProfile ap = pm.getObjectById(AuthorProfile.class, fileInfo.getAuthor().getEmail());
//			ap.increaseTotalViews();
//			fileInfo.setViewCount();
			
			BlobInfo blobInfo = blobInfoFactory.loadBlobInfo(blobKey);
			resp.setContentLength(new Long(blobInfo.getSize()).intValue());
			resp.setHeader("content-type", blobInfo.getContentType());
			resp.setHeader("content-disposition", "attachment;filename=" + blobInfo.getFilename());
		} finally {
			pm.close();
		}
		blobstoreService.serve(blobKey, resp);
	}

}
