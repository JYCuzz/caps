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

    <main class="laptop-main-content">
        <div class="laptop-keywords">
            <h2>인기 브랜드 키워드</h2>
            <div class="laptop-keyword-box">
                <span>MAC</span>
                <span>SAMSUNG</span>
                <span>LG</span>
                <span>ASUS</span>
                <span>LENOVO</span>
                <span>etc</span>
                <span>etc</span>
                <span>etc</span>
            </div>
            <div class="laptop-search">
                <input type="text" placeholder="제품 검색">
                <button>🔍</button>
            </div>
        </div>
        <div class="laptop-item-list">
            <div class="laptop-item">
                <a href="${pageContext.request.contextPath}/template/itempage.jsp"><img src="https://via.placeholder.com/150" alt="샘숭 오디세이"></a>
                <p>샘숭 오디세이</p>
                <p>수량: 1</p>
                <p>월 렌탈료: 25,000원</p>
                <p>판매자: 홍길동</p>
            </div>
            <div class="laptop-item">
                <a href="${pageContext.request.contextPath}/template/itempage.jsp"><img src="https://via.placeholder.com/150" alt="사과책"></a>
                <p>사과책</p>
                <p>수량: 1</p>
                <p>월 렌탈료: 35,000원</p>
                <p>판매자: 홍길동</p>
            </div>
            <div class="laptop-item">
                <a href="${pageContext.request.contextPath}/template/itempage.jsp"><img src="https://via.placeholder.com/150" alt="아서스 메네실"></a>
                <p>아서스 메네실</p>
                <p>수량: 1</p>
                <p>월 렌탈료: 15,000원</p>
                <p>판매자: 홍길동</p>
            </div>
            <div class="laptop-item">
                <a href="${pageContext.request.contextPath}/template/itempage.jsp"><img src="https://via.placeholder.com/150" alt="엘지 그램"></a>
                <p>엘지 그램</p>
                <p>수량: 1</p>
                <p>월 렌탈료: 15,000원</p>
                <p>판매자: 홍길동</p>
            </div>
        </div>
    </main>
</body>
</html>
