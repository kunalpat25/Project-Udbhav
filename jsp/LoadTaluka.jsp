<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
<html>

<body>
    <%
            String dt  = request.getParameter("district");
            Connection con;
            ResultSet rs;
            PreparedStatement pst;
            try
            {
                DBConnector dbc = new DBConnector();
            con = dbc.getDbconnection();

                pst = con.prepareStatement("select * from talukas where district= ?");
                pst.setString(1,dt);
                rs = pst.executeQuery();
                %>
    <select id="DdlTaluka" class="ddl-style" name="DdlTaluka" title="Select your taluka" required>
        <option value="-1">Taluka</option>
        <%
                while(rs.next())
                {
                    String tq = rs.getString("taluka");
                    %>
        <option value="<%=tq%>"><%=tq%></option>
        <%                    
                }
                %>
    </select>
    <br><br>
    <%
            con.close();
            }
            catch(Exception e)
            {
                out.println(e);
            }
        %>
</body>

</html>