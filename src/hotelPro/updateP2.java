package hotelPro;

import java.io.IOException;
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
 * Servlet implementation class updateP2
 */
@WebServlet("/updateP2")
public class updateP2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String url = null;
	  String userid = null;
	  String passwd = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateP2() {
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
		String roomid = request.getParameter("roomid");
		String roomname = request.getParameter("roomname");
		String roomtype = request.getParameter("roomtype");
		String checkin2 = request.getParameter("checkin2");
		String checkout2 = request.getParameter("checkout2");
		String howmany = request.getParameter("howmany");
		String csname = request.getParameter("csname");
		String csmobile = request.getParameter("csmobile");
		String checksum = request.getParameter("checksum");
		String cusoneday = request.getParameter("cusoneday");
		String confimid = request.getParameter("confimid");
		int howmany2 = Integer.parseInt(howmany);
		int checksum2 = Integer.parseInt(checksum);
		int cusoneday2 = Integer.parseInt(cusoneday);
		PreparedStatement pstmt=null;
		Connection conn=null;
		try {
	         Class.forName("oracle.jdbc.OracleDriver");
	         url="jdbc:oracle:thin:@localhost:1521:orcl";
		     userid="system";
		     passwd="human123";
		     conn = DriverManager.getConnection(url,userid,passwd);
		     String sql = "update bookmanage set ROOM_ID=?, ROOM_NAME=?, ROOM_TYPE=?, CHECK_INDATE=?, CHECK_OUTDATE=?, HOW_MANY=?, CUS_NAME=?, CUS_NUMBER=?, CUS_SUM=?, CUS_ONEDAY=? where RES_ID=?";
		     pstmt = conn.prepareStatement(sql);
		     pstmt.setString(1, roomid);
		     pstmt.setString(2, roomname);
		     pstmt.setString(3, roomtype);
		     pstmt.setString(4, checkin2);
		     pstmt.setString(5, checkout2);
		     pstmt.setInt(6, howmany2);
		     pstmt.setString(7, csname);
		     pstmt.setString(8, csmobile);
		     pstmt.setInt(9, checksum2);
		     pstmt.setInt(10, cusoneday2);
		     pstmt.setString(11, confimid);
		     int n = pstmt.executeUpdate();
		     System.out.println(n);
	      }catch(ClassNotFoundException e){
	    	  System.out.println(e.getMessage());
	      }catch(SQLException se) {
	    	  System.out.println(se.getMessage());
	      }finally {
	    	  try {
	    		  if(pstmt!=null) pstmt.close();
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
