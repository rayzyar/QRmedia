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
  	<form action="/createprofile" method="post">
  		<div>User Name:<br /><input type="text" name="nickName" value=<%=ap.getUserName()%>></div>
  		<div>User Info:<br /><textarea name="userInfo" rows="10" cols="80"><%=ap.getUserDescription()%></textarea></div>
  		<div><input type="submit" name="operation" value="Edit Profile"></div>
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