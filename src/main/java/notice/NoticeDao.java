package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public NoticeDao() {
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

    public List<Notice> getAllNotices() {
        List<Notice> notices = new ArrayList<>();
        String SQL = "SELECT * FROM notice";
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Notice notice = new Notice();
                notice.setUserEmail(rs.getString("userEmail"));
                notice.setTitle(rs.getString("title"));
                notice.setContent(rs.getString("content"));
                notice.setDate(rs.getString("date"));
                notices.add(notice);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return notices;
    }
    
    // 공지사항의 제목만 가져오는 새로운 메소드
    public List<String> getAllNoticeTitles() {
        List<String> titles = new ArrayList<>();
        String SQL = "SELECT title FROM notice";
        try {
            pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                titles.add(rs.getString("title"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return titles;
    }
}
