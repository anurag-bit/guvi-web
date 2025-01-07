<%@page import="com.techno4.viridi.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.techno4.viridi.helper.FactoryProvider"%>
<%@page import="com.techno4.viridi.dao.CategoryDao"%>
<%@page import="com.techno4.viridi.dao.UserDao"%>
<%@page import="com.techno4.viridi.dao.ProductDao"%>
<%@page import="com.techno4.viridi.entities.User"%>
<%
    // Session check for user authentication
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login first");
        response.sendRedirect("login.jsp");
        return;
    } else if (!user.getUserType().equals("admin")) {
        session.setAttribute("message", "You are not admin ! Do not access this page");
        response.sendRedirect("login.jsp");
        return;
    }

    // Initialize DAO objects
    UserDao userDao = new UserDao(FactoryProvider.getFactory());
    CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
    ProductDao productDao = new ProductDao(FactoryProvider.getFactory());

    // Fetch counts
    long userCount = userDao.getUserCount();
    long categoryCount = categoryDao.getCategoryCount();
    long productCount = productDao.getProductCount();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Dashboard</title>
    <%@include file="components/common_css_js.jsp" %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        .dashboard-card {
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }
        .dashboard-card:hover {
            transform: translateY(-5px);
        }
        .stat-card {
            background: white;
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 1rem;
        }
        .action-card {
            cursor: pointer;
            padding: 1.5rem;
            background: white;
            border-radius: 8px;
            transition: background-color 0.2s;
        }
        .action-card:hover {
            background: #f8f9fa;
        }
    </style>
</head>
<body class="bg-light">
    <%@include file="components/navbar.jsp" %>
    
    <div class="container py-5">
        <div class="row mb-4">
            <div class="col-12">
                <h2 class="display-4">Dashboard</h2>
                <p class="text-muted">Welcome to your admin panel</p>
            </div>
        </div>

        <!-- Stats Row -->
        <div class="row mb-4">
            <!-- Users Card -->
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h3 class="h2 mb-0"><%= userCount %></h3>
                            <p class="text-muted mb-0">Users</p>
                        </div>
                        <i class="fas fa-users fa-2x text-primary"></i>
                    </div>
                </div>
            </div>

            <!-- Categories Card -->
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h3 class="h2 mb-0"><%= categoryCount %></h3>
                            <p class="text-muted mb-0">Categories</p>
                        </div>
                        <i class="fas fa-th-list fa-2x text-success"></i>
                    </div>
                </div>
            </div>

            <!-- Products Card -->
            <div class="col-md-4">
                <div class="stat-card">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h3 class="h2 mb-0"><%= productCount %></h3>
                            <p class="text-muted mb-0">Products</p>
                        </div>
                        <i class="fas fa-box fa-2x text-warning"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Action Cards -->
        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="action-card" data-toggle="modal" data-target="#add-category-modal">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="mb-0">Add Category</h4>
                        <i class="fas fa-folder-plus text-primary"></i>
                    </div>
                    <p class="text-muted mb-0">Create new product categories</p>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="action-card" data-toggle="modal" data-target="#add-product-modal">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="mb-0">Add Product</h4>
                        <i class="fas fa-plus-square text-success"></i>
                    </div>
                    <p class="text-muted mb-0">Add new products to inventory</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Category Modal -->
    <div class="modal fade" id="add-category-modal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Add New Category</h5>
                    <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post">
                        <input type="hidden" name="operation" value="addcategory">
                        <div class="form-group">
                            <input type="text" class="form-control" name="catTitle" placeholder="Category Title" required>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="catDescription" rows="5" placeholder="Category Description" required></textarea>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary ml-2">Add Category</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Product Modal -->
    <div class="modal fade" id="add-product-modal" tabindex="-1">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title">Add New Product</h5>
                    <button type="button" class="close text-white" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                        <input type="hidden" name="operation" value="addproduct">
                        <div class="form-group">
                            <input type="text" class="form-control" name="pName" placeholder="Product Title" required>
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" name="pDesc" rows="3" placeholder="Product Description"></textarea>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="number" class="form-control" name="pPrice" placeholder="Price" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input type="number" class="form-control" name="pDiscount" placeholder="Discount %" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="number" class="form-control" name="pQuantity" placeholder="Quantity" required>
                        </div>
                        <div class="form-group">
                            <select name="catId" class="form-control">
                                <% 
                                    CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                                    List<Category> list = cdao.getCategories();
                                    for(Category c : list) {
                                %>
                                <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Product Image</label>
                            <input type="file" class="form-control-file" name="pPic" required>
                        </div>
                        <div class="text-right">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success ml-2">Add Product</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@include file="components/common_modals.jsp" %>
</body>
</html>
