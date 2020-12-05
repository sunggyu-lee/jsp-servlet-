package hotelPro;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class jongbock
 */
@WebServlet("/jongbock")
public class jongbock extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url;
	   String userid;
	   String passwd; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public jongbock() {
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
	      response.setContentType("text/html; charset=UTF-8");
	      url="jdbc:oracle:thin:@localhost:1521:orcl";
		     userid="system";
		     passwd="human123";
		     boolean result = false;
	      Connection conn=null;
	      ResultSet rs=null;
	      PreparedStatement ps=null;
	      try {
	         String roomname=request.getParameter("roomname");
	         String sql="select room_name from roommanage where room_name=?";
	         Class.forName("oracle.jdbc.driver.OracleDriver");
	         conn=DriverManager.getConnection(url,userid,passwd);
	         ps= conn.prepareStatement(sql);
	         ps.setString(1, roomname);
	         rs=ps.executeQuery();
	         PrintWriter out=response.getWriter();
	         if(rs.next()) {
	        	result = true;
	         }
	         out.println(result);
	         out.close();
	      }catch(ClassNotFoundException e){
	    	  System.out.println(e.getMessage());
	      }catch(SQLException se) {
	    	  System.out.println(se.getMessage());
	      }finally {
	    	  try {
	    		  if(ps!=null) ps.close();
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
