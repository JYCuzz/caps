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
	<%
        String userEmail = null;
        if (session.getAttribute("userEmail") != null){
            userEmail = (String) session.getAttribute("userEmail");
        }
    %>
    
    <div class="header">
        <div class="logo"><a href="${pageContext.request.contextPath}/template/mainpage.jsp">발로렌트</a></div>
        <div class="nav">
            <div><a href="${pageContext.request.contextPath}/template/noticeboard.jsp">공지사항</a></div>
            <% if (userEmail == null) { %>
                <div><a href="${pageContext.request.contextPath}/template/signup.jsp">회원가입</a></div>
                <div><a href="${pageContext.request.contextPath}/template/login.jsp"><button>로그인</button></a></div>
            <% } else { %>
                <div><a href="about.jsp"><button>회사소개</button></a></div>
                <div><a href="contact.jsp"><button>문의하기</button></a></div>
                <div><a href="${pageContext.request.contextPath}/template/mypages/myinfo.jsp"><button>마이페이지</button></a></div>
                <div><a href="${pageContext.request.contextPath}/action/logoutAction.jsp"><button>로그아웃</button></a></div>
            <% } %>
        </div>
    </div>
    
    <main class="item-main-content">
        <div class="item-sidebar">
            <div class="item-category">
                <p>희망하는 가격대를 입력하세요. 알림으로 소식을 전해 드립니다.</p>
                <div class="item-icon">
                    <img src="https://via.placeholder.com/30" alt="알림 아이콘">
                </div>
            </div>
            <div class="item-product-image">
                <img src="https://via.placeholder.com/150" alt="아이패드 Air 5">
            </div>
            <div class="item-thumbnail-images">
                <img src="https://via.placeholder.com/40" alt="Thumbnail 1">
                <img src="https://via.placeholder.com/40" alt="Thumbnail 2">
                <img src="https://via.placeholder.com/40" alt="Thumbnail 3">
                <img src="https://via.placeholder.com/40" alt="Thumbnail 4">
            </div>
        </div>
        <div class="item-product-details">
            <div class="item-search">
                <input type="text" placeholder="제품 검색">
                <button>🔍</button>
            </div>
            <h1>아이패드 Air 5</h1>
            <p>수량: 2개<br>판매자: 홍길동</p>
            <p>월 렌탈료</p>
            <ul>
                <li>3개월: 25,000원</li>
                <li>6개월: 75,000원</li>
                <li>12개월: 150,000원</li>
            </ul>
            <table>
                <tr>
                    <td>브랜드</td>
                    <td>APPLE</td>
                </tr>
                <tr>
                    <td>모델명</td>
                    <td>AIR 5 NADOMOLA</td>
                </tr>
                <tr>
                    <td>색상</td>
                    <td>블랙</td>
                </tr>
                <tr>
                    <td>메모리</td>
                    <td>64GB / RAM 16GB</td>
                </tr>
            </table>
            <div class="item-shipping-details">
                <p>배송비: 판매자에 의해 결정</p>
            </div>
            <button class="item-rent-button">렌트하기</button>
        </div>
    </main>

    <div class="footer">
        <a href="${pageContext.request.contextPath}/template/footers/terms.jsp">이용약관</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/trade_terms.jsp">거래약관</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/privacy.jsp">개인정보 취급방침</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/support.jsp">임차자 1대1 문의</a>
    </div>
</body>
</html>
