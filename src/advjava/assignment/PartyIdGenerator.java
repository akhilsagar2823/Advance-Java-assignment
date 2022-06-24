package advjava.assignment;

import java.sql.*;
public class PartyIdGenerator {
	public static String getPartyId() {
		try {
			Connection connection = ConnectonBuilder.getConnection();
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT COUNT(*) FROM party;");
			rs.next();
			int count = 10001 + rs.getInt(1);
			String partyId = Integer.toString(count);
			return partyId;		
		} catch (SQLException e) {
		}
		return null;
	}
}
