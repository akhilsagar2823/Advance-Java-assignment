package advjava.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(asyncSupported = false, urlPatterns = { "/delete" })
public class DeleteRecord extends HttpServlet {
	public void service(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession(true);
		String userName = (String) session.getAttribute("userName");
		session.getMaxInactiveInterval();
		if(userName==null){
			response.sendRedirect("LoginPage.html");
		}
		PrintWriter out = response.getWriter();
		try{
			Connection con = ConnectonBuilder.getConnection();			
			Statement st1 = con.createStatement();

			PreparedStatement st3 = con.prepareStatement("DELETE FROM userlogin WHERE partyid=?");
			PreparedStatement st4 = con.prepareStatement("DELETE FROM party WHERE partyid=?");
			
			ResultSet rs = st1.executeQuery("SELECT * FROM party");
			while(rs.next()){
				String partyId = rs.getString(1);
				String sta = request.getParameter(partyId);
				
				if(sta!=null){
					st3.setString(1,partyId);
					st4.setString(1,partyId);
					st3.executeUpdate();
					st4.executeUpdate();
				}
			}
		}catch(SQLException e){
			out.print(e);
		}
	response.sendRedirect("HomePage.jsp");	  

	}
}
