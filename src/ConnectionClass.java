import sun.rmi.runtime.Log;
import java.sql.Statement;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;


public class ConnectionClass {
    String ip = "den1.mssql2.gear.host";
    String db = "qldatmonan";
    String un = "qldatmonan";
    String password = "project.xml2018";
    String databaseName;

    public ConnectionClass(String DatabaseName){
        this.databaseName = DatabaseName;
    }

    public String error;

    public Connection CONN() throws SQLException, ClassNotFoundException{
        Connection conn = null;
        String ConnURL = null;

        if(databaseName.equals("servlet")) {
            Class.forName("com.mysql.jdbc.Driver");
            ConnURL = "jdbc:mysql://localhost:3306/servlet";
            conn = DriverManager.getConnection(ConnURL, "duyta2160", "anh.duy1997");

        }
        if(databaseName.equals("qldatmonan")){
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            ConnURL = "jdbc:sqlserver://" + ip + ";database=" + db+ ";user=" + un + ";password=" + password + ";";
            conn = DriverManager.getConnection(ConnURL);
        }

        return conn;
    }
}
