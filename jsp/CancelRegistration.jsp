<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
<html>
    <body>
        <%
Connection con;
PreparedStatement pst;
ResultSet rs;
String id= request.getParameter("uid");
try
{
    DBConnector dbc = new DBConnector();
    con = dbc.getDbconnection();
    pst = con.prepareStatement("select * from regusers where userid=?;");
    pst.setString(1,id);
    rs = pst.executeQuery();
    if(rs.next())
    {
        pst=con.prepareStatement("delete from regusers where userid=?;");
        pst.setString(1,id);
        int no = pst.executeUpdate();
        if(no>0)
        {
            pst=con.prepareStatement("delete from userpersonal where userid=?;");
            pst.setString(1,id);
            no = pst.executeUpdate();
            if(no>0)
            {
                %>
                    <h4 style="color:rgb(10,200,30)">Your registration has been cancelled successfuly.</h4>
                <%
            }
            else
            {
                %>
                    <h4>Sorry..our fault! Please try again.</h4>
                <%
            }
        }
        else
        {
            %>
                <h4>Error. Please try again!</h4>
            <%
        }
    }
    else
    {
        %>
            <h4 style="color:red">User Not found!</h4>
        <%
    }
}
catch(Exception e)
{
    %>
    <h4><%=e%></h4>
    <%
}
%>
</body>
</html>