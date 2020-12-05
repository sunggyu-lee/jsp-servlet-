package hotelPro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
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
 * Servlet implementation class selectP1
 */
@WebServlet("/selectP1")
public class selectP1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 String url;
     String userid;
     String passwd;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectP1() {
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
		 url="jdbc:oracle:thin:@localhost:1521:orcl";
	      userid="system";
	      passwd="human123";
	      Connection conn=null;
	      Statement stmt=null;
	      ResultSet rs=null;
	      PrintWriter out=response.getWriter();
	      try {//a.employee_id 하니까 안먹힘 ㅠㅠ
	         //String sql="select employee_id, emp_name,manager_id from employees order by emp_name";
	         String sql="select room_id,room_name,room_type,howmuch,howmany from roommanage order by room_name";
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         conn = DriverManager.getConnection(url,userid,passwd);
	         stmt=conn.createStatement();
	         rs=stmt.executeQuery(sql);
	         JSONArray ja = new JSONArray();
	         while(rs.next()) {
	        	 JSONObject jo =new JSONObject();
	        	 jo.put("roomid",rs.getString("room_id"));
	        	 jo.put("roomname",rs.getString("room_name"));
	        	 jo.put("roomtype",rs.getString("room_type"));
	        	 jo.put("howmuch",rs.getInt("HOWMUCH"));
	        	 jo.put("howmany",rs.getInt("HOWMANY"));
	        	 ja.add(jo);
	         }
	         out.println(ja.toString());
	         out.close();
	      } catch(Exception e) {
	         out.println("error");
	      } finally {
	            try {
	            rs.close();
	            conn.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	            try {
	            stmt.close();
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	         }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
