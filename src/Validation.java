
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Validation {



    public boolean isThisAccountRight(String username, String password) throws SQLException, ClassNotFoundException {
        ConnectionClass conn = new ConnectionClass("servlet");

        String Q0 = "select * from Accounts";

        Statement st;
        st = conn.CONN().createStatement();

        ResultSet rs = st.executeQuery(Q0);
        while (rs.next()) {
            String temp_username = rs.getString("username");
            String temp_password = rs.getString("password");
            if(temp_username.equals(username) && temp_password.equals(password) ){
                    st.close();
                    return true;
            }
        }
        st.close();
        return false;
    }
}
