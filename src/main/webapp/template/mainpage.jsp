<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="notice.NoticeDao, notice.Notice" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>발로렌트</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/design.css?after">
    <style>
        .more-btn {
            background: none;
            border: none;
            color: inherit;
            font: inherit;
            cursor: pointer;
            outline: inherit;
            text-align: right;
            float: right;
        }
        .more-btn:hover {
            text-decoration: underline;
        }
    </style>
    <script>
        function redirectToInquiry() {
            var isLoggedIn = <%= (session.getAttribute("userEmail") != null) ? "true" : "false" %>;
            if (isLoggedIn) {
                window.location.href = '${pageContext.request.contextPath}/template/mypages/myinquiry.jsp';
            } else {
                window.location.href = '${pageContext.request.contextPath}/template/login.jsp';
            }
        }
    </script>
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
                    <tr>
                        <td>맥북</td>
                        <td>25,000원</td>
                        <td>홍길동</td>
                    </tr>
                    <tr>
                        <td>갤럭시 오디세이</td>
                        <td>35,000원</td>
                        <td>홍길동</td>
                    </tr>
                    <tr>
                        <td>아이패드 Air 5</td>
                        <td>22,000원</td>
                        <td>홍길동</td>
                    </tr>
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
