<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="items.Items_Dao" %>
<%@ page import="items.Items_Dao.Item" %>
<%@ page import="notice.NoticeDao, notice.Notice" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>발로렌트</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/design.css?after">
</head>
<body>
    <jsp:include page="/WEB-INF/header.jsp" />
    
    <div class="main-container">
        <div class="main-section">
            <a href="${pageContext.request.contextPath}/template/laptop.jsp">
                <img src="${pageContext.request.contextPath}/static/img/laptop.jpg" alt="노트북 대여">
                <p>노트북 대여</p>
            </a>
        </div>
        <div class="main-section">
            <a href="${pageContext.request.contextPath}/template/tablet.jsp">
                <img src="${pageContext.request.contextPath}/static/img/tablet.jpg" alt="패드/탭 대여">
                <p>패드/탭 대여</p>
            </a>
        </div>
    </div>

    <div class="main-content">
        <div class="left">
            <table class="common-table">
                <thead>
                    <tr>
                        <th>대여 UP! 리스트</th>
                        <th>월간 대여비</th>
                        <th>판매자</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Items_Dao dao = new Items_Dao();
                        List<Item> recentItems = dao.getRecentItems(5);
                        for (Item item : recentItems) {
                            String url = "${pageContext.request.contextPath}/template/itempage.jsp?type=" + item.getType() + "&id=" + item.getId();
                    %>
                    <tr>
                        <td><a href="<%= url %>"><%= item.getName() %></a></td>
                        <td><%= item.getPrice() %>원</td>
                        <td><%= item.getSeller() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
        <div class="right">
            <table class="common-table">
                <thead>
                    <tr>
                        <th colspan="2">공지사항 
                            <button class="more-btn" onclick="location.href='${pageContext.request.contextPath}/template/noticeboard.jsp'">더보기</button>
                        </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        NoticeDao noticeDao = new NoticeDao();
                        List<Notice> notices = noticeDao.getAllNotices(); // 날짜 순서로 정렬된 공지사항 목록
                        int count = 0;
                        for (Notice notice : notices) {
                            if (count >= 5) {
                                break;
                            }
                    %>
                    <tr>
                        <td><a href="notice_detail.jsp?title=<%= java.net.URLEncoder.encode(notice.getTitle(), "UTF-8") %>"><%= notice.getTitle() %></a></td>
                        <td><%= notice.getDate() %></td>
                    </tr>
                    <%
                            count++;
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
