package com.fyp.qrmedia;

import java.io.IOException;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@SuppressWarnings("serial")
public class DeleteServlet extends HttpServlet {
	
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	//private UserService userService = UserServiceFactory.getUserService();
	//private BlobInfoFactory blobInfoFactory = new BlobInfoFactory();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		String key = req.getParameter("key");
		String operation = req.getParameter("operation");
		PersistenceManager pm = PMF.get().getPersistenceManager();
			try {
				FileInfo file = pm.getObjectById(FileInfo.class, key);
				String blobKey = file.getBlobKey();
				AuthorProfile ap = pm.getObjectById(AuthorProfile.class, file.getAuthor().getEmail());
				if(operation.equals("Delete")) {
					ap.decreaseUploadNo();
					if(!file.getFileType().equals("URL")&&!file.getFileType().equals("Video")&&!file.getFileType().equals("None"))
						blobstoreService.delete(new BlobKey(blobKey));
					pm.deletePersistent(file);
					resp.sendRedirect("/index.jsp");
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
			finally {
				pm.close();
			}
		}

}
