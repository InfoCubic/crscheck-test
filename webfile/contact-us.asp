<%

Dim IPAddress, SupportType, Email, Phone, State, contactme, MyTiap1, NameBox, MyTiap, MyTiap2
'2013/04/05 T.Ohnishi@MIS add start
Dim sReferrer, bDrugPage
sReferrer = Request.ServerVariables("HTTP_REFERER")

'add end
Response.Redirect "https://crschecks.zendesk.com/hc/en-us/requests/new"

'get user ip address
Session("IPAddress") = Request.ServerVariables("REMOTE_ADDR")

If (Request.Form("Submit") <> "" and Request.Form("MyTiap") = "" and Request.Form("MyTiap2") = "") then
'If Request("Submit") <> "" then
		SupportType = Request.Form("SupportType")
		NameBox = Request.Form("NameBox")
		CompanyName = Request.Form("CompanyName") 
		Email = Request.Form("EmailBox")
		'Phone = Request.Form("Phone")					
		'contactme=Request.Form("contactme")				
		MyTiap1=Request.Form("MyTiap1")
		
		'Input Check
		if NameBox = "" Then
		    response.Redirect("contact_us_err.asp?msg=" & Server.URLEncode("Your name is required."))
		End If
		
		if Email = "" Then
		    response.Redirect("contact_us_err.asp?msg=" & Server.URLEncode("Please enter your correct email address."))
		End If

		' Create an instance of the NewMail object.
		'Set objCDOMail = Server.CreateObject("CDO.Message")
	    Set myMail = CreateObject("CDO.Message")
		' Set the properties of the object

		dim strBody, sendTo
		
		'default Body
		strBody = strBody & "Support Type: " & SupportType & vbCrLf
        strBody = strBody & "Name: " & NameBox & vbCrLf
        strBody = strBody & "Company Name: " & CompanyName & vbCrLf
        'strBody = strBody & "State: " & Request.Form("State")	& vbCrLf		
        strBody = strBody & "Email: " & Email & vbCrLf
        'strBody = strBody & "Phone: " & Phone & vbCrLf		
        'strBody = strBody & "Contact me: " & contactme & vbCrLf				
        strBody = strBody & "Comment: " & MyTiap1 & vbCrLf
        'strBody = strBody & "Comment2: " & Request.Form("MyTiap") & vbCrLf		
        strBody = strBody & "IP Address= " & Session("IPAddress") & vbCrLf

        'From Mail
		myMail.From = Email
		
		Select case SupportType  
		    
		    case "CustomerService"
		        myMail.To = "support@criminal-records-search.com"
				strBody = "Support Type: "& SupportType & vbCrLf
		        strBody = strBody & "Name: "& NameBox & vbCrLf
		        strBody = strBody & "Company Name: " & CompanyName & vbCrLf
		        'strBody = strBody & "State: "  & Request.Form("State") & vbCrLf		
		        strBody = strBody & "Email: "& Email & vbCrLf
		        'strBody = strBody & "Phone: "& Phone & vbCrLf		
		       ' strBody = strBody & "Contact me: "& contactme & vbCrLf		
		        strBody = strBody & "Search ID: "  & Request.Form("SearchID") & vbCrLf	
		        strBody = strBody & "Country you ordered: "  & Request.Form("Country") & vbCrLf					
		        strBody = strBody & "Order Date: "  & Request.Form("OrderDate") & vbCrLf	
		        'strBody = strBody & "Reason: "  & Request.Form("Reason") & vbCrLf			
		        strBody = strBody & "Comment: "& MyTiap1 & vbCrLf		
		        strBody = strBody & "IP Address= " & Session("IPAddress") & vbCrLf
		    case "Sales"
		        myMail.To = "support@criminal-records-search.com"
		        strBody = "Support Type: "& SupportType & vbCrLf
		        strBody = strBody & "Name: "& NameBox & vbCrLf	
		        strBody = strBody & "Company Name: " & CompanyName & vbCrLf
		        strBody = strBody & "Email: "& Email & vbCrLf
		        'strBody = strBody & "Phone: "& Phone & vbCrLf		
		        'strBody = strBody & "Contact me: "& contactme & vbCrLf		
		        strBody = strBody & "Country you are interested in: "& Request.Form("Country") & vbCrLf & vbCrLf	
		        strBody = strBody & "Type of search: "& Request.Form("TypeofSearch") & vbCrLf & vbCrLf			
		        strBody = strBody & "Your questions: "& MyTiap1 & vbCrLf & vbCrLf		
		        strBody = strBody & "IP Address= " & Session("IPAddress") & vbCrLf
		    case "Others"
		        myMail.To = "support@criminal-records-search.com"
				strBody = "Support Type: "& SupportType & vbCrLf
		        strBody = strBody & "Name: "& NameBox & vbCrLf
		        strBody = strBody & "Company Name: " & CompanyName & vbCrLf
		       ' strBody = strBody & "State: "  & Request.Form("State") & vbCrLf		
		        strBody = strBody & "Email: "& Email & vbCrLf
		        'strBody = strBody & "Phone: "& Phone & vbCrLf		
		       ' strBody = strBody & "Contact me: "& contactme & vbCrLf		
		        strBody = strBody & "Country you are interested in: "  & Request.Form("Country") & vbCrLf							
		        strBody = strBody & "Comment: "& MyTiap1 & vbCrLf		
		        strBody = strBody & "IP Address= " & Session("IPAddress") & vbCrLf
		    case default
		        myMail.To = "support@criminal-records-search.com"
		End Select

		'objCDOMail.Subject = "Support request from Infocubic.net  " & SupportType
		myMail.Subject = "Support request from criminal-records-search.com  " & SupportType
		'myMail.TextBody = strBody 
		myMail.TextBody = strBody
		
		myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
'Name or IP of remote SMTP server
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "mail.criminal-records-search.com"
'Server port
myMail.Configuration.Fields.Item _
("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 25 

myMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 'basic (clear-text) authentication 
myMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") ="kaeli@criminal-records-search.com" 
myMail.Configuration.Fields.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") ="Cubic2011!"


myMail.Configuration.Fields.Update
myMail.Send
set myMail = nothing



If Err.Number = 0 Then
    response.redirect "thankyou.htm"
Else
    response.redirect "contact_us_err.asp?msg=" & Server.URLEncode(Err.Description)
End If


		
		'response.Write(Err.Description & ":")
End if


%>
<html><head>
<title>CRS Check- Criminal Background Check Service-Criminal Records Search</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="keywords" content="Criminal Background Check,Criminal Records,Texas, Florida, Illinois, Idaho, Iowa, New York">
<meta name="description" content="Online Criminal Records Search, Instant Criminal background check. Leading provider of instant criminal records and public records. Cover most states">
<meta name="abstract" content="Criminal background check, Criminal Records online. Leading provider of instant criminal records and public records.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="common-1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></SCRIPT>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
</script>
<script language="JavaScript">
<!--
function OpenCertDetails()
  {
  thewindow = window.open('https://www.thawte.com/cgi/server/certdetails.exe?code=USINTE761-2', 'anew', config='height=400,width=450,toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,directories=no,status=yes');
  }
function Redir(targ,selObj,restore){
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
  function mClk(src){
    if(event.srcElement.tagName=='TD')
      src.children.tags('A')[0].click();
  }

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
//-->
</script>
<script language="JavaScript">
<!--
<!--
var img = new Array;

img[0] = "images/topbg01.gif";
img[1] = "images/topbg02.gif";
function random_img(){
        var i = myrandom(img.length) - 1;
        document.write("<IMG SRC=\""+img[i]+"\">");
}
function myrandom(max){
        var v = max * Math.random();
        if(v == 0.0){v = 1;}else{v = Math.ceil(v);}
        return v;
}
// -->
//-->
</script>
<script type="text/javascript">

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
</script>

<!-- Start of crschecks Zendesk Widget script -->
<script id="ze-snippet" src="https://static.zdassets.com/ekr/snippet.js?key=9e306e8d-ce05-49b3-97f1-73ae6d725751"> </script>
<script type="text/javascript">
  window.zESettings = {
    webWidget: {
      launcher: {
        label: {
          'en-US': 'Contact Us',
        }
      }
    }
  };
</script>
<!-- End of crschecks Zendesk Widget script -->
<script type="text/javascript" src="/script.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/scriptnew.js"></script>
<script src="js/datepicker-custom.js" type="text/javascript"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script>
$(function() {
  var offsetY = -10;
  var time = 2000;

  $('a[href^=#]').click(function() {
    var target = $(this.hash);
    if (!target.length) return ;
    var targetY = target.offset().top+offsetY;
    $('html,body').animate({scrollTop: targetY}, time, 'swing');
    window.history.pushState(null, null, this.hash);
    return false;
  });
});
</script>
<script type="text/javascript">

jQuery(document).ready(function($){
  
  $(".hide").hide();
  
  $("#SupportType").val($("#SupportType").val()); 
  
  $("#SupportType").change( function() {
    var currentVal = $(this).val();
    $(".supportForm-toggle").not("." + currentVal + "-toggle").slideUp("fast", function() {
      $(".supportForm-toggle."+currentVal+"-toggle").hide().slideDown("fast");
    });
  });
});
</script>
    <script type="text/javascript" src="/js/jquery.ihavecookies.js"></script>
    <script type="text/javascript">
    var options = {
        message: 'By using this website, you agree to our use of cookies. We use cookies to provide you with a great experience and to help our website run effectively.',
        delay: 600,
        expires: 1,
        link: 'privacy-page.asp#cookies',
        onAccept: function(){
            var myPreferences = $.fn.ihavecookies.cookie();
            console.log('Yay! The following preferences were saved...');
            console.log(myPreferences);
        },
        uncheckBoxes: true,
        moreInfoLabel: 'More information',
    }

    $(document).ready(function() {
        $('body').ihavecookies(options);

        if ($.fn.ihavecookies.preference('marketing') === true) {
            console.log('This should run because marketing is accepted.');
        }

        $('#ihavecookiesBtn').on('click', function(){
            $('body').ihavecookies(options, 'reinit');
        });
    });

    </script>
    <link href="cookies.css" rel="stylesheet">
    <script type='text/javascript'>
  window.smartlook||(function(d) {
    var o=smartlook=function(){ o.api.push(arguments)},h=d.getElementsByTagName('head')[0];
    var c=d.createElement('script');o.api=new Array();c.async=true;c.type='text/javascript';
    c.charset='utf-8';c.src='https://rec.smartlook.com/recorder.js';h.appendChild(c);
    })(document);
    smartlook('init', '18feec78a2b7db885920071fda4c5f8864eff6e5');
</script>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
<div class="site-home">
  <div class="wrap" style="margin: 30px auto 18px;">


    <div class="title-area">        <span class="site-title" itemprop="headline"><a href="#top"><img src="images/Logo-CRS-checks.png" alt="Online criminal records search for 50 states" border="0"></a></span>
        </div>
        <div class="widget-area header-widget-area">
          <div class="widget-wrap-header">
              <ul class="nav-menu">
                     <li class="menu-item"><a href="#top" class="topMenuText">Home</a></li>
                   <li class="menu-item"><a href="#pricing" class="topMenuText">Products</a></li>                  
                     <li class="menu-item"><a href="https://crschecks.zendesk.com/hc/en-us" class="topMenuText">FAQs</a></li>
                     <li class="menu-item  active"><a href="about-us.asp" class="topMenuText">About Us</a></li>
                     <li class="menu-item"><a href="javascript:$zopim.livechat.window.show();" class="topMenuText">Contact Us</a></li>
                     <li class="menu-item get-started"><a href="search-by-countries.asp" class="topMenuText">Order Now</a></li> 
                </ul>
            </div>        
        </div>

         

      </div></div>

<div id="top"></div>

<div id="aboutus"><div class="pagewrap"><div class="aboutleft">
  <div class="textwidget_sub" style="width: 100%;"><h1><p>ABOUT US</p></h1><h2 class="site-description" itemprop="description">Online Criminal Records Search, Instant Criminal background check</h2></div>
    <div class="txtNew" id="about-title"><h4 class="font_4" style="line-height:1.2em;"><span></span></h4></div>
    <div style="width: 571px;" class="txtNew" id="about-text"><p class="font_8" style="line-height:1.7em;"><span style="letter-spacing:0.02em;"></span></p>

<p class="font_8" style="line-height:1.7em;"><span style="letter-spacing:0.02em;">&#8203;</span></p>

</div></div>
    </div> </div>

<div id="outside">
  <div class="inner">
    <p class="subtext">Since 2002, CRS Checks has been a leading provider of international background check services throughout the globe. Located in the United States at the foot of the beautiful Rocky Mountains in Colorado, we’ve developed a trusted and unrivaled research network across the world capable of providing accurate and timely background check results in over 200 countries and territories. Our founders have over six decades of experience in the background check and due diligence screening industry. Whether you need employment and education verifications, criminal records, credit reports, civil searches and much more you can be sure that when using CRS Checks you are using the best in the industry. </p>
<div class="left"><img src="/images/company-outside-image.jpg" width="490">
<div class="office-info">
<b>Head office</b><br/>
<p class="font_7">116 Inverness Drive East Suite 206<br> Englewood CO 80112 USA<br></p>
</div>
</div>
<div class="right"><div tabindex="0" title="Google Maps" aria-label="Google Maps" style="left:0;margin-left:0;width:100%;min-width:initial;height:349px;" class="feature map" id="comp-iruclotv">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3075.1590961945813!2d-104.86904008424433!3d39.57856461410871!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x876c85e997e6ac31%3A0xfbdbdc2911999f46!2s116%20Inverness%20Dr%20E%2C%20Englewood%2C%20CO%2080112!5e0!3m2!1sen!2sus!4v1569608004246!5m2!1sen!2sus" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
</div></div>
    </div>
 </div> 

</div>


<div class="" id="credit" ><div class="wrap" style="margin: 0 auto;padding: 0;"><div class="title-area"><p class="font_8" style="line-height:1.7em; text-align:left;"><span class="font_10">&#169; <script type="text/javascript">
document.write(new Date().getFullYear())
</script> CRS Checks LLC. All rights reserved.</span></p><p class="font_10" style="line-height:1.7em;"><span style="letter-spacing:0.02em;color: #000;">116 Inverness Drive East Suite 206 Englewood CO 80112 USA</span></p><p></p>
</div>
<div class="widget-area header-widget-area">
          <div class="widget-wrap">
              <ul class="nav-menu">
                    <li class="menu-item"><a href="#top" class="topMenuText">Home</a></li>
                  <li class="menu-item"><a href="products-page1.asp" class="topMenuText">Products</a></li>                  
                    <li class="menu-item"><a href="https://crschecks.zendesk.com/hc/en-us" class="topMenuText">FAQs</a></li>
                    <li class="menu-item"><a href="about-us.asp" class="topMenuText active">About Us</a></li>
                    <li class="menu-item"><a href="javascript:$zopim.livechat.window.show();" class="topMenuText">Contact Us</a></li>
                    <li class="menu-item"><a href="privacy-page.asp" class="topMenuText">Privacy</a></li>
                    <li class="menu-item"><div class="AuthorizeNetSeal" style="float: right;"> <script type="text/javascript" language="javascript">var ANS_customer_id="ca535f00-eecc-4c71-abe0-386206cbfd53";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net/anetseal/seal.js"></script><style type="text/css">
div.AuthorizeNetSeal{text-align:center;margin:0;padding:0;width:90px;font:normal 9px arial,helvetica,san-serif;line-height:10px;}
div.AuthorizeNetSeal a{text-decoration:none;color:black;}
div.AuthorizeNetSeal a:visited{color:black;}
div.AuthorizeNetSeal a:active{color:black;}
div.AuthorizeNetSeal a:hover{text-decoration:underline;color:black;}
div.AuthorizeNetSeal a img{border:0px;margin:0px;text-decoration:none;}
</style>
  </div></li>
                </ul>
            </div>        
        </div>
</div>
</div> 
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75838621-1', 'auto');
  ga('send', 'pageview');

</script>