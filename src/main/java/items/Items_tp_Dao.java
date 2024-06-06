package items;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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

    private Connection getConnection() throws Exception {
        String dbURL = "jdbc:mysql://localhost:3306/caps";
        String dbID = "root";
        String dbPassword = "0000";
        return DriverManager.getConnection(dbURL, dbID, dbPassword);
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
    
    // 마지막으로 삽입된 tpID를 가져오는 메서드
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
    
    public List<Items_tp> getItemsByUserEmail(String userEmail) {
        List<Items_tp> list = new ArrayList<>();
        String SQL = "SELECT * FROM Items_tp WHERE userEmail = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Items_tp item = new Items_tp();
                item.setTpID(rs.getInt("tpID"));
                item.setTpName(rs.getString("tpName"));
                item.setTpQuan(rs.getInt("tpQuan"));
                item.setTpYear(rs.getInt("tpYear"));
                item.setTpPrice(rs.getInt("tpPrice"));
                item.setTpBrand(rs.getString("tpBrand"));
                item.setTpModel(rs.getString("tpModel"));
                item.setTpColor(rs.getString("tpColor"));
                item.setTpMemory(rs.getString("tpMemory"));
                item.setTpAvailable(rs.getInt("tpAvailable"));
                item.setUserEmail(rs.getString("userEmail"));
                item.setUserName(rs.getString("userName"));
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Items_tp getItemById(int id) {
        String SQL = "SELECT * FROM Items_tp WHERE tpID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Items_tp item = new Items_tp();
                    item.setTpID(rs.getInt("tpID"));
                    item.setTpName(rs.getString("tpName"));
                    item.setTpQuan(rs.getInt("tpQuan"));
                    item.setTpYear(rs.getInt("tpYear"));
                    item.setTpPrice(rs.getInt("tpPrice"));
                    item.setTpBrand(rs.getString("tpBrand"));
                    item.setTpModel(rs.getString("tpModel"));
                    item.setTpColor(rs.getString("tpColor"));
                    item.setTpMemory(rs.getString("tpMemory"));
                    item.setTpAvailable(rs.getInt("tpAvailable"));
                    item.setUserEmail(rs.getString("userEmail"));
                    item.setUserName(rs.getString("userName"));
                    return item;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
