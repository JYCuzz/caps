<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="items.Items_laptop_Dao"%>
<%@ page import="items.Items_tp_Dao"%>
<%@ page import="items.Items_laptop"%>
<%@ page import="items.Items_tp"%>
<%@ page import="items.Laptop_img_Dao"%>
<%@ page import="items.Tp_img_Dao"%>
<%@ page import="items.Laptop_img"%>
<%@ page import="items.Tp_img"%>

<%
    String type = request.getParameter("type");
    String idParam = request.getParameter("id");
    int id = 0;

    if (idParam != null && !idParam.isEmpty()) {
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            // 유효하지 않은 숫자 형식일 경우 처리할 코드
            out.println("유효하지 않은 id 형식입니다.");
        }
    } else {
        // id 파라미터가 없을 경우 처리할 코드
        out.println("id 파라미터가 없습니다.");
    }

    Object item = null;
    String imagePath = null;

    if ("laptop".equals(type)) {
        Items_laptop_Dao dao = new Items_laptop_Dao();
        item = dao.getItemById(id);
        if (item != null) {
            Laptop_img_Dao imgDao = new Laptop_img_Dao();
            Laptop_img laptopImg = imgDao.getImageByLapID(id);
            if (laptopImg != null) {
                imagePath = request.getContextPath() + "/uploads_laptop/" + laptopImg.getLap_img_Name();
            }
        }
    } else if ("pad".equals(type)) {
        Items_tp_Dao dao = new Items_tp_Dao();
        item = dao.getItemById(id);
        if (item != null) {
            Tp_img_Dao imgDao = new Tp_img_Dao();
            Tp_img tpImg = imgDao.getImageByTpID(id);
            if (tpImg != null) {
                imagePath = request.getContextPath() + "/uploads_tp/" + tpImg.getTp_img_Name();
            }
        }
    }

    if (item == null) {
        out.println("<script>alert('아이템을 찾을 수 없습니다.'); history.back();</script>");
        return;
    }

    String userEmail = (String) session.getAttribute("userEmail");
    String sellerEmail = type.equals("laptop") ? ((Items_laptop) item).getUserEmail() : ((Items_tp) item).getUserEmail();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이템 상세 정보</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/design.css?after">
</head>
<body>
    <jsp:include page="/WEB-INF/header.jsp" />

    <main class="item-main-content">
        <div class="item-sidebar">
            <div class="item-category">
                <p>희망하는 가격대를 입력하세요. 알림으로 소식을 전해 드립니다.</p>
                <div class="item-icon">
                    <img src="${pageContext.request.contextPath}/static/img/alarm.jpg" alt="알림 아이콘">
                </div>
            </div>
            <div class="item-product-image">
                <% if (imagePath != null) { %>
                    <img src="<%= imagePath %>" alt="아이템 이미지">
                <% } else { %>
                    <img src="https://via.placeholder.com/150" alt="아이템 이미지">
                <% } %>
            </div>
        </div>
        <div class="item-product-details">
            <div class="item-search">
            </div>
            <h1><%= type.equals("laptop") ? ((Items_laptop) item).getLapName() : ((Items_tp) item).getTpName() %></h1>
            <p>수량: <%= type.equals("laptop") ? ((Items_laptop) item).getLapQuan() : ((Items_tp) item).getTpQuan() %>개<br>판매자: <%= type.equals("laptop") ? ((Items_laptop) item).getUserName() : ((Items_tp) item).getUserName() %></p>
            <p>월 렌탈료: <%= type.equals("laptop") ? ((Items_laptop) item).getLapPrice() : ((Items_tp) item).getTpPrice() %>원</p>
            <ul>
                <li>3개월: <%= type.equals("laptop") ? ((Items_laptop) item).getLapPrice() * 3 : ((Items_tp) item).getTpPrice() * 3 %>원</li>
                <li>6개월: <%= type.equals("laptop") ? ((Items_laptop) item).getLapPrice() * 6 : ((Items_tp) item).getTpPrice() * 6 %>원</li>
                <li>12개월: <%= type.equals("laptop") ? ((Items_laptop) item).getLapPrice() * 12 : ((Items_tp) item).getTpPrice() * 12 %>원</li>
            </ul>
            <table>
                <tr>
                    <td>브랜드</td>
                    <td><%= type.equals("laptop") ? ((Items_laptop) item).getLapBrand() : ((Items_tp) item).getTpBrand() %></td>
                </tr>
                <tr>
                    <td>모델명</td>
                    <td><%= type.equals("laptop") ? ((Items_laptop) item).getLapModel() : ((Items_tp) item).getTpModel() %></td>
                </tr>
                <tr>
                    <td>색상</td>
                    <td><%= type.equals("laptop") ? ((Items_laptop) item).getLapColor() : ((Items_tp) item).getTpColor() %></td>
                </tr>
                <tr>
                    <td>메모리</td>
                    <td><%= type.equals("laptop") ? ((Items_laptop) item).getLapMemory() : ((Items_tp) item).getTpMemory() %></td>
                </tr>
                <% if (type.equals("laptop")) { %>
                <tr>
                    <td>그래픽카드</td>
                    <td><%= ((Items_laptop) item).getLapGraphic() %></td>
                </tr>
                <tr>
                    <td>OS</td>
                    <td><%= ((Items_laptop) item).getLapOS() %></td>
                </tr>
                <tr>
                    <td>CPU</td>
                    <td><%= ((Items_laptop) item).getLapCPU() %></td>
                </tr>
                <% } %>
            </table>
            <div class="item-shipping-details">
                <p>배송비: 판매자에 의해 결정</p>
            </div>   
            <a id="rentLink" href="${pageContext.request.contextPath}/template/payment.jsp?type=<%= type %>&id=<%= id %>"></a>
            <% if (!userEmail.equals(sellerEmail)) { %>
            <button class="item-rent-button" onclick="document.getElementById('rentLink').click()">렌트하기</button>
            <% } %>
        </div>
    </main>
</body>
</html>
