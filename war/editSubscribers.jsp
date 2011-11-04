<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="java.util.ArrayList"%>

<%@ page import="com.fyp.qrmedia.PMF"%>
<%@ page import="com.fyp.qrmedia.AuthorProfile"%>

<%@ include file="header.jsp"%>
</head>
<body>
<%@ include file="tab_bar.jspf"%>
	<p>The following is a list of all your subscribers.</p>
	<form action="/managesubscribers" method="post">
		<input type="submit" name="operation" value="Delete">
<%
	ArrayList<String> subscribers = ap.getSubscribers();
	if(subscribers.isEmpty()) {
%>
		<p>You do not have any subscribers yet.</p>
<%
	} else {
		for(int i=0; i<subscribers.size(); i++) {
%>
			<p><input type="checkbox" name="subscriber" value=<%=i%>><%=subscribers.get(i)%></p>
<%
		}
	}
	pm.close();
%>
		<input type="submit" name="operation" value="Delete">
	</form>
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