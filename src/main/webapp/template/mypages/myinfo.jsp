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

        <div class="container myinfo">
            <h2>개인정보확인/수정</h2>
            <form>
                <table class="info-table">
                    <tr>
                        <td>아이디(이메일)</td>
                        <td><input type="email" value="abc1234@naver.com" readonly></td>
                        <td><input type="email" placeholder="변경할 이메일을 입력"></td>
                    </tr>
                    <tr>
                        <td>비밀번호</td>
                        <td><input type="password" placeholder="현재 비밀번호 입력"></td>
                        <td><input type="password" placeholder="새 비밀번호 입력"></td>
                    </tr>
                    <tr>
                        <td>이름</td>
                        <td><input type="text" value="홍길동" readonly></td>
                        <td><input type="text" placeholder="변경할 이름 입력"></td>
                    </tr>
                    <tr>
                        <td>생년월일</td>
                        <td><input type="text" value="2000.01.12" readonly></td>
                        <td><input type="text" placeholder="변경할 생년월일 입력"></td>
                    </tr>
                    <tr>
                        <td>핸드폰번호</td>
                        <td><input type="text" value="010-1234-5678" readonly></td>
                        <td><input type="text" placeholder="변경할 전화번호 입력"></td>
                    </tr>
                    <tr>
                        <td>주소</td>
                        <td><input type="text" value="광주 광산구" readonly></td>
                        <td><input type="text" placeholder="변경할 주소 입력"></td>
                    </tr>
                    <tr>
                        <td>대학생 증명</td>
                        <td colspan="2"><input type="text" value="증명 완료" readonly></td>
                    </tr>
                </table>
                <div class="buttons">
                    <button type="submit">수정</button>
                    <button type="button" onclick="window.location.href='회원탈퇴.html'">회원탈퇴</button>
                </div>
            </form>
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
