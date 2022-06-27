package advjava.assignment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UpdateDetails extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession(true);
		String userName = (String) session.getAttribute("userName");
		session.getMaxInactiveInterval();
		PrintWriter out = res.getWriter();
		try {
			if(userName==null){
				res.sendRedirect("LoginPage.html");
			}
			String column = req.getParameter("column");
			String newValue = req.getParameter("newValue"); 
			String partyId = (String) session.getAttribute("partyId"); 
			Connection con = ConnectonBuilder.getConnection();
			PreparedStatement stmt;
			String[] columns = {"firstName","lastName","address","city","state","country","zip","phone","userId","emailId"};		
			for(int i=0;i<columns.length;i++) {
				if(i<(columns.length-2)) {
					if(columns[i].equals(column)) {
						stmt = con.prepareStatement("UPDATE party SET "+column+" = '"+newValue+"' WHERE partyId = '"+partyId+"';");
						stmt.execute();
						res.sendRedirect("HomePage.jsp");
					}
				}else {
					if(columns[i].equals(column)) {
						stmt = con.prepareStatement("UPDATE userLogin SET "+column+" = '"+newValue+"' WHERE partyId = '"+partyId+"';");
						stmt.execute();
						res.sendRedirect("HomePage.jsp");
					}
				}
			}
		}catch (SQLException | IOException e) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Error occured Try again !!');");
            out.println("</script>");
            RequestDispatcher rd = req.getRequestDispatcher("HomePage.jsp");
            rd.forward(req, res);
		}
	}
}
