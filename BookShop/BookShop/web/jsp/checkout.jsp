<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.text.DecimalFormat" %>
<html>

<head>
    <title>CheckOut</title>
</head>

<body>

    <h1 class="bigFont" align="center">
        <font face="Georgia, Times New Roman, Times, serif">Shopping Cart Check Out</font>
    </h1>

    <form method="post" action="jsp/thankyou.jsp">
        <input type="hidden" name="action" value="validate_credit">
        <p style="font-weight: bold">&nbsp; </p>
        <table width="100%" border="0" cellspacing="1" cellpadding="1">
            <tr>
                <td bgcolor="#CCCCCC">
                    <h3 align="left">You have selected to purchase the following Items</h3>
                </td>
            </tr>

            <!-- Use JSTL to iterate over cart items -->
            <c:set var="totalCostOfOrder" value="0.00" />
            <c:forEach var="entry" items="${sessionScope.cart}">
                <c:set var="item" value="${entry.value}" />
                <c:set var="cost" value="${item.orderCost}" />
                <c:set var="totalCostOfOrder" value="${totalCostOfOrder + cost}" />

                <tr>
                    <td bgcolor="#F0F0F0">
                        <c:out value="${item}" />
                    </td>
                </tr>
            </c:forEach>

            <!-- Display the total order cost -->
            <c:set var="dollarFormat" value="0.00" />
            <fmt:formatNumber value="${totalCostOfOrder}" var="totalOrderInDollars" type="currency" />

        </table>

        <p style="font-weight: bold">Please input the following information.</p>

        <!-- table of form elements -->
        <table>
            <tr>
                <td class="right bold">First name:</td>
                <td>
                    <input type="text" name="firstname" size="25" />
                </td>
            </tr>
            <tr>
                <td class="right bold">Last name:</td>
                <td>
                    <input type="text" name="lastname" size="25" />
                </td>
            </tr>
            <tr>
                <td class="right bold">Street:</td>
                <td>
                    <input type="text" name="street" size="25" />
                </td>
            </tr>
            <tr>
                <td class="right bold">City:</td>
                <td>
                    <input type="text" name="city" size="25" />
                </td>
            </tr>
            <tr>
                <td class="right bold">State:</td>
                <td>
                    <input type="text" name="state" size="2" />
                </td>
            </tr>
            <tr>
                <td class="right bold">Zip code:</td>
                <td>
                    <input type="text" name="zipcode" size="10" />
                </td>
            </tr>
            <tr>
                <td class="right bold">Phone #:</td>
                <td>
                    ( <input type="text" name="phone" size="3" /> )
                    <input type="text" name="phone2" size="3" /> -
                    <input type="text" name="phone3" size="4" />
                </td>
            </tr>
            <tr>
                <td class="right bold">Credit Card #:</td>
                <td>
                    <input type="text" name="card_num" size="25" />
                </td>
            </tr>
            <tr>
                <td class="right bold">Expiration (mm/yy):</td>
                <td>
                    <input type="text" name="expires" size="2" /> /
                    <input type="text" name="expires2" size="2" />
                </td>
            </tr>
            <tr>
                <td class="right bold">Order Amount $</td>
                <td>
                    <input type="text" name="amount" value="${totalOrderInDollars}" />
                </td>
            </tr>
        </table>

        <!-- enable user to submit the form -->
        <p><input type="submit" value="Submit" /></p>
    </form>
</body>

</html>
