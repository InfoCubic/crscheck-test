<%

Dim IPAddress, SupportType, Email, Phone, State, contactme, MyTiap1, NameBox, MyTiap, MyTiap2
'2013/04/05 T.Ohnishi@MIS add start
Dim sReferrer, bDrugPage
sReferrer = Request.ServerVariables("HTTP_REFERER")

'add end


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
        'strBody = strBody & "State: " & Request.Form("State")  & vbCrLf    
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
    response.redirect "thankyou1.htm"
Else
    response.redirect "contact_us_err.asp?msg=" & Server.URLEncode(Err.Description)
End If


    
    'response.Write(Err.Description & ":")
End if


%>
<!DOCTYPE html>
<html lang="en"><head>
<title>About Us | International Background Check Services</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta name="keywords" content="International background check services">
<meta name="description" content="CRS Checks has been a leading provider of international background check services since 2002.">
<meta name="abstract" content="International criminal background check. Online public record searches. Leading provider of international criminal, education and employment records.">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="common-1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="script.js"></SCRIPT>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="canonical" href="https://criminal-records-search.com/company-page.asp" />
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

<script src="js/jquery-ui-1.8.6.custom.min.js" type="text/javascript"></script>
<script src="js/datepicker-custom.js" type="text/javascript"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:400" rel="stylesheet">
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
  <div class="wrap header">


    <div class="title-area">        <span class="site-title" itemprop="headline"><a href="/"><img src="images/CRS-check-logo.svg" alt="Online criminal records search for 200 plus countries" border="0"></a></span>
        </div>
        <div class="widget-area header-widget-area">
          <div class="widget-wrap-header">
              <ul class="nav-menu">
                     <li class="menu-item"><a href="/" class="topMenuText">Home</a></li>
                     <li class="menu-item"><a href="/international-criminal-search.asp" class="topMenuText">Products</a>
                           <ul>
                              <li><a href="/international-criminal-search.asp">International Criminal Search</a></li>
                              <li><a href="/international-education-verification.asp">International Education Verification</a></li>
                              <li><a href="/international-employment-verification.asp">International Employment Verification</a></li>
                              <li><a href="/international-police-certificate.asp">International Police Certificate</a></li>
                              <li><a href="/global-terrorist-sanctions-list-search.asp">Global Terrorist & Sanctions List Search</a></li>
                              <li><a href="/social-media.asp">International Social Media</a></li>
                              <li><a href="/international-bisiness-report.asp">International Business Credit Reports</a></li>
                          </ul>
                     </li>                  
                     <li class="menu-item"><a href="https://crschecks.zendesk.com/hc/en-us" class="topMenuText">FAQs</a></li>
                     <li class="menu-item"><a href="company-page.asp" class="topMenuText  active">About Us</a></li>
                     <li class="menu-item"><a href="https://crschecks.zendesk.com/hc/en-us/requests/new" class="topMenuText">Contact Us</a></li>
                     <li class="menu-item get-started"><a href="search-by-countries.asp" class="topMenuText startorder">Start Order</a></li> 
                </ul>
            </div>        
        </div>

         

      </div></div>

<div id="top"></div>

<div id="aboutus"><div class="pagewrap"><div class="aboutleft">
  <div class="textwidget_sub" ><h1><p>About Us<span>International Background checks</span></p></h1><h2 class="site-description" itemprop="description">Online Criminal Records Search, Instant Criminal background check</h2></div>
  </div>
    </div> </div>

<div id="outside">
  <div class="inner">

<div class="left"><img src="/images/company-outside-image.jpg" width="490" alt="CRS-checks-office">
<div class="office-info">
<b>Headquarters</b><br/>
<p class="font_7">116 Inverness Drive East Suite 206<br> Englewood CO, 80112 USA<br></p>
</div>
</div>
<div class="right">    <p class="subtext">CRS Checks has been a leading provider of international background check services since 2002. Located in the United States at the foot of Colorado's beautiful Rocky Mountains, we have built a trusted and unrivaled research network across over 200 countries and territories providing accurate and timely background check results. Our founders have over six decades of experience in the background check and due diligence screening industry. Whether you need employment and education verifications, criminal records, credit reports, or civil searches, you can be sure that you are using the best in the industry with CRS Checks. </p>



<section id="text-4" class="widget widget_text">
<div class="widget-wrap">
<div class="textwidget_sub contact"><p class="subtext">CONTACT FORM</p></div>

 <div class="contactright">
<form method="post" action="index.asp" name="form1" onSubmit="return">
      
      <div >
          <table id="contact_tbl" class="contact_tbl">
            <tbody><tr id="selectSupport">
                <td>     <div class="contactform">           
                                       <select id="SupportType" name="SupportType" class="srchBox" required style="width: 251px;">
                        <option value="CustomerService">Customer Service</option>
                        <option value="Sales">Sales</option>
                        <option value="Others">Other</option>
                    </select>
                   </div></td>
                            <td>
                            <input type="text" id="NameBox" name="NameBox" class="srchBox CustomerService-toggle Sales-toggle Others-toggle supportForm-toggle" value="<%=Session("NameBox") %>" placeholder="Your Name" required />
                            </td>
                <td><input type="text" id="CompanyName" name="CompanyName" class="srchBox CustomerService-toggle Sales-toggle Others-toggle supportForm-toggle" placeholder="Company Name" /></td>
                </tr>
              <tr>
                <td><input type="text" id="EmailBox" name="EmailBox" class="srchBox CustomerService-toggle Sales-toggle Others-toggle supportForm-toggle" placeholder="Email" required /></td>
                <td><select id="Country" name="Country" class="srchBox Sales-toggle Others-toggle supportForm-toggle hide" >
                        <option value="">Select a country to get started</option>
<option value="order_net/form/afghanistan.asp">Afghanistan</option>
<option value="order_net/form/albania.asp">Albania</option>
<option value="order_net/form/algeria.asp">Algeria</option>
<option value="order_net/form/americansamoa.asp">American Samoa</option>
<option value="order_net/form/andorra.asp">Andorra</option>
<option value="order_net/form/angola.asp">Angola</option>
<option value="order_net/form/antigua.asp">Antigua</option>
<option value="order_net/form/argentina.asp">Argentina</option>
<option value="order_net/form/armenia.asp">Armenia</option>
<option value="order_net/form/aruba.asp">Aruba</option>
<option value="order_net/form/australia.asp">Australia</option>
<option value="order_net/form/austria.asp">Austria</option>
<option value="order_net/form/azerbaijan.asp">Azerbaijan</option>
<option value="order_net/form/bahamas.asp">Bahamas</option>
<option value="order_net/form/bahrain.asp">Bahrain</option>
<option value="order_net/form/bangladesh.asp">Bangladesh</option>
<option value="order_net/form/barbados.asp">Barbados</option>
<option value="order_net/form/belarus.asp">Belarus</option>
<option value="order_net/form/belgium.asp">Belgium</option>
<option value="order_net/form/belize.asp">Belize</option>
<option value="order_net/form/benin.asp">Benin</option>
<option value="order_net/form/bermuda.asp">Bermuda</option>
<option value="order_net/form/bhutan.asp">Bhutan</option>
<option value="order_net/form/bolivia.asp">Bolivia</option>
<option value="order_net/form/bosniaandhercegovina.asp">Bosnia and Herzegovina</option>
<option value="order_net/form/botswana.asp">Botswana</option>
<option value="order_net/form/brazil.asp">Brazil</option>
<option value="order_net/form/brunei.asp">Brunei</option>
<option value="order_net/form/bulgaria.asp">Bulgaria</option>
<option value="order_net/form/burkinafaso.asp">Burkina Faso</option>
<option value="order_net/form/burundi.asp">Burundi</option>
<option value="order_net/form/cambodia.asp">Cambodia</option>
<option value="order_net/form/Cameroon.asp">Cameroon</option>
<option value="order_net/form/canada.asp">Canada</option>
<option value="order_net/form/capeverde.asp">Cape Verde</option>
<option value="order_net/form/caymanislands.asp">Cayman Islands</option>
<option value="order_net/form/centralafricanrepublic.asp">Central African Republic</option>
<option value="order_net/form/chad.asp">Chad</option>
<option value="order_net/form/chile.asp">Chile</option>
<option value="order_net/form/china.asp">China</option>
<option value="order_net/form/colombia.asp">Colombia</option>
<option value="order_net/form/comoros.asp">Comoros</option>
<option value="order_net/form/congo_dem.asp">Congo(Dem. Republic of)</option>
<option value="order_net/form/congo_republic.asp">Congo(Republic of)</option>
<option value="order_net/form/cookislands.asp">Cook Islands</option>
<option value="order_net/form/costarica.asp">Costa Rica</option>
<option value="order_net/form/croatia.asp">Croatia</option>
<option value="order_net/form/cuba.asp">Cuba</option>
<option value="order_net/form/curacao.asp">Curacao</option>
<option value="order_net/form/cyprus.asp">Cyprus</option>
<option value="order_net/form/czecho.asp">Czech Republic</option>
<option value="order_net/form/denmark.asp">Denmark</option>
<option value="order_net/form/djibouti.asp">Djibouti</option>
<option value="order_net/form/dominica.asp">Dominica</option>
<option value="order_net/form/dominicanrepublic.asp">Dominican Republic</option>
<option value="order_net/form/easttimor.asp">East Timor</option>
<option value="order_net/form/ecuador.asp">Ecuador</option>
<option value="order_net/form/egypt.asp">Egypt</option>
<option value="order_net/form/elsalvador.asp">El Salvador</option>
<option value="order_net/form/equitorialguinea.asp">Equatorial Guinea</option>
<option value="order_net/form/eritrea.asp">Eritrea</option>
<option value="order_net/form/estonia.asp">Estonia</option>
<option value="order_net/form/ethiopia.asp">Ethiopia</option>
<option value="order_net/form/faroeislands.asp">Faroe Islands</option>
<option value="order_net/form/federatedstatesofmicronesia.asp">Federated States of Micronesia</option>
<option value="order_net/form/fiji.asp">Fiji</option>
<option value="order_net/form/finland.asp">Finland</option>
<option value="order_net/form/france.asp">France</option>
<option value="order_net/form/frenchguiana.asp">French Guiana</option>
<option value="order_net/form/frenchpolynesia.asp">French Polynesia</option>
<option value="order_net/form/french-southern-territories.asp">French Southern Territories</option>
<option value="order_net/form/gabon.asp">Gabon</option>
<option value="order_net/form/gambia.asp">Gambia</option>
<option value="order_net/form/georgia.asp">Georgia</option>
<option value="order_net/form/germany.asp">Germany</option>
<option value="order_net/form/ghana.asp">Ghana</option>
<option value="order_net/form/gibraltar.asp">Gibraltar</option>
<option value="order_net/form/greece.asp">Greece</option>
<option value="order_net/form/greenland.asp">Greenland</option>
<option value="order_net/form/grenada.asp">Grenada</option>
<option value="order_net/form/Guadeloupe.asp">Guadeloupe</option>
<option value="order_net/form/guam.asp">Guam</option>
<option value="order_net/form/guatemala.asp">Guatemala</option>
<option value="order_net/form/guinea.asp">Guinea</option>
<option value="order_net/form/guineabissau.asp">Guinea Bissau</option>
<option value="order_net/form/guyana.asp">Guyana</option>
<option value="order_net/form/haiti.asp">Haiti</option>
<option value="order_net/form/honduras.asp">Honduras</option>
<option value="order_net/form/hongkong.asp">Hong Kong</option>
<option value="order_net/form/hungary.asp">Hungary</option>
<option value="order_net/form/iceland.asp">Iceland</option>
<option value="order_net/form/india.asp">India</option>
<option value="order_net/form/indonesia.asp">Indonesia</option>
<option value="order_net/form/iran.asp">Iran</option>
<option value="order_net/form/ireland.asp">Ireland</option>
<option value="order_net/form/isleofMan.asp">Isle of Man</option>
<option value="order_net/form/israel.asp">Israel</option>
<option value="order_net/form/italy.asp">Italy</option>
<option value="order_net/form/ivoryCoast.asp">Ivory Coast</option>
<option value="order_net/form/jamaica.asp">Jamaica</option>
<option value="order_net/form/japan.asp">Japan</option>
<option value="order_net/form/jersey.asp">Jersey</option>
<option value="order_net/form/jordan.asp">Jordan</option>
<option value="order_net/form/kazakhstan.asp">Kazakhstan</option>
<option value="order_net/form/kenya.asp">Kenya</option>
<option value="order_net/form/kiribati.asp">Kiribati</option>
<option value="order_net/form/northkorea.asp">Korea, Republic Of</option>
<option value="order_net/form/kuwait.asp">Kuwait</option>
<option value="order_net/form/kyrgyzrepublic.asp">Kyrgyz Republic</option>
<option value="order_net/form/laos.asp">Laos</option>
<option value="order_net/form/latvia.asp">Latvia</option>
<option value="order_net/form/lebanon.asp">Lebanon</option>
<option value="order_net/form/lesotho.asp">Lesotho</option>
<option value="order_net/form/liberia.asp">Liberia</option>
<option value="order_net/form/libya.asp">Libya</option>
<option value="order_net/form/liechtenstein.asp">Liechtenstein</option>
<option value="order_net/form/lithuania.asp">Lithuania</option>
<option value="order_net/form/luxembourg.asp">Luxembourg</option>
<option value="order_net/form/macau.asp">Macau</option>
<option value="order_net/form/madagascar.asp">Madagascar</option>
<option value="order_net/form/malawi.asp">Malawi</option>
<option value="order_net/form/malaysia.asp">Malaysia</option>
<option value="order_net/form/maldives.asp">Maldives</option>
<option value="order_net/form/mali.asp">Mali</option>
<option value="order_net/form/malta.asp">Malta</option>
<option value="order_net/form/marianaislands.asp">Mariana Islands</option>
<option value="order_net/form/marshallislands.asp">Marshall Islands</option>
<option value="order_net/form/martinique.asp">Martinique</option>
<option value="order_net/form/mauritania.asp">Mauritania</option>
<option value="order_net/form/mauritius.asp">Mauritius</option>
<option value="order_net/form/mexico.asp">Mexico</option>
<option value="order_net/form/moldova.asp">Moldova</option>
<option value="order_net/form/monaco.asp">Monaco</option>
<option value="order_net/form/mongolia.asp">Mongolia</option>
<option value="order_net/form/serbiamontenegro.asp">Montenegro</option>
<option value="order_net/form/montserrat.asp">Montserrat</option>
<option value="order_net/form/morocco.asp">Morocco</option>
<option value="order_net/form/mozambique.asp">Mozambique</option>
<option value="order_net/form/myanmar.asp">Myanmar</option>
<option value="order_net/form/namibia.asp">Namibia</option>
<option value="order_net/form/nauru.asp">Nauru</option>
<option value="order_net/form/nepal.asp">Nepal</option>
<option value="order_net/form/netherlands.asp">Netherlands</option>
<option value="order_net/form/newzealand.asp">New Zealand</option>
<option value="order_net/form/nicaragua.asp">Nicaragua</option>
<option value="order_net/form/niger.asp">Niger</option>
<option value="order_net/form/nigeria.asp">Nigeria</option>
<option value="order_net/form/niue.asp">Niue</option>
<option value="order_net/form/norway.asp">Norway</option>
<option value="order_net/form/macedonia.asp">North Macedonia</option>
<option value="order_net/form/oman.asp">Oman</option>
<option value="order_net/form/pakistan.asp">Pakistan</option>
<option value="order_net/form/palau.asp">Palau</option>
<option value="order_net/form/panama.asp">Panama</option>
<option value="order_net/form/papuanewguinea.asp">Papua New Guinea</option>
<option value="order_net/form/paraguay.asp">Paraguay</option>
<option value="order_net/form/peru.asp">Peru</option>
<option value="order_net/form/philippines.asp">Philippines</option>
<option value="order_net/form/poland.asp">Poland</option>
<option value="order_net/form/portugal.asp">Portugal</option>
<option value="order_net/form/puertorico.asp">Puerto Rico</option>
<option value="order_net/form/qatar.asp">Qatar</option>
<option value="order_net/form/reunion.asp">Reunion</option>
<option value="order_net/form/romania.asp">Romania</option>
<option value="order_net/form/russia.asp">Russia</option>
<option value="order_net/form/rwanda.asp">Rwanda</option>
<option value="order_net/form/saintlucia.asp">Saint Lucia</option>
<option value="order_net/form/saintmartin.asp">Saint Martin</option>
<option value="order_net/form/samoa.asp">Samoa</option>
<option value="order_net/form/saudiarabia.asp">Saudi Arabia</option>
<option value="order_net/form/scotland.asp">Scotland</option>
<option value="order_net/form/senegal.asp">Senegal</option>
<option value="order_net/form/serbia.asp">Serbia</option>
<option value="order_net/form/seychelles.asp">Seychelles</option>
<option value="order_net/form/sierraleone.asp">Sierra Leone</option>
<option value="order_net/form/singapore.asp">Singapore</option>
<option value="order_net/form/slovakia.asp">Slovakia</option>
<option value="order_net/form/slovenia.asp">Slovenia</option>
<option value="order_net/form/solomonislands.asp">Solomon Islands</option>
<option value="order_net/form/southafrica.asp">South Africa</option>
<option value="order_net/form/korea.asp">South Korea</option>
<option value="order_net/form/spain.asp">Spain</option>
<option value="order_net/form/saintbarthelemy.asp">St. Barthelemy</option>
<option value="order_net/form/sainthelena.asp">St. Helena, Ascension and Tristan Da Cunha</option>
<option value="order_net/form/stkitts.asp">St. Kitts Nevis</option>
<option value="order_net/form/srilanka.asp">Sri Lanka</option>
<option value="order_net/form/saintlucia.asp">St. Lucia</option>
<option value="order_net/form/saintmartin.asp">St. Martin</option>
<option value="order_net/form/saintpierre.asp">St. Pierre And Miquelon  </option>
<option value="order_net/form/stvincentandgrenadines.asp">St. Vincent and Grenadines</option>
<option value="order_net/form/sudan.asp">Sudan</option>
<option value="order_net/form/suriname.asp">Suriname</option>
<option value="order_net/form/sweden.asp">Sweden</option>
<option value="order_net/form/switzerland.asp">Switzerland</option>
<option value="order_net/form/syria.asp">Syria</option>
<option value="order_net/form/taiwan.asp">Taiwan</option>
<option value="order_net/form/tajikistan.asp">Tajikistan</option>
<option value="order_net/form/tanzania.asp">Tanzania</option>
<option value="order_net/form/thailand.asp">Thailand</option>
<option value="order_net/form/togo.asp">Togo</option>
<option value="order_net/form/tonga.asp">Tonga</option>
<option value="order_net/form/trinidadtobago.asp">Trinidad/Tobago</option>
<option value="order_net/form/tunisia.asp">Tunisia</option>
<option value="order_net/form/turkey.asp">Turkey</option>
<option value="order_net/form/turkmenistan.asp">Turkmenistan</option>
<option value="order_net/form/turkscaicosislands.asp">Turks and Caicos Islands</option>
<option value="order_net/form/tuvalu.asp">Tuvalu</option>
<option value="order_net/form/uganda.asp">Uganda</option>
<option value="order_net/form/ukraine.asp">Ukraine</option>
<option value="order_net/form/unitedarabemerates.asp">United Arab Emirates</option>
<option value="order_net/form/unitedKingdom.asp">United Kingdom</option>
<option value="order_net/form/uruguay.asp">Uruguay</option>
<option value="order_net/form/uzbekistan.asp">Uzbekistan</option>
<option value="order_net/form/vanuatu.asp">Vanuatu</option>
<option value="order_net/form/venezuela.asp">Venezuela</option>
<option value="order_net/form/vietnam.asp">Vietnam</option>
<option value="order_net/form/virginislands.asp">Virgin Islands UK</option>
<option value="order_net/form/virginislandsus.asp">Virgin Islands US</option>
<option value="order_net/form/wallisandfutuna.asp">Wallis and Futuna </option>
<option value="order_net/form/yemen.asp">Yemen</option>
<option value="order_net/form/zambia.asp">Zambia</option>
<option value="order_net/form/zimbabwe.asp">Zimbabwe</option>
                    </select>

                    <select id="Country" name="Country" class="srchBox CustomerService-toggle supportForm-toggle">
                        <option value="" disabled selected class="srchBox CustomerService-toggle Sales-toggle upportForm-toggle">Country you ordered</option>
                        <option value="Albania">Albania</option>
<option value="Algeria">Algeria</option>
<option value="American Samoa">American Samoa</option>
<option value="Andorra">Andorra</option>
<option value="Angola">Angola</option>
<option value="Antigua">Antigua</option>
<option value="Argentina">Argentina</option>
<option value="Armenia">Armenia</option>
<option value="Aruba">Aruba</option>
<option value="Australia">Australia</option>
<option value="Austria">Austria</option>
<option value="Azerbaijan">Azerbaijan</option>
<option value="Bahamas">Bahamas</option>
<option value="Bahrain">Bahrain</option>
<option value="Bangladesh">Bangladesh</option>
<option value="Barbados">Barbados</option>
<option value="Belarus">Belarus</option>
<option value="Belgium">Belgium</option>
<option value="Belize">Belize</option>
<option value="Benin">Benin</option>
<option value="Bermuda">Bermuda</option>
<option value="Bhutan">Bhutan</option>
<option value="Bolivia">Bolivia</option>
<option value="Bosnia and Herzegovina">Bosnia and Herzegovina</option>
<option value="Botswana">Botswana</option>
<option value="Brazil">Brazil</option>
<option value="Brunei">Brunei</option>
<option value="Bulgaria">Bulgaria</option>
<option value="Burkina Faso">Burkina Faso</option>
<option value="Burundi">Burundi</option>
<option value="Cambodia">Cambodia</option>
<option value="Cameroon">Cameroon</option>
<option value="Canada">Canada</option>
<option value="Cape Verde">Cape Verde</option>
<option value="Cayman Islands">Cayman Islands</option>
<option value="Central African Republic">Central African Republic</option>
<option value="Chad">Chad</option>
<option value="Chile">Chile</option>
<option value="China">China</option>
<option value="Colombia">Colombia</option>
<option value="Comoros">Comoros</option>
<option value="Congo(Dem. Republic of)">Congo(Dem. Republic of)</option>
<option value="Congo(Republic of)">Congo(Republic of)</option>
<option value="Cook Islands">Cook Islands</option>
<option value="Costa Rica">Costa Rica</option>
<option value="Croatia">Croatia</option>
<option value="Curacao">Curacao</option>
<option value="Cyprus">Cyprus</option>
<option value="Czech Republic">Czech Republic</option>
<option value="Denmark">Denmark</option>
<option value="Djibouti">Djibouti</option>
<option value="Dominica">Dominica</option>
<option value="Dominican Republic">Dominican Republic</option>
<option value="East Timor">East Timor</option>
<option value="Ecuador">Ecuador</option>
<option value="Egypt">Egypt</option>
<option value="El Salvador">El Salvador</option>
<option value="Equatorial Guinea">Equatorial Guinea</option>
<option value="Eritrea">Eritrea</option>
<option value="Estonia">Estonia</option>
<option value="Ethiopia">Ethiopia</option>
<option value="Federated States of Micronesia">Federated States of Micronesia</option>
<option value="Fiji">Fiji</option>
<option value="Finland">Finland</option>
<option value="France">France</option>
<option value="French Guiana">French Guiana</option>
<option value="French Polynesia">French Polynesia</option>
<option value="Gabon">Gabon</option>
<option value="Gambia">Gambia</option>
<option value="Georgia">Georgia</option>
<option value="Germany">Germany</option>
<option value="Ghana">Ghana</option>
<option value="Greece">Greece</option>
<option value="Greenland">Greenland</option>
<option value="Grenada">Grenada</option>
<option value="Guadeloupe">Guadeloupe</option>
<option value="Guam">Guam</option>
<option value="Guatemala">Guatemala</option>
<option value="Guinea">Guinea</option>
<option value="Guinea Bissau">Guinea Bissau</option>
<option value="Guyana">Guyana</option>
<option value="Haiti">Haiti</option>
<option value="Honduras">Honduras</option>
<option value="Hong Kong">Hong Kong</option>
<option value="Hungary">Hungary</option>
<option value="Iceland">Iceland</option>
<option value="India">India</option>
<option value="Indonesia">Indonesia</option>
<option value="Iran">Iran</option>
<option value="Ireland">Ireland</option>
<option value="Isle of Man">Isle of Man</option>
<option value="Israel">Israel</option>
<option value="Italy">Italy</option>
<option value="Ivory Coast">Ivory Coast</option>
<option value="Jamaica">Jamaica</option>
<option value="Japan">Japan</option>
<option value="Jordan">Jordan</option>
<option value="Kazakhstan">Kazakhstan</option>
<option value="Kenya">Kenya</option>
<option value="Kiribati">Kiribati</option>
<option value="Kuwait">Kuwait</option>
<option value="Kyrgyz Republic">Kyrgyz Republic</option>
<option value="Laos">Laos</option>
<option value="Latvia">Latvia</option>
<option value="Lebanon">Lebanon</option>
<option value="Lesotho">Lesotho</option>
<option value="Liberia">Liberia</option>
<option value="Libya">Libya</option>
<option value="Liechtenstein">Liechtenstein</option>
<option value="Lithuania">Lithuania</option>
<option value="Luxembourg">Luxembourg</option>
<option value="Macau">Macau</option>
<option value="Madagascar">Madagascar</option>
<option value="Malawi">Malawi</option>
<option value="Malaysia">Malaysia</option>
<option value="Maldives">Maldives</option>
<option value="Mali">Mali</option>
<option value="Malta">Malta</option>
<option value="Mariana Islands">Mariana Islands</option>
<option value="Marshall Islands">Marshall Islands</option>
<option value="Martinique">Martinique</option>
<option value="Mauritania">Mauritania</option>
<option value="Mauritius">Mauritius</option>
<option value="Mexico">Mexico</option>
<option value="Moldova">Moldova</option>
<option value="Monaco">Monaco</option>
<option value="Mongolia">Mongolia</option>
<option value="Montenegro">Montenegro</option>
<option value="Montserrat">Montserrat</option>
<option value="Morocco">Morocco</option>
<option value="Mozambique">Mozambique</option>
<option value="Myanmar">Myanmar</option>
<option value="Namibia">Namibia</option>
<option value="Nauru">Nauru</option>
<option value="Nepal">Nepal</option>
<option value="Netherlands">Netherlands</option>
<option value="New Zealand">New Zealand</option>
<option value="Nicaragua">Nicaragua</option>
<option value="Niger">Niger</option>
<option value="Nigeria">Nigeria</option>
<option value="Norway">Norway</option>
<option value="order_net/form/macedonia.asp">North Macedonia</option>
<option value="Oman">Oman</option>
<option value="Pakistan">Pakistan</option>
<option value="Palau">Palau</option>
<option value="Panama">Panama</option>
<option value="Papua New Guinea">Papua New Guinea</option>
<option value="Paraguay">Paraguay</option>
<option value="Peru">Peru</option>
<option value="Philippines">Philippines</option>
<option value="Poland">Poland</option>
<option value="Portugal">Portugal</option>
<option value="Puerto Rico">Puerto Rico</option>
<option value="Qatar">Qatar</option>
<option value="Romania">Romania</option>
<option value="Russia">Russia</option>
<option value="Rwanda">Rwanda</option>
<option value="Saint Lucia">Saint Lucia</option>
<option value="Saint Martin">Saint Martin</option>
<option value="Samoa">Samoa</option>
<option value="Saudi Arabia">Saudi Arabia</option>
<option value="Scotland">Scotland</option>
<option value="Senegal">Senegal</option>
<option value="Serbia">Serbia</option>
<option value="Seychelles">Seychelles</option>
<option value="Sierra Leone">Sierra Leone</option>
<option value="Singapore">Singapore</option>
<option value="Slovakia">Slovakia</option>
<option value="Slovenia">Slovenia</option>
<option value="Solomon Islands">Solomon Islands</option>
<option value="South Africa">South Africa</option>
<option value="South Korea">South Korea</option>
<option value="Spain">Spain</option>
<option value="Sri Lanka">Sri Lanka</option>
<option value="St. Kitts Nevis">St. Kitts Nevis</option>
<option value="St. Vincent and Grenadines">St. Vincent and Grenadines</option>
<option value="Sudan">Sudan</option>
<option value="Sweden">Sweden</option>
<option value="Switzerland">Switzerland</option>
<option value="Syria">Syria</option>
<option value="Taiwan">Taiwan</option>
<option value="Tajikistan">Tajikistan</option>
<option value="Tanzania">Tanzania</option>
<option value="Thailand">Thailand</option>
<option value="Tonga">Tonga</option>
<option value="Trinidad/Tobago">Trinidad/Tobago</option>
<option value="Tunisia">Tunisia</option>
<option value="Turkey">Turkey</option>
<option value="Turkmenistan">Turkmenistan</option>
<option value="Turks and Caicos Islands">Turks and Caicos Islands</option>
<option value="Tuvalu">Tuvalu</option>
<option value="Uganda">Uganda</option>
<option value="Ukraine">Ukraine</option>
<option value="United Arab Emirates">United Arab Emirates</option>
<option value="United Kingdom">United Kingdom</option>
<option value="Uruguay">Uruguay</option>
<option value="Uzbekistan">Uzbekistan</option>
<option value="Vanuatu">Vanuatu</option>
<option value="Venezuela">Venezuela</option>
<option value="Vietnam">Vietnam</option>
<option value="Virgin Islands UK">Virgin Islands UK</option>
<option value="Virgin Islands US">Virgin Islands US</option>
<option value="Yemen">Yemen</option>
<option value="Zambia">Zambia</option>
<option value="Zimbabwe">Zimbabwe</option>
                    </select>
                <textarea id="MyTiap2" name="MyTiap2" type="hidden"  rows="2" cols="4" class="supportForm-toggle"></textarea></td>
                <td >                    <select id="TypeofSearch" name="TypeofSearch" class="srchBox Sales-toggle supportForm-toggle hide">
                        <option value="" disabled selected> Type of search </option>
                        <option value="Criminal"> Criminal </option>
                        <option value="Civil"> Civil </option>
                        <option value="Bankruptcy"> Bankruptcy </option>
                        <option value="Verification Services"> Verification Services </option>
                        <option value="Others"> Others </option>
                    </select>
                      <input type="text" id="SearchID" name="SearchID" class="srchBox CustomerService-toggle supportForm-toggle supportForm-toggle" placeholder="Search ID">
                  </td>
              </tr>
              <tr><td colspan="3" ><input type="text" id="OrderDate" name="OrderDate" class="srchBox CustomerService-toggle supportForm-toggle" placeholder="Order Date"></td>
              </tr>
              <tr>
                 <td colspan="3" >
                    <textarea cols="40" rows="5" id="MyTiap1" name="MyTiap1" class="srchBox CustomerService-toggle Sales-toggle Others-toggle supportForm-toggle" placeholder="Your Question" ></textarea>
                </td>
              </tr>
              <tr>
                <td><p class="txt_C"><textarea type="hidden" id="MyTiap" name="MyTiap" rows="2" cols="4" class="supportForm-toggle"></textarea>
          </p></td>
                  <td><input type="submit" id="SubmitBtn" class="CustomerService-toggle Sales-toggle Others-toggle supportForm-toggle supportForm-toggle" name="Submit" value="Send"></td>
              <td><input type="reset" name="Reset" value="Reset" class="CustomerService-toggle Sales-toggle Others-toggle supportForm-toggle supportForm-toggle"></td>
              </tr>
            </tbody>
          </table>
          
      </div>
      </form>
</div></div>
</div></section>

</div>
    </div>
 </div> 
</div>

<div class="copyright">
<div class="wrap" >
<div class="widget-area header-widget-area">
          <div class="widget-wrap">
              <ul class="nav-menu">
                    <li class="menu-item"><a href="/" class="topMenuText">Home</a></li>
                    <li class="menu-item"><a href="/international-criminal-search.asp" class="topMenuText">Products</a></li>           
                    <li class="menu-item"><a href="https://crschecks.zendesk.com/hc/en-us" class="topMenuText">FAQs</a></li>
                    <li class="menu-item"><a href="company-page.asp" class="topMenuText active">About Us</a></li>
                    <li class="menu-item"><a href="https://crschecks.zendesk.com/hc/en-us/requests/new" class="topMenuText">Contact Us</a></li>
                    <li class="menu-item"><a href="privacy-page.asp" class="topMenuText">Privacy</a></li>
                    <li class="menu-item">  <!-- (c) 2005, 2021. Authorize.Net is a registered trademark of CyberSource Corporation --> <div class="AuthorizeNetSeal"> <script type="text/javascript" language="javascript">var ANS_customer_id="ca535f00-eecc-4c71-abe0-386206cbfd53";</script> <script type="text/javascript" language="javascript" src="//verify.authorize.net:443/anetseal/seal.js" ></script> </div></li>
                </ul>
            </div>        
        </div>
  <p class="font_8 footer"><span class="font_10">&#169; <script type="text/javascript">
document.write(new Date().getFullYear())
</script> CRS Checks LLC. All rights reserved.</span></p><p></p>
</div>
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-75838621-1', 'auto');
  ga('send', 'pageview');
</script>

</body></html>