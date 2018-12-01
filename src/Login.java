import sun.security.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Login extends HttpServlet {

    public List<String> Users = Arrays.asList("admin", "duyta");
    public List<String> Passwords = Arrays.asList("123", "khongbiet");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //response.setStatus(HttpServletResponse.SC_NO_CONTENT);  //To make Servlet doesnt return a html page.

        String name = request.getParameter("user");
        String pass = request.getParameter("pass");
        name.replaceAll("\\s+","");
        pass.replaceAll("\\s+","");

        HttpSession session=request.getSession();
        PrintWriter out = response.getWriter();

        if(checkAccount(name,pass)){
            session.setAttribute("login","ok");
            response.sendRedirect("/");
        }else{
            response.setContentType("text/html");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Login failed</title>");
            out.println("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" charset=\"utf-8\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<p style=\"font-size:50px;color:red;\">Dang nhap that bai !</p>");
            out.println("<p style=\"font-size:20px;\">Quay tro lai dang nhap trong 5s...</p>");
            out.println("</body>");
            out.println("</html>");
            response.setHeader("Refresh", "5; URL=Login.jsp");
        }





    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    private boolean checkAccount(String name, String pass){
        for(int i = 0 ; i < Users.size() ; i++){
            if(Users.get(i).equals(name)){
                if(Passwords.get(i).equals(pass)){
                    return true;
                }
            }
        }
        return false;
    }

}
