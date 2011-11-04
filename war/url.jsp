<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@ page import="javax.jdo.PersistenceManager"%>

<%@ page import="com.fyp.qrmedia.PMF"%>
<%@ page import="com.fyp.qrmedia.AuthorProfile"%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>

<%@ include file="header.jsp"%>
</head>
<body>
<%@ include file="tab_bar.jspf"%>

	<div id="audio">
	<p>audio streaming test</p>
	<a style="width:200px;" href="http://soundcloud.com/qrmedia" class="sc-player">My new dub track</a>
	</div>

<%
		}
    } else {
%>
	<p>Hello! Please <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>.</p>
<%
    }
%>
</div>
  	</body>
  	
</html>