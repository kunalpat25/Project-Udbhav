package mybeans;
import java.sql.*;
public class DBConnector
{
    public Connection getDbconnection()
    {
        Connection con = null;
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/udbhav?user=root&password=kunal123&useSSL=false&allowPublicKeyRetrieval=true");
            
        }
        catch(Exception e)
        {
            
        }
        return con;
    }
}