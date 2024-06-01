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
    <div class="header">
        <div class="logo"><a href="mainpage.html">발로렌트</a></div>
        <div class="nav">
            <div><a href="notice.html">공지사항</a></div>
            <div><a href="${pageContext.request.contextPath}/template/signup.jsp">회원가입</a></div>
            <div><a href="${pageContext.request.contextPath}/template/login.jsp"><button>로그인</button></a></div>
        </div>
    </div>

    <div class="main-container">
        <div class="main-section">
            <a href="notebook.html">
                <img src="${pageContext.request.contextPath}/static/img/laptop.jpg" alt="노트북 대여">
                <p>노트북 대여</p>
            </a>
        </div>
        <div class="main-section">
            <a href="pad.html">
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
                        <td>맥북</td>            <!-- 더미 -->
                        <td>25,000원</td>        <!-- 더미 -->
                        <td>홍길동</td>            <!-- 더미 -->
                    </tr>
                    <tr>
                        <td>갤럭시 오디세이</td>    <!-- 더미 -->
                        <td>35,000원</td>        <!-- 더미 -->
                        <td>홍길동</td>            <!-- 더미 -->
                    </tr>
                    <tr>
                        <td>아이패드 Air 5</td>    <!-- 더미 -->
                        <td>22,000원</td>        <!-- 더미 -->
                        <td>홍길동</td>            <!-- 더미 -->
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
                        <td colspan="2">허위 매물 처벌합니다</td> <!-- 더미 -->
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <div class="footer">
        <a href="${pageContext.request.contextPath}/template/login.jspfooters/terms.html">이용약관</a> | 
        <a href="${pageContext.request.contextPath}/template/login.jspfooters/trade_terms.html">거래약관</a> | 
        <a href="${pageContext.request.contextPath}/template/login.jspfooters/privacy.html">개인정보 취급방침</a> | 
        <a href="${pageContext.request.contextPath}/template/login.jspfooters/support.html">임차자 1대1 문의</a>
    </div>
</body>
</html>

