<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결제 완료</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/design.css?after">
</head>
<body class="payment-complete-body">
    <div class="payment-complete-container">
        <div class="payment-complete-header">
            <img src="${pageContext.request.contextPath}/static/img/complete.png" alt="완료 아이콘" class="payment-complete-icon">
            <h1>결제가 정상적으로 이루어졌습니다.</h1>
        </div>
        <div class="payment-complete-details">
            <div class="payment-complete-row">
                <span>일시</span>
                <span>2020.10.19 19:54</span>
            </div>
            <div class="payment-complete-row">
                <span>제품명</span>
                <span>샘숭</span>
            </div>
            <div class="payment-complete-row">
                <span>결제번호</span>
                <span>202 ○○○○ 0701</span>
            </div>
            <div class="payment-complete-row">
                <span>배송지</span>
                <span>광주광역시</span>
            </div>
            <div class="payment-complete-details-box">
                <div class="payment-complete-subrow">
                    <span>최종결제금액</span>
                    <span>34000원</span>
                </div>
            </div>
            <div class="payment-complete-footer">
                <span>현금 영수증 발행</span>
            </div>
        </div>
    </div>
</body>
</html>