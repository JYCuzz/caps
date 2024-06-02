<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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

    <div class="mypage-container">
        <div class="mypage-sidebar">
            <a href="myinfo.jsp"><button>개인정보확인/수정</button></a>
            <a href="myrentlist.jsp"><button>대여내역</button></a>
            <a href="myalarm.jsp"><button>알림내역</button></a>
            <a href="myinquiry.jsp"><button>문의하기/내역확인</button></a>
        </div>

        <div class="notifications-container">
            <h2>알림 확인</h2>
            <table class="notifications-table">
                <tr>
                    <td>갤럭시 오디세이 반납 일자가까지 3일 남았습니다!</td>
                </tr>
                <tr>
                    <td>아이패드 pro 최저가 갱신!</td>
                </tr>
                <tr>
                    <td>아이패드 Air 5 xxx원 가격 도달!</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>
