<%@ page isErrorPage="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
    <body bgcolor="white">

        <h3>${requestScope.result}</h3>

        
        <c:if test="${not empty sessionScope}">
            <c:redirect url="somepage.jsp" /> 
        </c:if>

    </body>
</html>


