<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sách Online</title>

    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/content.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>

<body>

    <jsp:include page="includes/header.jsp" />

    <main id="content">

        <c:if test="${empty hideSidebar}">
            <jsp:include page="includes/sidebar.jsp" />
        </c:if>

        <div class="main" style="${not empty hideSidebar ? 'width: 100%; max-width: 1200px; margin: 0 auto;' : ''}">
            <jsp:include page="${empty view ? 'includes/homeContent.jsp' : view}" />
        </div>

    </main>

    <jsp:include page="includes/footer.jsp" />

</body>
</html>