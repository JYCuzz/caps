<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, notice.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        <form method="post" action="notice_write.jsp">
            <label for="title">제목:</label>
            <input type="text" id="title" name="title" required>
            <label for="content">내용:</label>
            <textarea id="content" name="content" rows="10" required></textarea>
            <button type="submit">작성 완료</button>
        </form>
    </div>
    <%
    	request.setCharacterEncoding("UTF-8");
        // 공지사항 추가 처리
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String userEmail = (String) session.getAttribute("userEmail");

        if (title != null && content != null && userEmail != null) {
            NoticeDao noticeDao = new NoticeDao();
            noticeDao.addNotice(title, content, userEmail);
            response.sendRedirect(request.getContextPath() + "/template/noticeboard.jsp");
        }
    %>
</body>
</html>
