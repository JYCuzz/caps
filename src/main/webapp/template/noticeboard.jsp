<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, notice.*" %>
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

    <section class="noticeboard">
        <div class="noticeboard-title">
            <div class="noticeboard-container">
                <h3>공지사항</h3>
            </div>
        </div>

        <!-- board search area -->
        <div id="board-search">
            <div class="noticeboard-container">
                <div class="search-window">
                    <form action="">
                        <div class="search-wrap">
                            <label for="search" class="noticeboard-blind">공지사항 내용 검색</label>
                            <input id="search" type="search" name="" placeholder="검색어를 입력해주세요." value="">
                            <button type="submit" class="noticeboard-btn noticeboard-btn-dark">검색</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!-- board list area -->
        <div id="board-list">
            <div class="noticeboard-container">
                <table class="board-table">
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-userName">작성자</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-date">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            NoticeDao noticeDao = new NoticeDao();
                            List<Notice> notices = noticeDao.getAllNotices();
                            int number = 1;
                            for (Notice notice : notices) {
                        %>
                        <tr>
                            <td><%= number++ %></td>
                            <td><%= notice.getUserEmail() %></td>
                            <td><a href="#"><%= notice.getTitle() %></a></td>
                            <td><%= notice.getDate() %></td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</body>
</html>
