package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public UserDao() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/caps";
            String dbID = "root";
            String dbPassword = "0000";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int login(String userEmail, String userPassword) {
        String SQL = "SELECT userPassword FROM USER WHERE userEmail = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                if (rs.getString(1).equals(userPassword)) {
                    return 1;
                } else {
                    return 0; // 비밀번호 불일치
                }
            }
            return -1; // 이메일 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; // 데이터베이스 오류
    }

    public int join(User user) {
        String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, user.getUserEmail());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserName());
            pstmt.setString(4, user.getUserGender());
            pstmt.setString(5, user.getUserBirth());
            pstmt.setString(6, user.getUserPnum());
            pstmt.setString(7, user.getUserAddress());
            pstmt.setString(8, user.getUserStudent());

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1; // 데이터베이스 오류
    }

    public User getUserByEmail(String userEmail) {
        String SQL = "SELECT * FROM USER WHERE userEmail = ?";
        User user = new User();
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                user.setUserEmail(rs.getString("userEmail"));
                user.setUserPassword(rs.getString("userPassword"));
                user.setUserName(rs.getString("userName"));
                user.setUserGender(rs.getString("userGender"));
                user.setUserBirth(rs.getString("userBirth"));
                user.setUserPnum(rs.getString("userPnum"));
                user.setUserAddress(rs.getString("userAddress"));
                user.setUserStudent(rs.getString("userStudent"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUserInfo(String currentEmail, String newEmail, String currentPassword, String newPassword, String newName, String newBirth, String newPnum, String newAddress) {
        String SQL = "UPDATE USER SET userEmail = ?, userPassword = ?, userName = ?, userBirth = ?, userPnum = ?, userAddress = ? WHERE userEmail = ? AND userPassword = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, newEmail != null && !newEmail.isEmpty() ? newEmail : currentEmail);
            pstmt.setString(2, newPassword != null && !newPassword.isEmpty() ? newPassword : currentPassword);
            pstmt.setString(3, newName != null && !newName.isEmpty() ? newName : getUserByEmail(currentEmail).getUserName());
            pstmt.setString(4, newBirth != null && !newBirth.isEmpty() ? newBirth : getUserByEmail(currentEmail).getUserBirth());
            pstmt.setString(5, newPnum != null && !newPnum.isEmpty() ? newPnum : getUserByEmail(currentEmail).getUserPnum());
            pstmt.setString(6, newAddress != null && !newAddress.isEmpty() ? newAddress : getUserByEmail(currentEmail).getUserAddress());
            pstmt.setString(7, currentEmail);
            pstmt.setString(8, currentPassword);

            int result = pstmt.executeUpdate();
            return result > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
