<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Viridi - Login</title>

    <%@include file="components/common_css_js.jsp" %>

    <style>
        /* Custom Styling */
        .card {
            border-radius: 10px;
            box-shadow: 0px 5px 20px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: #28a745;
            color: white;
            text-align: center;
            font-size: 1.25rem;
            padding: 15px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }

        .form-group label {
            font-size: 1rem;
            color: #333;
        }

        .form-control {
            border-radius: 8px;
            padding: 12px 15px;
            font-size: 1rem;
            margin-bottom: 20px;
        }

        .btn-primary {
            border-radius: 8px;
            padding: 12px 20px;
            font-size: 1rem;
        }

        .btn-primary:hover {
            background-color: #218838;
        }

        .text-muted {
            font-size: 0.85rem;
            color: #777;
        }

        .text-center {
            text-align: center;
        }

        .link-text {
            font-size: 0.9rem;
            color: #007bff;
        }

        .link-text:hover {
            text-decoration: underline;
        }

        @media (max-width: 576px) {
            .card {
                margin: 15px;
            }

            .form-control, .btn-primary {
                font-size: 0.9rem;
            }

            .card-header {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>

    <%@include file="components/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-6 offset-md-3">

                <div class="card mt-3">

                    <div class="card-header">
                        <h3>Login Here</h3>
                    </div>

                    <div class="card-body">
                        <%@include file="components/message.jsp" %>

                        <form action="LoginServlet" method="post">
                            <!-- Phone Input -->
                            <div class="form-group">
                                <label for="phone">Mobile Number</label>
                                <input name="phone" type="tel" class="form-control" id="phone" placeholder="Enter your mobile number" required>
                                <small id="phoneHelp" class="form-text text-muted">Welcome Back 😊</small>
                            </div>

                            <!-- Password Input -->
                            <div class="form-group">
                                <label for="password">Password</label>
                                <input name="password" type="password" class="form-control" id="password" placeholder="Enter your password" required>
                            </div>

                            <!-- Registration Link -->
                            <a href="register.jsp" class="text-center d-block mb-2 link-text">If not registered, click here</a>

                            <!-- Buttons -->
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Submit</button>
                                <button type="reset" class="btn btn-outline-primary">Reset</button>
                            </div>
                        </form>

                    </div>

                </div>

            </div>
        </div>
    </div>

</body>
</html>
