<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Confirmation</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container text-center">
            <h2 class="mt-5">Order Placed Successfully!</h2>
            <p>Your order has been successfully placed with Cash on Delivery as your payment method.</p>
            <p>Thank you for shopping with us!</p>
            <a href="index.jsp" class="btn btn-primary">Go to Home</a>
        </div>

        <%@include file="components/common_modals.jsp" %>
    </body>
</html>
