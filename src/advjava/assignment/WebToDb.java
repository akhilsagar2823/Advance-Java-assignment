package advjava.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WebToDb extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException {
		PrintWriter out = res.getWriter();
		Connection con = ConnectonBuilder.getConnection();
		PreparedStatement prestmt1,prestmt2;
		String partyId = PartyIdGenerator.getPartyId();	
		req.setAttribute("partyId", partyId);
		RequestDispatcher rd;
		try {
			boolean success = false;
			String firstName = (String) req.getParameter("firstName");
			String lastName = (String) req.getParameter("lastName");
			String address = (String) req.getParameter("address");
			String city = (String)  req.getParameter("city");
			String state = (String) req.getParameter("state");
			String country = (String) req.getParameter("country");
			String zip = req.getParameter("zip");
			String phone =  req.getParameter("phoneNo");
			String emailId = req.getParameter("emailId");
			String userId = (String) req.getParameter("userId");
			String password = (String) req.getParameter("password");
			password = PasswordEncryptor.encrypt(password);
			String query1 = "INSERT INTO party (partyid, firstName, lastName, address, city, state, country, zip, phone) VALUES ('"+partyId+"','"+ firstName+"','"+ lastName+"','"+address+"','"
					+city+"','"+state+"','"+country+"','"+zip+"','"+phone+"')";
			String query2 = "INSERT INTO userlogin (userId, emailId, password, partyId) VALUES ('"+userId+"','"+emailId+"','"+password+"','"+partyId+"')";
			
			prestmt1 = con.prepareStatement(query1);
			prestmt2 = con.prepareStatement(query2);
			if(prestmt1.execute()) {
				
			}else {
				if(prestmt2.execute()) {
				}else {
					out.println("<script type=\"text/javascript\">");
		            out.println("alert('Regestration successfull !!');");
		            out.println("</script>");
		    		req.setAttribute("emailId", emailId);
		    		req.setAttribute("name", firstName+" "+lastName);
		    		req.setAttribute("userId", userId);
		            rd = req.getRequestDispatcher("sendmail");
		            rd.include(req, res);			            
				}
			}

		} catch (SQLException  e) {
			try {
				prestmt1 = con.prepareStatement("DELETE FROM party WHERE partyId = '"+partyId+"';");
				prestmt1.execute();
				prestmt2 = con.prepareStatement("DELETE FROM userLogin WHERE partyId = '"+partyId+"';");
				prestmt2.execute();
				out.println("<script type=\"text/javascript\">");
	            out.println("alert('Error Occured, Try Again !!');");
	            out.println("</script>");
	            rd = req.getRequestDispatcher("RegistrationPage.html");
	            rd.include(req, res);	
			} catch (SQLException e1) {
				out.println("<script type=\"text/javascript\">");
	            out.println("alert('Error Occured, Try Again !!');");
	            out.println("</script>");
	            rd = req.getRequestDispatcher("RegistrationPage.html");
	            rd.include(req, res);			
				e1.printStackTrace(out);
			}

			e.printStackTrace(out);
		}
	}
}
