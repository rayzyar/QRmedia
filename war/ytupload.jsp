<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.google.appengine.api.users.User"%>
<%@ page import="com.google.appengine.api.users.UserService"%>
<%@ page import="com.google.appengine.api.users.UserServiceFactory"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@ page import="javax.jdo.PersistenceManager"%>

<%@ page import="com.fyp.qrmedia.PMF"%>
<%@ page import="com.fyp.qrmedia.AuthorProfile"%>


<%@ page import="com.fyp.qrmedia.YTB"%>
<%@ page import="com.google.gdata.client.youtube.YouTubeService"%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
<%@ include file="header.jsp"%>
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
	<script type='text/javascript'>
	$( document ).ready( function()
        {
         $('.uploadfile').hide();
    });
	$(function() {
	    $('#type').change(function() {
	        var x = $(this).val();
	        // and update the hidden input's value
	       if (x=="Video"){
	        $('.ytb').show();
	        $('.uploadfile').hide();
	       }
	        else {
	        $('.ytb').hide();
	        $('.uploadfile').show();
	        };
	    });
	});
	</script>
<%
YTB.init();
YTB.setFormDetails();
String token = YTB.token;
String formUrl = YTB.formUrl;
%>
</head>
<body>
<%@ include file="tab_bar.jspf"%>

	<form class="ytb" style="position:absolute;top:60px;" action="<%=formUrl%>?nexturl=http://localhost:8888/ytbiframe.jsp" method="post" enctype="multipart/form-data" target="uploader">
	<div style="font-size:12;color:#FFB200;">You can either enter an existing youtube video id or upload a new video</div>
	<div>
	Choose a file to upload<input type="file" name="file"/>
	<input type="hidden" name="token" value="<%=token%>"/>
	<input type="submit" value="upload"/>
	</div>
	</form>
	
	
<form action="<%= blobstoreService.createUploadUrl("/upload") %>" method="post" enctype="multipart/form-data">
<div class="ytb" style="position:absolute;top:110px;">Youtube Video ID:<input id="youtubeid" type="text" size="50" name="vid" /></div>
<div>  	
	Category&nbsp
	<select name="category">
	<option value="Place">Place</option>
	<option value="Exhibit">Exhibit/Product</option>
	<option value="Shop">Shop</option>
	<option value="Movie">Movie</option>
	<option value="Manual">Manual</option>
	<option value="MobileApp">Mobile App</option>
	<option value="News">News</option>
	<option value="Other">Other</option>
	</select>	
</div>
<div>  	
	File Type&nbsp
	<select id="type" name="filetype">
	<option value="Video">Video</option>
	<option value="Audio">Audio</option>
	<option value="PDF">PDF</option>
	<option value="Image">Image</option>
	</select>	
</div>

<div style="position:absolute;top:70px;" class="uploadfile" >Please choose a file to upload: <input type="file" name="myFile">
</div>


	<div style="position:relative;top:100px;">File Description:<br /><textarea name="fileDescription" rows="10" cols="80"></textarea></div>
	<div style="position:relative;top:100px;">
	<p>If the object described in the file has an address, please enter the following information. (Optional)</p>
		<table>
		<tr><td>Title: </td><td><input type="text" size="50" name="name" /></td></tr>
		<tr><td>Address: </td><td><input type="text" size="50" name="address" /></td></tr>
		<tr><td>Country: </td><td><input type="text" name="country" /></td></tr>
		<tr><td>Postal Code: </td><td><input type="text" name="postalCode" /></td></tr>
		</table>
		<table>
  		<tr><td>URL:</td><td><input type="text" size="50" name="url" /></td></tr>
  		</table>
	</div>

<div style="position:relative;top:100px;float:right;"><input name="operation" type="submit" value="upload"></div>
</form>
<iframe id="uploader" name="uploader" style="display: none; width: 1px; height: 1px; border: none;"></iframe>  	
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