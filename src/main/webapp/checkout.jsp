<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first to access checkout page");
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row mt-5">

                <div class="col-md-6">
                    <!-- Card for selected items -->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your selected items</h3>
                            <div class="cart-body">
                                <!-- Cart Items will be listed here -->
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <!-- Card for form details -->
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-5">Your details for order</h3>
                            <form id="checkoutForm">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="name">Your name</label>
                                    <input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" placeholder="Enter name">
                                </div>

                                <div class="form-group">
                                    <label for="contact">Your contact</label>
                                    <input value="<%= user.getUserPhone() %>" type="text" class="form-control" id="contact" placeholder="Enter contact number">
                                </div>

                                <div class="form-group">
                                    <label for="address">Your shipping address</label>
                                    <textarea class="form-control" id="address" placeholder="Enter your address" rows="3"><%= user.getUserAddress() %></textarea>
                                </div>

                                <div class="container text-center">
                                    <!-- Trigger the modal with the "Order Now" button -->
                                    <button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#confirmOrderModal">Order Now</button>
                                    <button type="button" class="btn btn-outline-primary">Continue Shopping</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <!-- Modal for Cash on Delivery Confirmation -->
        <div class="modal fade" id="confirmOrderModal" tabindex="-1" role="dialog" aria-labelledby="confirmOrderModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="confirmOrderModalLabel">Confirm Your Order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to place the order with Cash on Delivery as your payment method?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="placeOrder()">Confirm Order</button>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="components/common_modals.jsp" %>

        <!-- JavaScript to handle the order confirmation and success -->
        <script>
            function placeOrder() {
                // Here, you can perform additional actions like sending data to the server

                // Show a success message
                alert("Order placed successfully with Cash on Delivery.");

                // Optionally, you can redirect to a confirmation page or keep the user on the same page
                window.location.href = "OrderConfirmation.jsp"; // or stay on the checkout page
            }
        </script>
    </body>
</html>
