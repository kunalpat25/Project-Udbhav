<%@page import="mybeans.*"%>
<html>
        <head>
                <link rel="stylesheet" href="/udbhav/css/styles.css"> 
                <link rel="stylesheet" href="/udbhav/css/scroll-to-top.css">
                <script src="/udbhav/js/jquery.js"></script>
                <script src="/udbhav/js/scroll-to-top.js"></script>
            </head>
           
                
            <div id="head" class="container">
                    <img class="bgimage" src="/udbhav/images/grass2.jpeg" alt="udbhav" style="width:100%;height:40% ;">
                    <div id="head1" class="top-left"><h1 class="shadow" >UDBHAV PRESENTS</h1></div>
                    <div id="head2" class="main-heading"><h2 class="shadow" >AUTOMATION OF DRIP IRRIGATION</h2></div>
                </div>
            <div class="navbar">
                <ul>
                    <li><a class="active" href="/udbhav/index.jsp">Home</a></li>
                    <li><a href="/udbhav/html/working.html">Working</a></li>
                    <li><a href="/udbhav/html/gallery.html">Gallery</a></li>
                    <li><a href="#">Let's Talk</a></li>
                    <li><a href="/udbhav/html/help.html">Help</a></li>
                    <li style="float:right"><a href="/udbhav/html/Register.html">Register</a></li>
                </ul>
            </div>
    <body>
<div id="main-div"  style="align-self:center; margin-top: 5%; margin-left: 17%; margin-right: 17%; margin-bottom: 20%;">
        <%

        String fn,ln,un,mo,em,db,gn,st,dst,tq,cp,ar,status;
        
        fn = request.getParameter("TxtFName");
        ln = request.getParameter("TxtLName");
        un = request.getParameter("TxtUsername");
        mo = request.getParameter("TxtMobno");
        em = request.getParameter("TxtEmail");
        db = request.getParameter("TxtDate");
        gn = request.getParameter("Gender");
        st = request.getParameter("DdlState");
        dst = request.getParameter("DdlDistrict");
        tq = request.getParameter("DdlTaluka");
        cp = request.getParameter("TxtCrop");
        ar = request.getParameter("TxtArea");

        
        RegisterUser reg = new RegisterUser();
        reg.setFname(fn);
        reg.setLname(ln);
        reg.setUsername(un);
        reg.setMobno(mo);
        reg.setEmail(em);
        reg.setDob(db);
        reg.setGender(gn);
        reg.setState(st);
        reg.setDistrict(dst);
        reg.setTaluka(tq);
        reg.setCrop(cp);
        reg.setArea(ar);
        status=reg.getStatus();
        if(status.equalsIgnoreCase("successful"))
            {
                %>
                <h2 style="color:forestgreen; font-style: bold;">Welcome <%=gn.equals("male")?"Mr.":"Mrs."%> <%=un%> to Udbhav Automations. Your registration is <%=status%>. Our team will reach you soon. Stay Connected. Thank you!</h2>
                <%
            }
            else
            {
                %>
                <h2 style="color:red; font-style: bold;">Sorry! Registration <%=status%>..</h2>
                <%
            }          

        %>
    </div>
        <a id="back2Top" title="Back to top" href="#">&#10148;</a>
    </body>
    <div id="footer" class="footer-div">
            <div id="footer-div-top" class="footer-div-top">
                <ul>
                    <li><a href="#">About Us&nbsp;&nbsp;&nbsp;|</a></li>
                    <li><a href="#">Contact Us&nbsp;&nbsp;&nbsp;|</a></li>
                    <li><a href="#">Blog&nbsp;&nbsp;&nbsp;|</a></li>
                    <li><a href="/udbhav/html/termsandco.html">Terms and Conditions</a></li>
                    <li style="float:right;"><a href="mailto:projectudbhav5@gmail.com">projectudbhav5@gmail</a></li>
                </ul>
            </div>
            <div id="footer-div-bottom" class="footer-div-bottom">
              <span class="copyright"><h3 >&copy; 2019 Udbhav. All Rights Reserved</h3></span>
              <span class="stayconnected"><h3>Stay Connected</h3>  <br> 
                  <ul>
                  <li><a href="https://www.youtube.com/channel/UCP0cz4_fZfS6NXnZ6W3sszQ"><img  src="/udbhav/images/youtube-logo.png" alt="youtube"></a></li>
               <li><a href="https://twitter.com/ProjectUdbhav"><img src="/udbhav/images/twitter-logo.png" alt="twitter"></a> </li>
               <li><a href="https://www.facebook.com/Udbhav-355349738522932/?modal=admin_todo_tour"><img src="/udbhav/images/fb-logo.png" alt="facebook"></a></li>
               <li><a href="#"><img src="/udbhav/images/google-logo.png" alt="google"></a></li>
              </ul>            
              </span>
            </div>
    
        </div>
</html>