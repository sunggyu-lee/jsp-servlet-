package hotelPro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class deleteP1
 */
@WebServlet("/deleteP1")
public class deleteP1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 String url;
     String userid;
     String passwd;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteP1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		 request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html; charset=utf-8");
		 String roomid = request.getParameter("roomid");
		 url="jdbc:oracle:thin:@localhost:1521:orcl";
	      userid="system";
	      passwd="human123";
	      Connection conn=null;
	      PreparedStatement ps=null;
	      PrintWriter out=response.getWriter();
	  	try {
			 String sql="delete from roommanage where room_id=?";  
			 Class.forName("oracle.jdbc.driver.OracleDriver");
	         conn = DriverManager.getConnection(url,userid,passwd);
		     ps = conn.prepareStatement(sql);
		     ps.setString(1, roomid);
			 ps.executeUpdate();
			 ps.close();
	      } catch(Exception e) {
	         out.println("error");
	      } finally {
	            try {
	            ps.close();
	            conn.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	      }
	  	 out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
