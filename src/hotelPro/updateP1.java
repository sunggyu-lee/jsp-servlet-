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

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

/**
 * Servlet implementation class updateP1
 */
@WebServlet("/updateP1")
public class updateP1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 String url;
     String userid;
     String passwd;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateP1() {
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
				 String sql="update roommanage set ROOM_NAME=?, ROOM_TYPE=?, HOWMUCH=?, HOWMANY=? where room_id=?";  
				 Class.forName("oracle.jdbc.driver.OracleDriver");
		         conn = DriverManager.getConnection(url,userid,passwd);
			     ps = conn.prepareStatement(sql);
			     ps.setString(1, roomname);
			     ps.setString(2, roomtype);
			     ps.setInt(3, howmuch2);
			     ps.setInt(4, howmany2);
			     ps.setString(5, roomid);
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
		JSONArray ja = new JSONArray();
		JSONObject jo =new JSONObject();
		jo.put("roomid",roomid);//a.employee_id 하니까 안먹힘 ㅠㅠ
    	jo.put("roomname",roomname);
    	jo.put("roomtype",roomtype);
    	jo.put("howmuch2",howmuch2);
    	jo.put("howmany2",howmany2);
    	ja.add(jo);
    	out.println(ja.toString());
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
