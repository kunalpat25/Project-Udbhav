<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
<html>
    <body>
        <%
            String un = request.getParameter("uname");
            Connection con;
            ResultSet rs;
            PreparedStatement pst;
            try
            {
                DBConnector dbc = new DBConnector();
                con = dbc.getDbconnection();
                pst = con.prepareStatement("select * from regusers where userid= ?");
                pst.setString(1,un);
                rs = pst.executeQuery();
                if(rs.next())
                {
                    %><h5 style="color:red; padding: 0;margin-top: 0.4; margin-bottom: 0.4;">Username NOT Available!</h5><%
                }
                else
                {
                    %><h5 style="color:green; padding: 0;margin-top: 0.4; margin-bottom: 0.4;">Username Available!</h5><%
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