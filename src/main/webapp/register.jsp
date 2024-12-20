<%-- 
    Document   : register
    Created on : 4 Dec 2024, 11:08:23 pm
    Author     : Nalinish Ranjan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Viridi - Registration</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="row mt-5">
            <div class="col-md-4 offset-md-4">
                <div class="card">
                    <div class="card-body px-5">
                        <h3>Sign Up Here !!</h3>

                        <form>
                            <div class="form-group">
                                <label for="name" class="form-label">User Name</label>
                                <input type="text" class="form-control" id="name" placeholder="Enter User Name">
                            </div>

                            <div class="form-group">
                                <label for="email" class="form-label">User Email</label>
                                <input type="email" class="form-control" id="email" placeholder="Enter Email">
                            </div>

                            <div class="form-group">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" placeholder="Enter Password">
                            </div>

                            <div class="form-group">
                                <label for="phone" class="form-label">Phone Number</label>
                                <input type="number" class="form-control" id="phone" placeholder="Enter Phone Number">
                            </div>

                            <div class="form-group">
                                <label for="address" class="form-label">User Address</label>
                                <textarea style="height: 100px;" class="form-control" placeholder="Enter your address"></textarea>
                            </div>

                            <div class="container text-center">
                                <button class="btn btn-outline-success">Register</button>
                                <button class="btn btn-outline-warning">Reset</button>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </body>
</html>
