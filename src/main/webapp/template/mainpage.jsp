<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="notice.NoticeDao, notice.Notice" %>
<%@ page import="user.User" %>
<%@ page import="user.UserDao" %>
<%@ page import="items.Items_laptop" %>
<%@ page import="items.Items_laptop_Dao" %>
<%@ page import="items.Items_tp" %>
<%@ page import="items.Items_tp_Dao" %>
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
                        Items_laptop_Dao laptopDao = new Items_laptop_Dao();
                        List<Items_laptop> laptopList = laptopDao.getRecentItems(5);
                        for (Items_laptop laptop : laptopList) {
                    %>
                    <tr>
                        <td><a href="${pageContext.request.contextPath}/template/itempage.jsp?type=laptop&id=<%= laptop.getLapID() %>"><%= laptop.getLapName() %></a></td>
                        <td><%= laptop.getLapPrice() %>원</td>
                        <td><%= laptop.getUserName() %></td>
                    </tr>
                    <%
                        }

                        Items_tp_Dao tpDao = new Items_tp_Dao();
                        List<Items_tp> tpList = tpDao.getRecentItems(5);
                        for (Items_tp tp : tpList) {
                    %>
                    <tr>
                        <td><a href="item_detail.jsp?id=<%= tp.getTpID() %>"><%= tp.getTpName() %></a></td>
                        <td><%= tp.getTpPrice() %>원</td>
                        <td><%= tp.getUserName() %></td>
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

    <div class="footer">
        <a href="${pageContext.request.contextPath}/template/noticeboard.jsp">공지사항</a> |
        <a href="${pageContext.request.contextPath}/template/footers/terms.jsp">이용약관</a> |
        <a href="${pageContext.request.contextPath}/template/footers/privacy.jsp">개인정보 취급방침</a> |
        <a href="javascript:void(0);" onclick="redirectToInquiry()">문의하기</a>
    </div>
</body>
</html>
