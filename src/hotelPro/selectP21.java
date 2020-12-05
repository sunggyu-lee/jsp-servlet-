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
 * Servlet implementation class selectP21
 */
@WebServlet("/selectP21")
public class selectP21 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url;
    String userid;
    String passwd;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectP21() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		request.setCharacterEncoding("utf-8");
		 response.setContentType("text/html; charset=utf-8");
		 url="jdbc:oracle:thin:@localhost:1521:orcl";
	      userid="system";
	      passwd="human123";
	      Connection conn=null;
	      Statement stmt=null;
	      ResultSet rs=null;
	      try {
	    	 String sql="select res_id,room_id,room_name,room_type,to_char(check_indate,'YYYY-MM-DD'),to_char(check_outdate,'YYYY-MM-DD'),"
	    	 		+ "how_many,cus_name,cus_number,cus_sum,cus_oneday,cus_max from bookmanage where check_outdate>sysdate order by res_id";
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         conn = DriverManager.getConnection(url,userid,passwd);
	         stmt=conn.createStatement();
	         rs=stmt.executeQuery(sql);
	         System.out.println(rs);
	         PrintWriter out=response.getWriter();
	         JSONArray ja = new JSONArray();
	         while(rs.next()) {
	        	 JSONObject jo =new JSONObject();
	        	 jo.put("resid",rs.getString("RES_ID"));
	        	 jo.put("roomid",rs.getString("ROOM_ID"));
	        	 jo.put("roomname",rs.getString("ROOM_NAME"));
	        	 jo.put("roomtype",rs.getString("ROOM_TYPE"));
	        	 jo.put("checkindate",rs.getString("to_char(check_indate,'YYYY-MM-DD')"));
	        	 jo.put("checkoutdate",rs.getString("to_char(check_outdate,'YYYY-MM-DD')"));
	        	 jo.put("howmany",rs.getInt("HOW_MANY"));
	        	 jo.put("cusname",rs.getString("CUS_NAME"));
	        	 jo.put("cusnumber",rs.getString("CUS_NUMBER"));
	        	 jo.put("cussum",rs.getInt("CUS_SUM"));
	        	 jo.put("cusoneday",rs.getInt("cus_oneday"));
	        	 jo.put("cusmax",rs.getInt("cus_max"));
	        	 ja.add(jo);
	         }
	         out.println(ja.toString());
	         out.close();
	      }catch(ClassNotFoundException e){
	    	  System.out.println(e.getMessage());
	      }catch(SQLException se) {
	    	  System.out.println(se.getMessage());
	      }finally {
	    	  try {
	    		  if(rs!=null) rs.close();
	    		  if(stmt!=null) stmt.close();
	    		  if(conn!=null) conn.close();
	    	  }catch(SQLException se) {
	    		  System.out.println(se.getMessage());
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
