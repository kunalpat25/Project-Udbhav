<%@page import="mybeans.*"%>
<%@page import="java.sql.*"%>
<html>
        <head>
                <link rel="stylesheet" href="/udbhav/css/styles.css">
                <link rel="stylesheet" href="/udbhav/css/gallery.css">
                <link rel="stylesheet" href="lightbox.min.css">
                <script src="lightbox-plus-jquery.min.js"> </script>
                <script src="/udbhav/js/jquery.js"></script>
                <script src="/udbhav/js/scroll-to-top.js"></script>
                <link rel="stylesheet" href="/udbhav/css/scroll-to-top.css">
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
                    <li style="float:right"><a href="#">Register</a></li>
                </ul>
            </div>
    <center><div id="main-div" style="height:800px; margin-left:17%; margin-right:17%; width:800px;"></div></center>
        <%
            String nm,em,fb,xp,ui,ftr,nvg;
            int rtg;

            nm=request.getParameter("name");
            em=request.getParameter("email");
            fb=request.getParameter("feedback");
            xp=request.getParameter("experience");
            ui=request.getParameter("userInterface");
            ftr=request.getParameter("features");
            nvg=request.getParameter("navigation");
            rtg = Integer.parseInt(request.getParameter("rating"));

            
            Connection con;
            int no=0;
            PreparedStatement pst;
            
            try
            {
                DBConnector dbc = new DBConnector();
                con = dbc.getDbconnection();
                pst = con.prepareStatement("insert into feedback values(?,?,?,?,?,?,?,?);");
                pst.setString(1,nm);
                pst.setString(2,em);
                pst.setString(3,fb);
                pst.setString(4,xp);
                pst.setString(5,ui);
                pst.setString(6,ftr);
                pst.setString(7,nvg);
                pst.setInt(8,rtg);
                no = pst.executeUpdate();
                if(no>0)
                {
                    %>
                    <h2 style="color:rgb(10,200,30)">Feedback Sent Successfully. Thank you for giving your valuable time and reponse to us. Stay Connected<br> Team Udbhav</h2>
                    <%
                }
                else
                {
                    %>
                    <h2 style="color:red">Sorry, feedback could not be sent. Please try again!<br> Team Udbhav</h2>
                    <%
                }
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
        </div>
      <div id="footer" class="footer-div">
            <div id="footer-div-top" class="footer-div-top">
                <ul>
                    <li><a href="/udbhav/html/about-us.html">About Us&nbsp;&nbsp;&nbsp;|</a></li>
                    <li><a href="/udbhav/html/contact-us.html">Contact Us&nbsp;&nbsp;&nbsp;|</a></li>
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
            <a id="back2Top" title="Back to top" href="#">&#10148;</a>
        </div>
</html>
