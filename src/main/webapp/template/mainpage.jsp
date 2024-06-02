<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
            <% if (userEmail == null) { %>
                <div><a href="${pageContext.request.contextPath}/template/signup.jsp">회원가입</a></div>
                <div><a href="${pageContext.request.contextPath}/template/login.jsp"><button>로그인</button></a></div>
            <% } else { %>
                <div><a href="${pageContext.request.contextPath}/template/mypages/myinfo.jsp"><button>마이페이지</button></a></div>
                <div><a href="${pageContext.request.contextPath}/action/logoutAction.jsp"><button>로그아웃</button></a></div>
            <% } %>
        </div>
    </div>

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

    <div class="footer">
    	<a href="${pageContext.request.contextPath}/template/noticeboard.jsp">공지사항</a> |
        <a href="${pageContext.request.contextPath}/template/footers/terms.jsp">이용약관</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/privacy.jsp">개인정보 취급방침</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/support.jsp">문의하기</a>
    </div>
</body>
</html>
