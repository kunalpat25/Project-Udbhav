<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
<html>

<body>
    <%
        String id,pw;
        id = request.getParameter("uname");
        pw = request.getParameter("pass");
        Connection con;
        ResultSet rs;
        PreparedStatement pst;
        try
        {
            DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();
            pst = con.prepareStatement("select * from admins where adminid= ? and password=?;");
            pst.setString(1,id);
            pst.setString(2,pw);
            rs = pst.executeQuery();
            if(rs.next())
            {
                session.setAttribute("id",id);
                response.sendRedirect("/udbhav/jsp/AdminHome.jsp");
            }
            else
            {
                %>

    <head>
        <link rel="stylesheet" href="/udbhav/css/styles.css">
        <link rel="stylesheet" href="/udbhav/css/indroduction.css">
        <link rel="stylesheet" href="/udbhav/css/scroll-to-top.css">
        <script src="/udbhav/js/jquery.js"></script>
        <script src="/udbhav/js/scroll-to-top.js"></script>
    </head>


    <div id="head" class="container">
        <img class="bgimage" src="/udbhav/images/grass2.jpeg" alt="udbhav" style="width:100%;height:40% ;">
        <div id="head1" class="top-left">
            <h1 class="shadow">UDBHAV PRESENTS</h1>
        </div>
        <div id="head2" class="main-heading">
            <h2 class="shadow">AUTOMATION OF DRIP IRRIGATION</h2>
        </div>
    </div>
    <div class="navbar">
        <ul>
            <li><a class="active" href="/udbhav/index.jsp">Home</a></li>
            <li><a href="/udbhav/html/working.html">Working</a></li>
            <li><a href="/udbhav/html/gallery.html">Gallery</a></li>
            <li><a href="#">Let's Talk</a></li>
            <li><a href="/udbhav/html/help.html">Help</a></li>
            <li style="float:right"><a href="/udbhav/html/adminlogin.html">Admin Login</a></li>
            <li style="float:right"><a href="/udbhav/html/Register.html">Register</a></li>
        </ul>
    </div>


    <div id="div-output" style="margin-top: 10%; margin-bottom: 10%; align-content: center; text-align: center;">
        <h2 style="color:red; font-size: 50px;">Authentication Failed. Please <a style="color:red" href="/udbhav/html/adminlogin.html">Try Again</a></h2><br>
    </div>

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
            <span class="copyright">
                <h3>&copy; 2019 Udbhav. All Rights Reserved</h3>
            </span>
            <span class="stayconnected">
                <h3>Stay Connected</h3> <br>
                <ul>
                    <li><a href="https://www.youtube.com/channel/UCP0cz4_fZfS6NXnZ6W3sszQ"><img src="/udbhav/images/youtube-logo.png" alt="youtube"></a></li>
                    <li><a href="https://twitter.com/ProjectUdbhav"><img src="/udbhav/images/twitter-logo.png" alt="twitter"></a> </li>
                    <li><a href="https://www.facebook.com/Udbhav-355349738522932/?modal=admin_todo_tour"><img src="/udbhav/images/fb-logo.png" alt="facebook"></a></li>
                    <li><a href="#"><img src="/udbhav/images/google-logo.png" alt="google"></a></li>
                </ul>
            </span>
        </div>
        <a id="back2Top" title="Back to top" href="#">&#10148;</a>
    </div>
    <%
            }
            con.close();
        }
        catch(Exception e)
        {
            out.println(e);
        }
        %>
</body>

</html>