<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <div class="logo"><a href="${pageContext.request.contextPath}/template/mainpage.jsp">발로렌트</a></div>
        <div class="nav">
            <div><a href="notice.jsp"><button>공지사항</button></a></div>
            <div><a href="about.jsp"><button>회사소개</button></a></div>
            <div><a href="contact.jsp"><button>문의하기</button></a></div>
        </div>
    </div>

    <div class="mypage-container">
        <div class="mypage-sidebar">
            <a href="myinfo.jsp"><button>개인정보확인/수정</button></a>
            <a href="myrentlist.jsp"><button>대여내역</button></a>
            <a href="myalarm.jsp"><button>알림내역</button></a>
            <a href="myinquiry.jsp"><button>문의하기/내역확인</button></a>
        </div>

        <div class="inquiry-container">
            <h2>문의하기</h2>
            <div class="inquiry-box">
                <p>제품을 실수로 파손했는데 어떤 불이익이 있을까요?</p>
                <div class="status-box">작성완료</div>
            </div>

            <h2>문의 내역확인</h2>
            <table class="inquiry-table">
                <tr>
                    <td>제품파손관련 문의</td>
                    <td>처리중</td>
                </tr>
                <tr>
                    <td>상품이 아직 도착하지 않았어요...</td>
                    <td>답변완료</td>
                </tr>
            </table>
        </div>
    </div>

    <div class="footer">
        <a href="${pageContext.request.contextPath}/template/footers/terms.jsp">이용약관</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/trade_terms.jsp">거래약관</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/privacy.jsp">개인정보 취급방침</a> | 
        <a href="${pageContext.request.contextPath}/template/footers/support.jsp">임차자 1대1 문의</a>
    </div>
</body>
</html>
