<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, notice.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>발로렌트</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/design.css?after">
    <script>
        function openPopup() {
            var popup = window.open("", "공지사항 작성", "width=600,height=400");
            popup.document.write(`
                <html>
                <head>
                    <title>공지사항 작성</title>
                    <style>
                        body {
                            font-family: Arial, sans-serif;
                        }
                        .container {
                            width: 100%;
                            max-width: 500px;
                            margin: 0 auto;
                        }
                        input[type="text"], textarea {
                            width: 100%;
                            padding: 10px;
                            margin: 10px 0;
                            border: 1px solid #ccc;
                            border-radius: 5px;
                        }
                        button {
                            padding: 10px 20px;
                            border: none;
                            background-color: #333;
                            color: white;
                            cursor: pointer;
                            border-radius: 5px;
                        }
                    </style>
                </head>
                <body>
                    <div class="container">
                        <h2>공지사항 작성</h2>
                        <form method="post" action="">
                            <label for="title">제목:</label>
                            <input type="text" id="title" name="title" required>
                            <label for="content">내용:</label>
                            <textarea id="content" name="content" rows="10" required></textarea>
                            <button type="submit">작성 완료</button>
                        </form>
                    </div>
                </body>
                </html>
            `);
        }
    </script>
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

        <!-- 작성 버튼 -->
        <%
            String userEmail = (String) session.getAttribute("userEmail");
            if (userEmail != null && userEmail.startsWith("admin")) {
        %>
        <div class="noticeboard-container" style="text-align: right; margin-bottom: 10px;">
            <button type="button" class="noticeboard-btn noticeboard-btn-dark" onclick="openPopup()">작성</button>
        </div>
        <%
            }

            // 공지사항 추가 처리
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            if (title != null && content != null && userEmail != null) {
                NoticeDao noticeDao = new NoticeDao();
                noticeDao.addNotice(title, content, userEmail);
                response.sendRedirect(request.getContextPath() + "/template/mainpage.jsp");
            }
        %>

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
                                String email = notice.getUserEmail();
                                String shortEmail = email.length() > 5 ? email.substring(0, 5) : email;
                        %>
                        <tr>
                            <td><%= number++ %></td>
                            <td><%= shortEmail %></td>
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
