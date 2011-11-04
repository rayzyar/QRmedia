<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="javax.jdo.PersistenceManager"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="java.util.ArrayList"%>

<%@ page import="com.fyp.qrmedia.FileInfo" %>
<%@ page import="com.fyp.qrmedia.PMF" %>

<%@ include file="header.jsp"%>
<link rel="stylesheet" href="../stylesheets/css/sc-player-standard.css" type="text/css">
<style type="text/css">
#detail_c
{
	position:relative;
	left:30px;
}
#img_info
{
	width:100%;
	height:150px;
	position:relative;
}
#qr
{
	display:block;
	float:left;
	position:relative;
}
#fileInfo
{
	float:right;
	position:relative;
	right:60px;
}
#rating_comments
{
	float:left;
	width:100%;
	position:relative;
}

#audio
{
	float:left;
	position:relative;
}

</style>
</head>
</body>
<%@ include file="tab_bar.jspf"%>
<%
	String key = request.getParameter("key");
	String source = "http://chart.apis.google.com/chart?chs=200x200&cht=qr&chl=" + key;
	FileInfo fileInfo = pm.getObjectById(FileInfo.class, key);
	String blobKey = fileInfo.getBlobKey();
	ArrayList<String> comments = fileInfo.getComments();
%>
	<div id="detail_c">
	<p><b>File Description:</b><br /><%=fileInfo.getFileDescription()%></p>
<div id="img_info">
	<div id="qr"><b>QR code to access the file:</b><br/ ><img src=<%=source%> alt="QR code" width="200" height="200"/></div>
	<div id="fileInfo">

<%
String cType = fileInfo.getFileType();
String url = fileInfo.getUrl();
if (cType.equals("Video")) {%>	
	<input style="position:relative;right:30px;" type="button"  value="Watch" onClick="window.location.href='http://www.youtube.com/watch?v=<%=url%>'">
<%} else if (cType.equals("None")){
	
} else if (cType.equals("URL")){%>
	<a style="position:relative;right:60px;" href="<%=url%>">Url Link</a>
<%}else {%>

<b>Content Type:</b><br /><%=fileInfo.getFileType()%><br />
<b>File Name:</b><br /><%=fileInfo.getFileName()%><br /><i><%=fileInfo.getDate()%></i>
<%
String fsize;
Long fileSize = fileInfo.getFileSize();
if(fileSize<1024)
	fsize = Long.toString(fileSize) + " B";
else if(fileSize<1024*1024) {
	String temp = Float.toString((float)fileSize/1024);
	int tempIndex = temp.indexOf(".");
	if(tempIndex+3 > temp.length())
		tempIndex = temp.length()-3;
	temp = temp.substring(0, tempIndex+3);
	fsize = temp + " KB";
} else {
	String temp = Float.toString((float)fileSize/(1024*1024));
	int tempIndex = temp.indexOf(".");
	if(tempIndex+3 > temp.length())
		tempIndex = temp.length()-3;
	temp = temp.substring(0, tempIndex+3);
	fsize = temp+ " MB";
}
%>
<p><b>File Size:</b><br /><%=fsize%></p>
	<input type="button"  value="Dowload" onClick="window.location.href='/serve?blob-key=<%=blobKey%>'">
<%};%>
	</div>
</div> <!-- img_info end  -->
	<div id="rating_comments">
	<p><b>Rating:</b><br /><%=fileInfo.getRating()%> || <%=fileInfo.getRatingCount()%> people have rated it</p>
	<p><b>View and Comments:</b><br /><%=fileInfo.getViewCount()%> people have viewed this file and <%=fileInfo.getCommentCount()%> people have commented it</p>
	<a href="javascript:window.print()">Print out the page</a>
	<p>
  	<b>Comments:</b><br/>
<%
	for(int i=0; i<comments.size(); i++) {
%>
	<%=i+1%>: <%=comments.get(i)%>
	<br />
<%
	}
%>
	</p>
	</div> <!-- rating_comments end -->
	
	</div> <!-- detail_c end -->

<%
	pm.close();
    }} else {
%>
	<div id="contents">
	<p>Hello! Please <a href="<%= userService.createLoginURL(request.getRequestURI()) %>">Sign in</a>.</p>
<%
    }
%>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../js/soundcloud.player.api.js"></script>
<script type="text/javascript" src="../js/sc-player.js"></script>
  	</body>
  	
</html>