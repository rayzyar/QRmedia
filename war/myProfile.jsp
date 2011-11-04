<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="javax.jdo.PersistenceManager"%>

<%@ page import="com.fyp.qrmedia.PMF"%>
<%@ page import="com.fyp.qrmedia.AuthorProfile"%>

<%@ include file="header.jsp"%>
</head>
<body>
 <%@ include file="tab_bar.jspf"%>
	<p>Here is a summary of your profile:</p>
	<p>User Name:<br /><%=ap.getUserId()%></p>
	<p>Profile Name:<br /><%=ap.getUserName()%></p>
	<p>Profile Description:<br /><%=ap.getUserDescription()%></p>
	<p>Date Joined:<br /><%=ap.getDateJoined()%></p>
	<p>Total Views:<br /><%=ap.getTotalViews()%></p>
	<p>Total Uploads:<br /><%=ap.getTotalUploads()%></p>
	<p>Total Subscribers:<br /><%=ap.getSubscriberNo()%></p>
	<p class="link"><a href="/editSubscribers.jsp">Manage your subscribers</a></p>
	<p class="link"><a href="/editProfile.jsp">Edit your profile</a></p>
  	
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