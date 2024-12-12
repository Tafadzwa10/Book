<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Footer Page</title>
    </head>
    <body>
        <h3>Online Bookstore Copyright Information</h3>
        <footer>
            <p>&copy; <c:out value="${pageContext.request.time.year + 1900}" /> Online Bookstore</p>
        </footer>
    </body>
</html>

