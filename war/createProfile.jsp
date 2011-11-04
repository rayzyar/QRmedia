<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.fyp.qrmedia.PMF"%>
<%@ page import="com.fyp.qrmedia.FileInfo"%>
<%@ page import="com.fyp.qrmedia.AuthorProfile"%>


<%@ include file="header.jsp"%>
</head>
<body>
<%@ include file="tab_bar.jspf"%>
  	<p>Please create a profile to continue:</p>
  	<form action="/createprofile" method="post">
  		<div>User Name:<br /><input type="text" name="nickName"></div>
  		<div>User Info:<br /><textarea name="userInfo"
  			rows="10" cols="75">Please enter a description about yourself...</textarea></div>
  		<div><input type="submit" name="operation" value="Create Profile"></div>
  	</form>
  	
<%
	}
    } else {
%>
	<div id="contents">
	<p>Hello! Please <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>.</p>
<%
    }
%>
</div>
  	</body>
  	
</html>