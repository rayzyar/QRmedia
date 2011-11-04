<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>

<%@ include file="header.jsp"%>
</head>
<body>
<%@ include file="tab_bar.jspf"%>
	<p>Sorry, it seems there is something wrong. Please try again later.</p>
  	
<%
    }} else {
%>
	<p>Hello! Please <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>.</p>
<%
    }
%>
</div>
  	</body>
  	
</html>