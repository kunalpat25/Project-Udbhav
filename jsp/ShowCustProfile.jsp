<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
<html>

<head>
    <link href="/udbhav/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/udbhav/css/boostrap.css">
    <script src="/udbhav/js/bootstrap.js"></script>
    <script src="/udbhav/js/bootstrap.min.js"></script>
    <script src="/udbhav/js/jquery.js"></script>
    <link rel="stylesheet" href="/udbhav/css/cust-profile.css">
</head>

<body>
    



            <div class="col-xs-12 col-sm-6 col-md-6">
                <div class="well well-sm">
                    <div class="row">
                        <div class="col-sm-6 col-md-4">
                            <%
        Connection con;
        ResultSet rs,rs1;        
        PreparedStatement pst;
        String id= request.getParameter("id");
        try
        {
            DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();
            pst = con.prepareStatement("select * from regusers where userid=?;");
            pst.setString(1,id);
            rs = pst.executeQuery();
            pst = con.prepareStatement("select * from userpersonal where userid=?;");
            pst.setString(1,id);
            rs1 = pst.executeQuery();
            if(rs.next() && rs1.next())
            {
                %>
                            <img src="/udbhav/images/<%=rs.getString("gender")%>-icon-cust.png" alt="gender"
                                class="img-rounded img-responsive" /> <br>
                                <h4 style="align-self:center; margin-left:20%;"><%=id%></h4>
                        </div>
                        <div class="col-sm-6 col-md-8">
                            <h4 style="font-family:Georgia, 'Times New Roman', Times, serif; font-size: 25px;">
                                <%=rs.getString("fname")%> <%=rs.getString("lname")%></h4>
                            <small><cite
                                    title="<%=rs1.getString("taluka")%>, <%=rs1.getString("district")%>, <%=rs1.getString("state")%>"><%=rs1.getString("taluka")%>
                                    Dist.<%=rs1.getString("district")%>, <%=rs1.getString("state")%> <i
                                        class="glyphicon glyphicon-map-marker">
                                    </i></cite></small>
                            <p>
                                <i class="glyphicon glyphicon-envelope"></i><a
                                    href="mailto:<%=rs.getString("email")%>"><%=rs.getString("email")%></a>
                                <br />
                                <i class="glyphicon glyphicon-earphone"></i><a
                                    href="tel:<%=rs.getString("mob")%>"><%=rs.getString("mob")%></a>
                                <br />
                                <i class="glyphicon glyphicon-gift"></i><%=rs1.getString("dob")%>
                                <br>
                                <i class="glyphicon glyphicon-tree-deciduous"></i> <%=rs1.getString("cropnm")%>
                                <br>
                                <i class="glyphicon glyphicon-fullscreen"></i> <%=rs1.getString("area")%>
                                <br>
                                <i class="glyphicon glyphicon-list-alt"></i> <%=rs1.getString("notes")%>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        


    <%
            }
            else
            {
                out.println("User not found!");
            }            
            
        }
        catch(Exception e)
        {
            out.println(e);
        }
    %>
</body>

</html>