<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <div class="payment-container">
        <h1>주문하기</h1>
        
        <section class="payment-order-summary">
            <h2>주문상품 정보</h2>
            <table class="payment-table">
                <thead>
                    <tr>
                        <th>제품정보</th>
                        <th>판매가격</th>
                        <th>주문수량</th>
                        <th>합계</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}/static/img/laptop.jpg" alt="제품 이미지" class="payment-product-img">
                            <p>닥터엘리자베스 멀티비타민</p>
                            <p>옵션: 500mg / 120정 / 1개</p>
                        </td>
                        <td>11,000원</td>
                        <td>1개</td>
                        <td>11,000원</td>
                    </tr>
                    <tr>
                        <td>
                            <img src="${pageContext.request.contextPath}/static/img/tablet.jpg" alt="제품 이미지" class="payment-product-img">
                            <p>비타민C 500</p>
                            <p>옵션: 500mg / 120정 / 1개</p>
                        </td>
                        <td>11,000원</td>
                        <td>2개</td>
                        <td>22,000원</td>
                    </tr>
                </tbody>
            </table>
        </section>
        
        <section class="payment-shipping-info">
            <h2>배송지 정보</h2>
            <form class="payment-form" action="processOrder.jsp" method="post">
                <label for="name">받는 사람</label>
                <input type="text" id="name" name="name" placeholder=" 12자 이내로 입력해주세요 " class="payment-input">
                
                <label for="phone">이메일</label>
                <input type="text" id="email" name="email" placeholder=" example@email.com "class="payment-input">
                
                <label for="phone">휴대폰</label>
                <input type="text" id="phone" name="phone" placeholder=" 010-1234-5678 "class="payment-input">
                
                <label for="address">주소</label>
				<div class="address-container">
    				<input type="text" id="address" name="address" placeholder="주소를 입력해주세요" class="payment-input half-width">
    				<input type="text" id="detailed-address" name="detailed-address" placeholder="상세주소를 입력해주세요" class="payment-input half-width">
				</div>
                
                <label for="message">배송시 요청사항</label>
                <input type="text" id="message" name="message" class="payment-input">
                
                <button type="submit" class="payment-button">배송지 입력</button>
            </form>
        </section>
        
		<section class="payment-info">
        	<h2>결제 정보</h2>
            <div class="payment-methods">
            	<label><input type="radio" name="payment-method" value="card"> 신용카드</label>
            	<label><input type="radio" name="payment-method" value="bank"> 무통장입금</label>
            	<label><input type="radio" name="payment-method" value="paypal"> PayPal</label>
            </div>
        </section>
            
        <section class="payment-total">
             <h2>총 주문금액</h2>
             <div class="total-details">
             	<div class="total-row">
                	<span>주문금액</span>
                    <span>34,000원</span>
                </div>
                <div class="total-row">
                    <span>할인금액</span>
                    <span>0원</span>
                </div>
                <div class="total-row">
                    <span>배송비</span>
                    <span>0원</span>
                </div>
                <div class="total-row">
                    <span>적립예정 포인트</span>
                    <span>0점</span>
                </div>
                <p>* 회원 로그인 시 적립되는 포인트입니다.</p>
                <div class="total-row final-total">
                	<span>최종결제금액</span>
                    <span class="final-amount">34,000원</span>
                </div>
      		</div>
      	</section>
      	
      	<button type="submit" class="payment-button" onclick="location.href='${pageContext.request.contextPath}/template/payment-complete.jsp'">결제하기</button>
        <button type="button" class="payment-cancel-button" onclick="location.href='${pageContext.request.contextPath}/template/mainpage.jsp'">취소하기</button>
        
    </div>
</body>
</html>
