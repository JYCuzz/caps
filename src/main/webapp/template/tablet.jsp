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

    <main class="tablet-main-content">
        <div class="tablet-keywords">
            <h2>인기 브랜드 키워드</h2>
            <div class="tablet-keyword-box">
                <span>MAC</span>
                <span>SAMSUNG</span>
                <span>LG</span>
                <span>ASUS</span>
                <span>LENOVO</span>
                <span>etc</span>
                <span>etc</span>
                <span>etc</span>
            </div>
            <div class="tablet-search">
                <input type="text" placeholder="제품 검색">
                <button>🔍</button>
            </div>
        </div>
        <div class="tablet-item-list">
            <div class="tablet-item">
                <a href="itempage.html"><img src="https://via.placeholder.com/150" alt="샘숭 오디세이"></a>
                <p>샘숭 오디세이</p>
                <p>수량: 1</p>
                <p>월 렌탈료: 25,000원</p>
                <p>판매자: 홍길동</p>
            </div>
            <div class="tablet-item">
                <a href="itempage.html"><img src="https://via.placeholder.com/150" alt="사과책"></a>
                <p>사과책</p>
                <p>수량: 1</p>
                <p>월 렌탈료: 35,000원</p>
                <p>판매자: 홍길동</p>
            </div>
            <div class="tablet-item">
                <a href="itempage.html"><img src="https://via.placeholder.com/150" alt="아서스 메네실"></a>
                <p>아서스 메네실</p>
                <p>수량: 1</p>
                <p>월 렌탈료: 15,000원</p>
                <p>판매자: 홍길동</p>
            </div>
            <div class="tablet-item">
                <a href="itempage.html"><img src="https://via.placeholder.com/150" alt="엘지 그램"></a>
                <p>엘지 그램</p>
                <p>수량: 1</p>
                <p>월 렌탈료: 15,000원</p>
                <p>판매자: 홍길동</p>
            </div>
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
