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

        <!-- board list area -->
        <div id="board-list">
            <div class="noticeboard-container">
                <table class="board-table">
                    <thead>
                        <tr>
                            <th scope="col" class="th-num">번호</th>
                            <th scope="col" class="th-title">제목</th>
                            <th scope="col" class="th-date">등록일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>3</td>
                            <th>
                                <a href="#">[공지사항] 개인정보 처리방침 변경안내처리방침</a>
                                <p>테스트</p>
                            </th>
                            <td>2024.06.02</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <th><a href="#">[공지사항] 이용약관 안내</a></th>
                            <td>2024.06.02</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <th><a href="#">[공지사항] 공지사항 안내입니다. 이용해주셔서 감사합니다</a></th>
                            <td>2024.06.02</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
    
    <div class="footer">
        <a href="${pageContext.request.contextPath}/template/footers/terms.jsp">이용약관</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/trade_terms.jsp">거래약관</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/privacy.jsp">개인정보 취급방침</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/support.jsp">임차자 1대1 문의</a>
    </div>
</body>
</html>
