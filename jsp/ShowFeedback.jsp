<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
<html>

<head>
    <link rel="stylesheet" href="/udbhav/css/AdminHome.css">
    <script src="/udbhav/js/AdminHome-ajax.js"></script>    
    <link rel="stylesheet" href="/udbhav/css/scroll-to-top.css">
    <script src="/udbhav/js/jquery.js"></script>
    <script src="/udbhav/js/scroll-to-top.js"></script>
</head>

<body>
    <%
         if(session.getAttribute("id")==null)
         {
         %>
    <center><h1 style="color:rgb(10, 200, 30)">Udbhav Automations</h1></center>
    <hr><br><br>
    <center><h3 style="color:red"> Message: Session has expired. Please <a style="color:red" href="/udbhav/html/adminlogin.html">log in again!</a></h3></center>
    <br><br><br><br><hr>
    <%
         }
         else
         {
            
            String id = String.valueOf(session.getAttribute("id"));
			Connection con;
			ResultSet rs;
			Statement st;
			try
			{
				DBConnector dbc = new DBConnector();
                con = dbc.getDbconnection();
                st = con.createStatement();
                rs = st.executeQuery("select * from feedback;");
                int i = 1;
                %>
    <div id="head" class="container-div-top">
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
            <li style="float:right"><a href="/udbhav/jsp/Logout.jsp">Logout</a></li>
        </ul>
    </div>
    <a href="/udbhav/jsp/AdminHome.jsp" style="float:right; color:rgb(10, 200, 30); font-size: 25px; margin-right:20px; margin-top: 10px;">Registered Customers</a>
    <br><br>
    <div class="div-main">
        <center><h1 style="font-size:50px;">Admin Home</h1></center><br>
        <center><h2 style="font-size:40; color:rgb(10, 200, 30);">Welcome back <%=id%></h2></center>
        <div class="div-title">
            <table border="0" cellspacing="0" cellpadding="0">
                <tbody>
                    <tr>
                        <td valign="middle">Users' Feedback</td>
                        <td align="left"><img src="/udbhav/images/terms.jpg" width="21" height="35"></td>
                    </tr>
                </tbody>
            </table>
        </div> <br>
        <div id="div-cust-report" class="div-cust-report">
            <table>
                <tr>
                    <th>Sr. No.</th>
                    <th>Name</th>
                    <th>Send mail</th>
                    <th>Feedback</th>
                    <th>Overall Experience</th>
                    <th>User Interface</th>
                    <th>Features</th>
                    <th>Navigation</th>
                    <th>Ratings</th>
                </tr>
                <%
        while(rs.next())
        {
            %>
                <tr>
                    <td><%=i%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><a href='mailto:<%=rs.getString("email")%>?Subject=Udbhav%20Automations'><img
                                src="/udbhav/images/gmail-icon-cust.png" alt="Send Mail"></a></td>
                    <td><%=rs.getString("feedback")%></td>
                    <td><%=rs.getString("overall_experience")%></td>
                    <td><%=rs.getString("user_interface")%></td>
                    <td><%=rs.getString("features")%></td>
                    <td><%=rs.getString("navigation")%></td>
                    <td><%=rs.getInt("rating")%></td>
                </tr>
                <%
                    i += 1;
        }
                %>
            </table>
        </div>
        <br>
        
    
    
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
                con.close();
            }
            catch(Exception e)
            {
                out.println(e);
            }
         }  
        %>
</body>

</html>