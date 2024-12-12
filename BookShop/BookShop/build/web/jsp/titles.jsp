<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<html>
    <head>
        <title>Online Bookstore</title>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
    </head>
    <body bgcolor="#FFFFFF" text="#000000">

        <h2 align="center"><font color="#003333">ADMIT ONLINE BOOKSTORE</font></h2>
        <hr>

        <!-- Shopping Cart Section -->
        <table width="38%" border="0" cellspacing="1" cellpadding="0" height="53" align="left">
            <tr>
                <td bgcolor="#E2E2E2">
                    <div align="left">
                        <font face="Arial, Helvetica, sans-serif"><b>Items in your Shopping Cart</b></font>
                    </div>
                </td>
            </tr>

            <c:if test="${not empty sessionScope.cart}">
                <c:set var="totalCostOfOrder" value="0.00" />
                <c:forEach var="entry" items="${sessionScope.cart}">
                    <c:set var="item" value="${entry.value}" />
                    <c:set var="cost" value="${item.orderCost}" />
                    <c:set var="totalCostOfOrder" value="${totalCostOfOrder + cost}" />
                    <tr>
                        <td height="13" bgcolor="#E8FFE8">
                            <c:out value="${item}" />
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td height="13" bgcolor="#CCCCCC">
                        <div align="right">
                            <b>Order Total: <fmt:formatNumber value="${totalCostOfOrder}" type="currency" /></b>
                        </div>
                    </td>
                </tr>
            </c:if>

            <c:if test="${empty sessionScope.cart}">
                <tr>
                    <td height="13">No Items in Cart</td>
                </tr>
            </c:if>
        </table>

        <!-- Product List and Add to Cart Form -->
        <h2 align="center">WELCOME TO THE ONLINE BOOKSHOP</h2>
        <form name="form1" method="post" action="./books">
            <input type="hidden" name="action" value="add_to_cart">


            <table width="93%" border="2" cellspacing="0" cellpadding="1" bordercolor="#FFFFFF">
                <tr bgcolor="#CCCCCC">
                    <td width="10%"><b>ISBN</b></td>
                    <td width="37%"><b>Title</b></td>
                    <td width="24%"><b>Author</b></td>
                    <td width="13%"><b>Price</b></td>
                    <td width="10%"><b>Quantity</b></td>
                    <td width="6%"><b>Add</b></td>
                </tr>


                <c:forEach var="book" items="${books}">
                    <tr bgcolor="#F4F4F4">
                        <td width="10%">
                            <c:out value="${book.isbn}" />
                        </td>
                        <td width="37%">
                            <c:out value="${book.title}" />
                        </td>
                        <td width="24%">
                            <c:out value="${book.author}" />
                        </td>
                        <td width="13%">
                            <c:out value="${book.dollarPrice}" />
                        </td>
                        <td width="10%">
                            <select name="${book.isbn}" size="1">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                            </select>
                        </td>
                        <td width="6%">
                            <div align="center">
                                <input type="checkbox" name="add" value="${book.isbn}">
                            </div>
                        </td>
                    </tr>
                </c:forEach>


                <tr>
                    <td width="10%">
                        <input type="submit" name="Details" value="Add to Cart">
                    </td>
                    <td width="37%">&nbsp;</td>
                    <td width="24%">&nbsp;</td>
                    <td width="13%">&nbsp;</td>
                    <td width="10%">&nbsp;</td>
                    <td width="6%">&nbsp;</td>
                </tr>
            </table>
        </form>

        <p><a href="./books?action=view_cart">View Shopping Cart</a></p>
    </body>
</html>
