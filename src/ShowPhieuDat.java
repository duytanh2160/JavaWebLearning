import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ShowPhieuDat")
public class ShowPhieuDat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConnectionClass conn = new ConnectionClass("qldatmonan");

        Statement st;
        String Q = "select top 5 * from PhieuDatMon order by IDPhieuDat desc";

        try {
            st = conn.CONN().createStatement();
            ResultSet rs = st.executeQuery(Q);

            List<PhieuDat> phieu = new ArrayList<>();
            while (rs.next()) {
                String id = rs.getString("IDPhieuDat");
                String tglap = rs.getString("TGLap");
                String stt =  Integer.toString(rs.getInt("STTBan"));
                String tinhtrang = Integer.toString(rs.getInt("TinhTrang"));

                PhieuDat temp = new PhieuDat();
                temp.IDPhieuDat = id;
                temp.TGLap = tglap;
                temp.STTBan = stt;
                temp.TinhTrang = tinhtrang;

                phieu.add(temp);
            }
            st.close();

            Gson gson = new Gson();

            String json = gson.toJson(phieu);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);






        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

class PhieuDat{
    String IDPhieuDat;
    String TGLap;
    String STTBan;
    String TinhTrang;
}
