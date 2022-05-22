package advjava.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(asyncSupported = true, urlPatterns = { "/validate" })
public class Validator extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String userLoginID = req.getParameter("user");
		String password = req.getParameter("pass");

		boolean invalid = true;
		
		PrintWriter out = res.getWriter();
		
		try {
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment","root","123456");
			
			Statement st = con.createStatement();
						
			ResultSet rs = st.executeQuery("select * from userlogin");
			
			while(rs.next()) {
				if(userLoginID.equals(rs.getString(1))) {
					if(password.equals(rs.getString(2))) {
						invalid = false;
						res.sendRedirect("HomePage.jsp");
					}
				}
			}
			if(invalid==true) {
				res.setContentType("text/html");
				out.print("<h1><center> Invalid UserId or Password !! </center></h1>");
				out.print("<h2><center><a href ='LoginPage.jsp'>Back to Login Page</a></center></h2>");
			}
			
		}catch(Exception e) {	
			e.printStackTrace(out);
		}
	}
}
