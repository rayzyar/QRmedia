<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.jdo.Query"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.datastore.KeyFactory"%>
<%@ page import="javax.jdo.PersistenceManager"%>

<%@ page import="com.fyp.qrmedia.PMF"%>
<%@ page import="com.fyp.qrmedia.FileInfo"%>
<%@ page import="com.fyp.qrmedia.AuthorProfile"%>

<%@ include file="header.jsp"%>
</head>
<body>
	<script type="text/javascript">
	function onsubmitform()
	{
	   document.myform.action = document.pressed;
	  return true;
	}
	</script>

<%@ include file="tab_bar.jspf"%>
	<p>The following is a list of all your files.</p>
	<p  class="link">
		<a href="/index.jsp?order=date asc">Date</a>&darr;&nbsp;&nbsp;
		<a href="/index.jsp?order=date desc">Date</a>&uarr;&nbsp;&nbsp;
		<a href="/index.jsp?order=rating asc">Rating</a>&darr;&nbsp;&nbsp;
		<a href="/index.jsp?order=rating desc">Rating</a>&uarr;&nbsp;&nbsp;
		<a href="/index.jsp?order=viewCount asc">Views</a>&darr;&nbsp;&nbsp;
		<a href="/index.jsp?order=viewCount desc">Views</a>&uarr;&nbsp;&nbsp;
	</p>
	<form action="?" name="myform"  method="post" onsubmit="return onsubmitform();">
<%
	String pageNumber = request.getParameter("p");
	int pn = 1, pageSize = 5;
	try
	{
	  // the String to int conversion happens here
	  pn = Integer.parseInt(pageNumber);
	}
	catch (NumberFormatException nfe)
	{
	  System.out.println("NumberFormatException: " + nfe.getMessage());
	};
	if (pn<=0) pn = 1;
	String order = request.getParameter("order");
	if (order == null) order = "date desc";
	Query query = pm.newQuery(FileInfo.class);
	query.setFilter("author == authorParameter");
	query.setOrdering(order);
	query.declareImports("import com.google.appengine.api.users.User");
	query.declareParameters("User authorParameter");
	query.setRange((pn-1)*pageSize, pageSize);
	List<FileInfo> files = (List<FileInfo>) query.execute(user);
	if(files.isEmpty()) {
%>
		<p>You do not have any files yet.</p>
<%
	} else {
	String key;
	String dot;
	int i = 0;
	for (FileInfo f:files) {
		i++;
		key = KeyFactory.createKeyString("FileInfo",f.getId());
		int l=f.getFileDescription().length();
		if (l>40) {
			l = 40;
			dot = "...";
		} else dot = "";
//		SimpleDateFormat formatter;
//		Locale currentLocale = RequestContextUtils.getLocale(request);
//		formatter = new SimpleDateFormat(pattern, currentLocale);
%>
		<div>
		
		<div style="float:left;width:400px;height:80px">

		<b>Create Date: </b><%=f.getDate()%></br>
		<b>Content Type: </b><%=f.getFileType()%></br>
		<b>Brief Description: </b><%=f.getFileDescription().substring(0, l)%><%=dot%></br>
		</div>
		<div style="float:right;width:70px;height:80px">
		<input id="editFile.jsp?key=<%=key%>" style="width:60px" type="submit" name="operation" onclick="document.pressed=this.id" value="Edit"></br>
		<input id="/delete?key=<%=key%>" style="width:60px" type="submit" name="operation" onclick="document.pressed=this.id" value="Delete"></br>
		<input id="viewDetails.jsp?key=<%=key%>" style="width:60px" type="submit" name="operation" onclick="document.pressed=this.id" value="View">
		</div>
		
		</div>
<%
	}
%>
	<div style="float:left;width:400px">
<%
	if (pn>1){%>
	<a href="index.jsp?p=<%=pn-1%>"><</a>
	<%}%>
	
	if (pn<1){%>
	<a href="index.jsp?p=<%=pn-1%>">></a>
	<%}%>
	</div>
<%	}
	pm.close();
%>
	</form>
<%
		}
    } else {%>
<p>Access Denied! Please <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>.</p>
<%
    	//response.sendRedirect("/login.jsp");
    }
%>
</div>
  	</body>
  	
</html>