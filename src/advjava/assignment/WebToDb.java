package advjava.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebToDb extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException {
		PrintWriter out = res.getWriter();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/advjava_assignment","root","123456");
			String firstName = (String) req.getParameter("first");
			String lastName = (String) req.getParameter("last");
			String address = (String) req.getParameter("add");
			String city = (String)  req.getParameter("city");
			String state = (String) req.getParameter("state");
			String country = (String) req.getParameter("country");
			String zip = req.getParameter("zip");
			String phone =  req.getParameter("phn");
			String userId = (String) req.getParameter("user");
			String password = (String) req.getParameter("pass");
			String partyId = firstName.toUpperCase()+lastName.toUpperCase();
			partyId = partyId.substring(0,4)+phone.substring(phone.length()-4,phone.length());
			
			
			String query1 = "INSERT INTO party (partyid, firstName, lastName, address, city, state, country, zip, phone) VALUES ('"+partyId+"','"+ firstName+"','"+ lastName+"','"+address+"','"
					+city+"','"+state+"','"+country+"','"+zip+"','"+phone+"')";
			String query2 = "INSERT INTO userlogin (userId, password, partyId) VALUES ('"+userId+"','"+password+"','"+partyId+"')";
			
			PreparedStatement prestmt1 = con.prepareStatement(query1);
			PreparedStatement prestmt2 = con.prepareStatement(query2);
			boolean inserted1= prestmt1.execute();
			boolean inserted2= prestmt2.execute();			
			
			if(inserted1 == false && inserted2 == false) {
				res.setContentType("text/html");
				out.print("<h1><center> Registered Sucessfully !! </center></h1>");
				out.print("<h2><center><a href ='LoginPage.html'>Go to Login Page</a></center></h2>");
			} else {
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace(out);
		}
	}
}
