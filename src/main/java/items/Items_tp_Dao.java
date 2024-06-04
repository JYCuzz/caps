package items;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Items_tp_Dao {
    private Connection conn;
    private ResultSet rs;

    public Items_tp_Dao() {
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

    public int getNext() {
        String SQL = "SELECT tpID FROM Items_tp ORDER BY tpID DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int write(String tpName, int tpQuan, int tpYear, int tpPrice, String tpBrand, String tpModel, String tpColor, String tpMemory, String userName, String userEmail) {
        String SQL = "INSERT INTO Items_tp VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, tpName);
            pstmt.setInt(3, tpQuan);
            pstmt.setInt(4, tpYear);
            pstmt.setInt(5, tpPrice);
            pstmt.setString(6, tpBrand);
            pstmt.setString(7, tpModel);
            pstmt.setString(8, tpColor);
            pstmt.setString(9, tpMemory);
            pstmt.setInt(10, 1);
            pstmt.setString(11, userEmail);
            pstmt.setString(12, userName);

            int result = pstmt.executeUpdate();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    // 마지막으로 삽입된 lapID를 가져오는 메서드
    public int getLastInsertedID() {
        String SQL = "SELECT tpID FROM Items_tp ORDER BY tpID DESC LIMIT 1";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
