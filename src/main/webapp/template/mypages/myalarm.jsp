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
        <div class="logo"><a href="/template/mainpage.html">발로렌트</a></div>
        <div class="nav">
            <div><a href="notice.html"><button>공지사항</button></a></div>
            <div><a href="about.html"><button>회사소개</button></a></div>
            <div><a href="contact.html"><button>문의하기</button></a></div>
        </div>
    </div>

    <div class="mypage-container">
        <div class="mypage-sidebar">
            <a href="myinfo.html"><button>개인정보확인/수정</button></a>
            <a href="myrentlist.html"><button>대여내역</button></a>
            <a href="myalarm.html"><button>알림내역</button></a>
            <a href="myinquiry.html"><button>문의하기/내역확인</button></a>
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

    <div class="footer">
        <a href="/template/footers/terms.html">이용약관</a> | 
        <a href="/template/footers/trade_terms.html">거래약관</a> | 
        <a href="/template/footers/privacy.html">개인정보 취급방침</a> | 
        <a href="/template/footers/support.html">임차자 1대1 문의</a>
    </div>
</body>
</html>
