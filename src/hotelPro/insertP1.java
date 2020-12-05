package hotelPro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class insertP1
 */
@WebServlet("/insertP1")
public class insertP1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 String url;
     String userid;
     String passwd;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public insertP1() {
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
		 String roomname = request.getParameter("roomname");
		 String howmany = request.getParameter("howmany");
		 int howmany2 = Integer.parseInt(howmany);
		 String roomtype = request.getParameter("roomtype");
		 String howmuch = request.getParameter("howmuch");
		 int howmuch2 = Integer.parseInt(howmuch);
		 url="jdbc:oracle:thin:@localhost:1521:orcl";
	     userid="system";
	     passwd="human123";
	     Connection conn=null;
	     PreparedStatement ps=null;
	     PrintWriter out=response.getWriter();
			try {
				 String sql="insert into roommanage values(room_seq.nextval,?,?,?,?)";  
				 Class.forName("oracle.jdbc.driver.OracleDriver");
		         conn = DriverManager.getConnection(url,userid,passwd);
			     ps = conn.prepareStatement(sql);
			     ps.setString(1, roomname);
			     ps.setString(2, roomtype);
			     ps.setInt(3, howmuch2);
			     ps.setInt(4, howmany2);
				 ps.executeUpdate();
				 
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
