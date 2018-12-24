import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Register extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //response.setStatus(HttpServletResponse.SC_NO_CONTENT);  //To make Servlet doesnt return a html page.

        ConnectionClass conn = new ConnectionClass("servlet");
        PreparedStatement st;

        String name = request.getParameter("user");
        String pass = request.getParameter("pass");
        String repeatPass = request.getParameter("repeat_pass");

        name.replaceAll("\\s+","");
        pass.replaceAll("\\s+","");

        PrintWriter out = response.getWriter();

        String Q = "Insert into accounts values(?,?)";

        if(pass.equals(repeatPass)) {
            try {
                st = conn.CONN().prepareStatement(Q);
                st.setString(1, name);
                st.setString(2, pass);

                st.executeUpdate();
                st.close();


                RequestDispatcher rd=request.getRequestDispatcher("Login.jsp");
                rd.forward(request, response);

            } catch (ClassNotFoundException e) {
                getError(e.toString(), out);
            }catch(MySQLIntegrityConstraintViolationException e){
                getError("This Username already exist !",out);
            } catch (SQLException e) {
                getError(e.toString(), out);
            }
        }else{
            getError("Password and Repeat Password are not the same !",out);
        }

    }

    private void getError(String e,PrintWriter out){
        out.println("Error occured: " + e);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

}
