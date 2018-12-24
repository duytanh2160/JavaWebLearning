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

@WebServlet(name = "ShowChiTietPhieuDat")
public class ShowChiTietPhieuDat extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ConnectionClass conn = new ConnectionClass("qldatmonan");
        String id = request.getParameter("id");

        Statement st;
        String Q = "select * from ChiTietPhieuDat where IDPhieuDat = " + id;

        try {
            st = conn.CONN().createStatement();
            ResultSet rs = st.executeQuery(Q);

            List<ChiTietPhieuDat> phieu = new ArrayList<>();
            while (rs.next()) {
                String idphieu = Integer.toString(rs.getInt("IDPhieuDat"));
                String stt = Integer.toString(rs.getInt("STTMonAn"));
                String kichco =  rs.getString("KichCo");
                String soluong = Integer.toString(rs.getInt("SoLuong"));
                String tonggia = Integer.toString(rs.getInt("TongGia"));
                String idchitiet = Integer.toString(rs.getInt("IDChiTietPD"));

                ChiTietPhieuDat temp = new ChiTietPhieuDat();
                temp.IDPhieuDat = id;
                temp.STTMonAn = stt;
                temp.KichCo = kichco;
                temp.SoLuong = soluong;
                temp.TongGia = tonggia;
                temp.IDChiTietPD = idchitiet;

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

class ChiTietPhieuDat{
    String IDPhieuDat;
    String STTMonAn;
    String KichCo;
    String SoLuong;
    String TongGia;
    String IDChiTietPD;
}

