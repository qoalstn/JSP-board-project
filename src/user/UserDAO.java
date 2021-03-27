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
			String dbURL = "***";
			String dbID = "***";
			String dbPassword = "***";
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
	public int join (User user) {
		String SQL = "INSERT INTO USER (userID, Password, Name, Gender, Email) VALUES (?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, user.getuserID());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			 return -1;
		}
	}
}
