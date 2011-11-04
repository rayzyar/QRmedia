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
         $('.uploadfile').show();
         $('.ytb').hide();
		 $('.url').hide();
    });
	$(function() {
	    $('#type').change(function() {
	        var x = $(this).val();
	        // and update the hidden input's value
	       $('.uploadfile').show();
	       $('.ytb').hide();
	       $('.url').hide();
	       
	       if (x=="Video") {
	       	$('.ytb').show();
	       	$('.uploadfile').hide();
	       };
	        
	       if (x=="URL"){
	        $('.url').show();
	        $('.uploadfile').hide();
	       }
	      
	       if (x=="None"){
	       $('.uploadfile').hide();
	       }
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
<div class="ytb" style="position:absolute;top:110px;">Youtube Video ID:<input id="youtubeid" type="text" size="10" name="vid" /></div>
<div class="url" style="position:absolute;top:80px;">URL:<input id="url" type="text" size="50" name="url" /></div>
<div style="position:absolute;top:80px;" class="uploadfile" >Please choose a file to upload: <input type="file" name="myFile"></div>
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
	Content Type&nbsp
	<select id="type" name="filetype">
	<option value="Image">Image</option>
	<option value="Video">Video</option>
	<option value="Audio">Audio</option>
	<option value="PDF">PDF</option>
	<option value="URL">URL</option>
	<option value="None">None</option>
	</select>	
</div>


	<div style="position:relative;top:100px;border:0;">File Description:<br /><textarea name="fileDescription" wrap="off" rows="10" cols="78"></textarea></div>


<div style="position:relative;top:100px;right:20px;float:right;"><input name="operation" type="submit" value="upload"></div>
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