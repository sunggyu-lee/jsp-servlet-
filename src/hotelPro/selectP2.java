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
 * Servlet implementation class findbookServlet
 */
@WebServlet("/selectP2")
public class selectP2  extends HttpServlet {
   private static final long serialVersionUID = 1L;
   String url;
   String userid;
   String passwd;  
   /**
    * @see HttpServlet#HttpServlet()
    */
   public selectP2 () {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html; charset=UTF-8");
      url="jdbc:oracle:thin:@localhost:1521:orcl";
	     userid="system";
	     passwd="human123";
      Connection conn=null;
      ResultSet rs=null;
      PreparedStatement ps=null;
      try {
         String checkin1=request.getParameter("checkin1");
         String checkout1=request.getParameter("checkout1");
         String roomtype=request.getParameter("roomtype");
         String sql="select * from roommanage where room_id not in "
         		+ "(select room_id from bookmanage where "
         		+ "(check_indate>=TO_DATE(?) and check_indate<TO_DATE(?) or "
         		+ "(check_outdate>TO_DATE(?) and check_outdate<=TO_DATE(?)))) and "
         		+ "room_type like ? "
         		+ "order by room_name";
         Class.forName("oracle.jdbc.driver.OracleDriver");
         conn=DriverManager.getConnection(url,userid,passwd);
         ps= conn.prepareStatement(sql);
         ps.setString(1, checkin1);
         ps.setString(2, checkout1);
         ps.setString(3, checkin1);
         ps.setString(4, checkout1);
         ps.setString(5, roomtype);
         rs=ps.executeQuery();
         PrintWriter out=response.getWriter();
         JSONArray ja=new JSONArray();
         while(rs.next()) {
            JSONObject jo=new JSONObject();
            jo.put("roomid",rs.getString("room_id"));
            jo.put("roomname",rs.getString("room_name"));
            jo.put("roomtype",rs.getString("room_type"));
            jo.put("howmany",rs.getInt("howmany"));
            jo.put("howmuch",rs.getInt("howmuch"));
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