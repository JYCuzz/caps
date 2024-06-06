package items;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Items_laptop_Dao {
    private Connection conn;
    private ResultSet rs;

    public Items_laptop_Dao() {
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
        String SQL = "SELECT lapID FROM Items_laptop ORDER BY lapID DESC";
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

    public int write(String lapName, int lapQuan, int lapYear, int lapPrice, String lapBrand, String lapModel, String lapColor, String lapMemory, String lapGraphic, String lapOS, String lapCPU, String userName, String userEmail) {
        String SQL = "INSERT INTO Items_laptop VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, lapName);
            pstmt.setInt(3, lapQuan);
            pstmt.setInt(4, lapYear);
            pstmt.setInt(5, lapPrice);
            pstmt.setString(6, lapBrand);
            pstmt.setString(7, lapModel);
            pstmt.setString(8, lapColor);
            pstmt.setString(9, lapGraphic);
            pstmt.setString(10, lapOS);
            pstmt.setString(11, lapCPU);
            pstmt.setString(12, lapMemory);
            pstmt.setInt(13, 1);
            pstmt.setString(14, userEmail);
            pstmt.setString(15, userName);

            int result = pstmt.executeUpdate();
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
    
    // 마지막으로 삽입된 lapID를 가져오는 메서드
    public int getLastInsertedID() {
        String SQL = "SELECT lapID FROM items_laptop ORDER BY lapID DESC LIMIT 1";
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
    
    public List<Items_laptop> getItemsByUserEmail(String userEmail) {
        List<Items_laptop> list = new ArrayList<>();
        String SQL = "SELECT * FROM Items_laptop WHERE userEmail = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userEmail);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Items_laptop item = new Items_laptop();
                item.setLapID(rs.getInt("lapID"));
                item.setLapName(rs.getString("lapName"));
                // 다른 필드들 설정
                list.add(item);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Items_laptop getItemById(int id) {
        String SQL = "SELECT * FROM Items_laptop WHERE lapID = ?";
        try (Connection conn = getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SQL)) {
            pstmt.setInt(1, id);
            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    Items_laptop item = new Items_laptop();
                    item.setLapID(rs.getInt("lapID"));
                    item.setLapName(rs.getString("lapName"));
                    item.setLapQuan(rs.getInt("lapQuan"));
                    item.setLapYear(rs.getInt("lapYear"));
                    item.setLapPrice(rs.getInt("lapPrice"));
                    item.setLapBrand(rs.getString("lapBrand"));
                    item.setLapModel(rs.getString("lapModel"));
                    item.setLapColor(rs.getString("lapColor"));
                    item.setLapGraphic(rs.getString("lapGraphic"));
                    item.setLapOS(rs.getString("lapOS"));
                    item.setLapCPU(rs.getString("lapCPU"));
                    item.setLapMemory(rs.getString("lapMemory"));
                    item.setLapAvailable(rs.getInt("lapAvailable"));
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
