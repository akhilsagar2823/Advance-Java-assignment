package advjava.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(asyncSupported = true, urlPatterns = { "/validate" })
public class Validator extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException {
		String userId = req.getParameter("user");
		String password = req.getParameter("pass");
		PrintWriter out = res.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment","root","123456");
			Statement stmt = con.createStatement();
			ResultSet rs= stmt.executeQuery("SELECT userId,password FROM userLogin;");
			
			while(rs.next()) {
				if(rs.getString("userId").equals(userId) && rs.getString("password").equals(password)) {
					res.setContentType("text/html");
					out.print("<h1><center> Successfully Loged In !! </center></h1>");
					out.print("<h2><center><a href ='HomePage.jsp'>Go to Home Page</a></center></h2>");
				} else {
					res.setContentType("text/html");
					out.print("<h1><center> Invalid UserId or Password !! </center></h1>");
					out.print("<h2><center><a href ='LoginPage.jsp'>Back to Login Page</a></center></h2>");
				}
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
