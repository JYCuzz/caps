package notice;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NoticeDao {
    public Connection conn;
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

    // 공지사항 전체를 최신 순서대로 가져오는 메서드
    public List<Notice> getAllNotices() {
        List<Notice> notices = new ArrayList<>();
        String SQL = "SELECT * FROM notice ORDER BY date DESC"; // 날짜를 기준으로 내림차순 정렬
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

    // 제목으로 공지사항을 검색하는 메서드 (LIKE 연산자 사용)
    public List<Notice> getNoticesByTitle(String searchKeyword) {
        List<Notice> notices = new ArrayList<>();
        String SQL = "SELECT * FROM notice WHERE title LIKE ? ORDER BY date DESC"; // 날짜를 기준으로 내림차순 정렬
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, "%" + searchKeyword + "%");
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

    // 공지사항의 제목만 가져오는 메서드
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

    // 새로운 공지사항을 추가하는 메서드 (이메일은 세션에서 가져옴)
    public void addNotice(String title, String content, String userEmail) {
        String SQL = "INSERT INTO notice (userEmail, title, content, date) VALUES (?, ?, ?, NOW())";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userEmail);
            pstmt.setString(2, title);
            pstmt.setString(3, content);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
