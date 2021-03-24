package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {

	private Connection con;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://database-1.cs870qgd0hjd.us-east-2.rds.amazonaws.com:3306/management";
			String dbID = "admin";
			String dbPassword = "admin";
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int login(String userID, String password) {
		String sql = "SELECT password FROM USER WHERE userId=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(password)) {
					return 1; //�α��� ����
				} else return 0; //��й�ȣ Ʋ��  
			}
			return -1; //�α��� ����
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB����
	}
}
