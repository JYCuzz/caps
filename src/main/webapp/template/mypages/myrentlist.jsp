<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>

<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>발로렌트</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/design.css?after">
</head>
<body>
	<jsp:include page="/WEB-INF/header.jsp" />

    <div class="mypage-container">
        <div class="mypage-sidebar">
            <a href="myinfo.jsp"><button>개인정보확인/수정</button></a>
            <a href="myrentlist.jsp"><button>대여내역</button></a>
            <a href="myalarm.jsp"><button>알림내역</button></a>
            <a href="myinquiry.jsp"><button>문의하기/내역확인</button></a>
        </div>

        <div class="rental-container">
            <h2>대여한 물품</h2>
            <table class="rental-table">
                <tr>
                    <td><img src="/static/img/laptop.jpg" alt="갤럭시 오디세이"></td>
                    <td>갤럭시 오디세이</td>
                    <td>24.03.21 ~ 24.07.14</td>
                    <td>반납완료</td>
                </tr>
                <tr>
                    <td><img src="/static/img/tablet.jpg" alt="아이패드 Air 5"></td>
                    <td>아이패드 Air 5</td>
                    <td>24.01.11 ~ 25.06.24</td>
                    <td>대여중</td>
                </tr>
            </table>
            
            <h2>대여해준 물품</h2>
            <div class="register-button-container">
                <button class="register-button">대여물품 등록</button>
            </div>
            <table class="rental-table">
                <tr>
                    <td><img src="/static/img/tablet.jpg" alt="아이패드 Pro"></td>
                    <td>아이패드 Pro</td>
                    <td>24.02.23 ~ 25.04.06</td>
                    <td>대여중</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
