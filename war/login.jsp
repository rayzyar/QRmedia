<html>

	<head>
	<title>Online Data Management System</title>
	</head>
	
	<body style="margin:0;padding:0">
	<div style="position:relaive;min-height:100%">
		<div class="header bar" style="margin: 0 auto;height: 71px;background: #f5f5f5;border-bottom:1px solid #e5e5e5;overflow:hidden;">
			<div style="margin: 0 auto;width: 850px;height:100%;position:relative;top:10px;font-size:40;font-family:'Arial Narrow'">
				QR MEDIA
			</div>
		</div>
		<div class="content" style="width:850px;position:relative;top:20px;margin: 0 auto;">
		
			<div style="width:65%;float:left">Description of the web app</div>
			<div class="sign-in" style="width:35%;float:right">
			<div class="signin-box" style="margin: 12px 0 0;padding: 20px 25px 15px;background: whiteSmoke;border: 1px solid #E5E5E5;">
			  <h2>Sign in <strong></strong></h2>
			  <form id="gaia_loginform" action="https://accounts.google.com/ServiceLoginAuth" method="post">
			  <input type="hidden" name="service" id="service" value="ah">
			  <input type="hidden" name="dsh" id="dsh" value="-8559526472073090488">
			  <input type="hidden" name="ltmpl" id="ltmpl" value="ae">
			  <input type="hidden" name="ltmpl" id="ltmpl" value="ae">
			  <input type="hidden" name="GALX" value="JQj4jtHoTSU">
			  <input type="hidden" id="pstMsg" name="pstMsg" value="1">
			  <input type="hidden" id="dnConn" name="dnConn" value="https://accounts.youtube.com">
			<input type="hidden" name="timeStmp" id="timeStmp" value="">
			<input type="hidden" name="secTok" id="secTok" value="">
			<label>
			  <strong class="email-label">Email</strong>
			  <input type="text" name="Email" id="Email" value="">
			</label>
			<label>
			  <strong class="passwd-label">Password</strong>
			  <input type="password" name="Passwd" id="Passwd">
			</label>
			  <input type="submit" class="g-button g-button-submit" name="signIn" id="signIn" value="Sign in">
			  <label class="remember">
			  <input type="checkbox" name="PersistentCookie" id="PersistentCookie" value="yes" checked="checked">
			  <strong class="remember-label">
			  Stay signed in
			  </strong>
			  </label>
			  <input type="hidden" name="rmShown" value="1">
			  </form>
			 </div>
			 </div>
		
		</div>
	</div>
	<script type="text/javascript">
	  function gaia_setFocus() {
	  var f = null;
	  if (document.getElementById) {
	  f = document.getElementById('gaia_loginform');
	  }
	  if (f) {
	  if (f.Email && (f.Email.value == null || f.Email.value == '')) {
	  f.Email.focus();
	  } else if (f.Passwd) {
	  f.Passwd.focus();
	  }
	  }
	  }
	  window.onload = gaia_setFocus;
	  function gaia_onLoginSubmit() {
	  if (window.gaiacb_onLoginSubmit) {
	  return gaiacb_onLoginSubmit();
	  } else {
	  return true;
	  }
	  }
	  document.getElementById('gaia_loginform').onsubmit = gaia_onLoginSubmit;
	  var Ga=true,Gb=false;var Gd=function(a,b){var c=a;a&&typeof a=="string"&&(c=document.getElementById(a));if(b&&!c)throw new Gc(a);return c},Gc=function(a){this.id=a;this.toString=function(){return"No element found for id '"+this.id+"'"}};var Ge={},Gf;Gf=window.addEventListener?function(a,b,c){var d=function(a){var b=c.call(this,a);Gb===b&&Gg(a);return b},a=Gd(a,Ga);a.addEventListener(b,d,Gb);Gh(a,b).push(d);return d}:window.attachEvent?function(a,b,c){var a=Gd(a,Ga),d=function(){var b=window.event,d=c.call(a,b);Gb===d&&Gg(b);return d};a.attachEvent("on"+b,d);Gh(a,b).push(d);return d}:void 0;var Gi;
	Gi=window.removeEventListener?function(a,b,c){a=Gd(a,Ga);a.removeEventListener(b,c,Gb)}:window.detachEvent?function(a,b,c){a=Gd(a,Ga);a.detachEvent("on"+b,c)}:void 0;var Gg=function(a){a.preventDefault?a.preventDefault():a.returnValue=Gb;return Gb},Gh=function(a,b){Ge[a]=Ge[a]||{};Ge[a][b]=Ge[a][b]||[];return Ge[a][b]};var Gj=function(){try{return new XMLHttpRequest}catch(a){for(var b=["MSXML2.XMLHTTP.6.0","MSXML2.XMLHTTP.3.0","MSXML2.XMLHTTP","Microsoft.XMLHTTP"],c=0;c<b.length;c++)try{return new ActiveXObject(b[c])}catch(d){}}return null},Gk=function(){this.c=Gj();this.b={}};Gk.prototype.d=function(){};
	Gk.prototype.send=function(a){var b=[],c;for(c in this.b){var d=this.b[c];b.push(c+"="+encodeURIComponent(d))}var b=b.join("&"),e=this.c,f=this.d;e.open("POST",a,Ga);e.setRequestHeader("Content-type","application/x-www-form-urlencoded");e.setRequestHeader("Content-length",String(b.length));e.onreadystatechange=function(){e.readyState==4&&f({status:e.status,text:e.responseText})};e.send(b)};
	Gk.prototype.h=function(a){var b=this.d,c=this.c;c.open("GET",a,Ga);c.onreadystatechange=function(){c.readyState==4&&b({status:c.status,text:c.responseText})};c.send()};var Gm=function(a){this.e=a;this.i=this.j();if(this.e==null)throw new Gl("Empty module name");};Gm.prototype.j=function(){var a=window.location.pathname;return a&&a.indexOf("/accounts")==0?"/accounts/JsRemoteLog":"/JsRemoteLog"};
	Gm.prototype.g=function(a,b,c){for(var d=this.i,e=this.e||"",d=d+"?module="+encodeURIComponent(e),a=a||"",d=d+"&type="+encodeURIComponent(a),b=b||"",d=d+"&msg="+encodeURIComponent(b),c=c||[],a=0;a<c.length;a++)d=d+"&arg="+encodeURIComponent(c[a]);try{var f=Math.floor(Math.random()*1E4),d=d+"&r="+String(f)}catch(g){}return d};Gm.prototype.send=function(a,b,c){var d=new Gk;d.b={};try{var e=this.g(a,b,c);d.h(e)}catch(f){}};Gm.prototype.a=function(a,b){this.send("ERROR",a,b)};
	Gm.prototype.k=function(a,b){this.send("WARN",a,b)};Gm.prototype.f=function(a){var b=this;return function(){try{a.apply(null,arguments)}catch(c){throw b.a("Uncatched exception: "+c),c;}}};var Gl=function(a){this.l=a};var G=G||new Gm("check_connection"),Gn=function(a,b,c){var d=function(e){if(!(a!="*"&&e.origin.toLowerCase()!=a.toLowerCase()))e.data!=c?G.k("Received unexpected Message",[e.data,"Expected: "+c]):(b.value=a,Gi(window,"message",d),d=null)};return d},Go=function(){if(window.__CHECK_CONNECTION_CONFIG){var a=window.__CHECK_CONNECTION_CONFIG.iframeUri,b=window.__CHECK_CONNECTION_CONFIG.iframeOrigin,c=window.__CHECK_CONNECTION_CONFIG.connectivityElementId,d=window.__CHECK_CONNECTION_CONFIG.iframeParentElementId,
	e=window.__CHECK_CONNECTION_CONFIG.msgContent;if(window.postMessage)if(a){var f=document.getElementById(c);f?(c=document.getElementById(d))?(Gf(window,"message",Gn(b,f,e)),b=c,d=window.document.createElement("iframe"),e=d.style,e.visibility="hidden",e.width="1px",e.height="1px",e.position="absolute",e.top="-100px",d.src=a,d.id="CheckConnectionIframe",b.appendChild(d)):G.a("Unable to locate the iframe anchor to appendconnection test iframe",["element id: "+d]):G.a("Unable to locate the input element to storeconnection test result",
	["element id: "+c])}else G.a("Empty iframe URI")}},Gp=function(){if(window.__CHECK_CONNECTION_CONFIG){var a=window.__CHECK_CONNECTION_CONFIG.postMsgSupportElementId;if(window.postMessage){var b=document.getElementById(a);b?b.value="1":G.a("Unable to locate the input element to storepostMessage test result",["element id: "+a])}}};G_checkConnectionMain=G.f(Go);G_setPostMessageSupportFlag=G.f(Gp);
	    window.__CHECK_CONNECTION_CONFIG = {
	      
	      iframeUri: 'https:\x2F\x2Faccounts.youtube.com\x2Faccounts\x2FCheckConnection?pmpo=https%3A%2F%2Faccounts.google.com\x26v=-1040283717',
	      
	      iframeOrigin: 'https:\x2F\x2Faccounts.youtube.com',
	      
	      connectivityElementId: 'dnConn',
	      
	      iframeParentElementId: 'cc_iframe_parent',
	      
	      postMsgSupportElementId: 'pstMsg',
	      
	      msgContent: 'accessible'
	    };

	    G_setPostMessageSupportFlag();
	    G_checkConnectionMain();
	</script>
	</body>
</html>