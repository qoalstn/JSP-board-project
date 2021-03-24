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
					return 1; //로그인 성공
				} else return 0; //비밀번호 틀림  
			}
			return -1; //로그인 실패
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB오류
	}
}
