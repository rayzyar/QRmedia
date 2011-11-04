<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<%@ page import="com.fyp.qrmedia.FileInfo" %>
<%@ page import="com.fyp.qrmedia.PMF" %>

<%@ include file="header.jsp"%>
</head>
<body>
<%@ include file="tab_bar.jspf"%>
	<p>Upload successful! Here is a summary of your upload.</p>

<%
	String key = request.getParameter("key");
	String source = "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=" + key;
	pm = PMF.get().getPersistenceManager();
	FileInfo fileInfo = pm.getObjectById(FileInfo.class, key);
%>
	
	<p>Date:<br /><%=fileInfo.getDate()%></p>
	<p>File Name:<br /><%=fileInfo.getFileName()%></p>
	<p>File Description:<br /><%=fileInfo.getFileDescription()%></p>
	<p>QR code to access the file:<br/ ><img src=<%=source%> alt="QR code" width="200" height="200" /></p>
	<a href="javascript:window.print()">Print out the page</a>
<%
	pm.close();
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