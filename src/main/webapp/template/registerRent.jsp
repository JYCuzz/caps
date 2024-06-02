<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>대여물품등록</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/design.css?after">
    <script>
        function updateSpecs() {
            var category = document.getElementById("registerRent-category").value;
            var specSection = document.getElementById("registerRent-spec-section");
            var specHTML = '';

            if (category === "노트북") {
                specHTML = `
                    <div class="registerRent-row">
                        <label for="registerRent-brand">브랜드 명</label>
                        <input type="text" id="registerRent-brand" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-model">모델명</label>
                        <input type="text" id="registerRent-model" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-color">컬러</label>
                        <input type="text" id="registerRent-color" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-gpu">그래픽카드</label>
                        <input type="text" id="registerRent-gpu" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-os">OS</label>
                        <input type="text" id="registerRent-os" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-cpu">CPU</label>
                        <input type="text" id="registerRent-cpu" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-memory">메모리</label>
                        <input type="text" id="registerRent-memory" class="registerRent-input">
                    </div>
                `;
            } else {
                specHTML = `
                    <div class="registerRent-row">
                        <label for="registerRent-brand" class="registerRent-label">브랜드 명</label>
                        <input type="text" id="registerRent-brand" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-model" class="registerRent-label">모델명</label>
                        <input type="text" id="registerRent-model" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-color" class="registerRent-label">컬러</label>
                        <input type="text" id="registerRent-color" class="registerRent-input">
                    </div>
                    <div class="registerRent-row">
                        <label for="registerRent-memory" class="registerRent-label">메모리</label>
                        <input type="text" id="registerRent-memory" class="registerRent-input">
                    </div>
                `;
            }

            specSection.innerHTML = specHTML;
        }
    </script>
</head>

<body>
    <button class="home-button" onclick="window.location.href='${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}/template/mainpage.jsp'">홈페이지로 돌아가기</button>

    <div class="registerRent-container">
        <div class="registerRent-header">
            <h1 class="registerRent-title">대여물품등록</h1>
        </div>
        <form class="registerRent-form">
            <label for="registerRent-device-name">기기 명 (제품명을 정확하게 입력하십시오)</label>
            <input type="text" id="registerRent-device-name" class="registerRent-input" required>

            <div class="registerRent-row">
                <div class="registerRent-column">
                    <label for="registerRent-category">분류</label>
                    <select id="registerRent-category" class="registerRent-input" onchange="updateSpecs()">
                        <option>패드/탭</option>
                        <option>노트북</option>
                    </select>
                </div>
                <div class="registerRent-column">
                    <label for="registerRent-quantity">수량</label>
                    <input type="number" id="registerRent-quantity" class="registerRent-input" required>
                </div>
            </div>

            <div class="registerRent-row">
                <div class="registerRent-column">
                    <label for="registerRent-purchase-year">구입년도</label>
                    <input type="text" id="registerRent-purchase-year" class="registerRent-input">
                </div>
                <div class="registerRent-column">
                    <label for="registerRent-monthly-rent">월 렌탈료 지정</label>
                    <input type="text" id="registerRent-monthly-rent" class="registerRent-input">
                </div>
            </div>

            <h2 class="registerRent-subtitle">스펙 입력</h2>
            <div id="registerRent-spec-section" class="registerRent-spec-section">
                <div class="registerRent-row">
                    <label for="registerRent-brand" class="registerRent-label">브랜드 명</label>
                    <input type="text" id="registerRent-brand" class="registerRent-input">
                </div>
                <div class="registerRent-row">
                    <label for="registerRent-model" class="registerRent-label">모델명</label>
                    <input type="text" id="registerRent-model" class="registerRent-input">
                </div>
                <div class="registerRent-row">
                    <label for="registerRent-color" class="registerRent-label">컬러</label>
                    <input type="text" id="registerRent-color" class="registerRent-input">
                </div>
                <div class="registerRent-row">
                    <label for="registerRent-memory" class="registerRent-label">메모리</label>
                    <input type="text" id="registerRent-memory" class="registerRent-input">
                </div>
            </div>

            <h2 class="registerRent-subtitle">기기 사진 첨부</h2>
            <button type="button" class="registerRent-upload-button">첨부파일 업로드</button>

            <button type="submit" class="registerRent-submit-button">물품 등록 요청</button>
        </form>
    </div>
</body>

</html>
