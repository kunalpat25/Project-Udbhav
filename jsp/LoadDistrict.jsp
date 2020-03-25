<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
<html>

<body>
    <%
            String st = request.getParameter("state");
            Connection con;
            ResultSet rs;
            PreparedStatement pst;
            try
            {
                DBConnector dbc = new DBConnector();
                con = dbc.getDbconnection();
                pst = con.prepareStatement("select * from districts where state= ?");
                pst.setString(1,st);
                rs = pst.executeQuery();
                %>
    <select id="DdlDistrict" class="ddl-style" name="DdlDistrict" title="Select your district" required>
        <option value="-1">District</option>
        <%
                while(rs.next())
                {
                    String dist = rs.getString("district");
                    %>
        <option value="<%=dist%>"><%=dist%></option>
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