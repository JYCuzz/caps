<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <table>
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
            <table>
                <thead>
                    <tr>
                        <th>공지사항</th>
                        <th>더보기</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td colspan="2">허위 매물 처벌합니다</td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
