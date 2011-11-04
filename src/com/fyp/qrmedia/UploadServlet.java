package com.fyp.qrmedia;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.datastore.KeyFactory;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class UploadServlet extends HttpServlet {
	
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	private UserService userService = UserServiceFactory.getUserService();
	private BlobInfoFactory blobInfoFactory = new BlobInfoFactory();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		//super.doPost(req, resp);
		Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
		BlobKey blobKey = blobs.get("myFile");
		String bKey = "";
		String key = req.getParameter("key");
		String operation = req.getParameter("operation");
		String url = req.getParameter("url");
		String cType = req.getParameter("filetype");
		User user = userService.getCurrentUser();
		if (operation.equals("upload")){
					PersistenceManager pm = PMF.get().getPersistenceManager();
					User author = userService.getCurrentUser();
					String category = req.getParameter("category");
					String fileDescription = req.getParameter("fileDescription");
					String fileName="";
					Long fileSize = (long)0;
					Date date = new Date();
					if (cType.equals("Video")){
						url = req.getParameter("vid");
					};
					if (! ( cType.equals("URL")||cType.equals("Video")||cType.equals("None") ) ){
						//file uploaded
						bKey = blobKey.getKeyString();
						BlobInfo blobInfo = blobInfoFactory.loadBlobInfo(blobKey);
						date = blobInfo.getCreation();
						fileName = blobInfo.getFilename();
						fileSize = blobInfo.getSize();
					}
					FileInfo fileInfo = new FileInfo(category, bKey, author, date, fileSize, fileName, fileDescription, cType, url);
					try {
						pm.makePersistent(fileInfo);
						key = KeyFactory.createKeyString("FileInfo",fileInfo.getId());
						AuthorProfile ap = pm.getObjectById(AuthorProfile.class, author.getEmail());
						ap.increaseUploadNo();
						if(ap.getSubscriberNo()>0)
							sendEmail(ap, fileName, fileDescription, key);
					} finally {
						pm.close();
					}
					resp.sendRedirect("/viewDetails.jsp?key=" + key);
		} else if (operation.equals("update")) {
				PersistenceManager pm = PMF.get().getPersistenceManager();
				FileInfo pfileInfo = pm.getObjectById(FileInfo.class,key);
				String oldBKey = pfileInfo.getBlobKey();
				User author = pfileInfo.getAuthor();
				if (user.compareTo(author)!=0) resp.sendRedirect("/index.jsp");
				pfileInfo.setCategroy(req.getParameter("category"));
				pfileInfo.setFileDescription(req.getParameter("fileDescription"));
				Date date = new Date();
				BlobInfo blobInfo = blobInfoFactory.loadBlobInfo(blobKey);
				String vid = req.getParameter("vid");
				pfileInfo.setFileType(cType);
				if (true){//change this to an input variable
				
					if (!oldBKey.equals("")) blobstoreService.delete(new BlobKey(oldBKey));
					pfileInfo.setUrl("");
					if (cType.equals("Video")) pfileInfo.setUrl(vid);
					
					
					if ( cType.equals("URL")||cType.equals("Video")||cType.equals("None") ) {
						pfileInfo.setBlobKey("");
						pfileInfo.setDate(date);
						pfileInfo.setFileName("");
						pfileInfo.setFileSize((long)0);
						pfileInfo.setUrl(req.getParameter("url"));
					}
					else{						  //file uploaded
						pfileInfo.setBlobKey(blobKey.getKeyString());
						pfileInfo.setDate(blobInfo.getCreation());
						pfileInfo.setFileName(blobInfo.getFilename());
						pfileInfo.setFileSize(blobInfo.getSize());
						pfileInfo.setUrl("");
					}
						pm.makePersistent(pfileInfo);
						AuthorProfile ap = pm.getObjectById(AuthorProfile.class, author.getEmail());
						if(ap.getSubscriberNo()>0)
							sendEmail(ap, pfileInfo.getFileName(), pfileInfo.getFileDescription(), key);
				pm.close();
				}
				resp.sendRedirect("/viewDetails.jsp?key=" + key);
		}
	}

	private void sendEmail(AuthorProfile ap, String fileName, String fileDescription, String key) {
		// TODO Auto-generated method stub
		Properties props = new Properties();
		Session session = Session.getDefaultInstance(props, null);
		
		Message msg = new MimeMessage(session);
		try {
			ArrayList<String> subscribers = ap.getSubscribers();
			msg.setFrom(new InternetAddress(ap.getUserId(), ap.getUserName()));
			
			for(int i=0; i<subscribers.size(); i++)
				msg.addRecipient(Message.RecipientType.BCC, new InternetAddress(subscribers.get(i)));
			
			msg.setSubject("New file uploaded");
			
			String htmlBody = emailContent(fileName, fileDescription, key);
			Multipart mp = new MimeMultipart();
			MimeBodyPart htmlPart = new MimeBodyPart();
			htmlPart.setContent(htmlBody, "text/html");
			mp.addBodyPart(htmlPart);
			
			msg.setContent(mp);
			Transport.send(msg);			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private String emailContent(String fileName, String fileDescription, String key) {
		// TODO Auto-generated method stub
		String htmlBody = "<html><body><p>Dear subsribers,</p><p>There is a new file uploaded. Please check the details of the file below:</p><p>File Name:</p><p>";
		htmlBody = htmlBody + fileName + "</p><p>File Description:</p><p>";
		htmlBody = htmlBody + fileDescription + "</p><p>You can access the file using the following link:</p><p><i>http://fypdatastore.appspot.com/serve?key=";
		htmlBody = htmlBody + key + "</i></p><p>or scan the following QR code with your phone</p><p><img src=\"http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=";
		htmlBody = htmlBody + key + "\" alt=\"QR code\" width=\"200\" height=\"200\"/></p><p>Regards,</p><p>Administrator</p>";
		return htmlBody;
	}

}
