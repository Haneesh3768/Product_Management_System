<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Management System - View All Products</title>
    
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #0a0a0a;
            color: #ffffff;
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* Header Styles - Same as navbar */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background: rgba(0, 0, 0, 0.95);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .header.scrolled {
            background: rgba(0, 0, 0, 0.98);
            box-shadow: 0 4px 30px rgba(0, 0, 0, 0.3);
        }

        .nav-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 80px;
        }

        /* Brand Logo */
        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.5rem;
            font-weight: 700;
            color: #ffffff;
            text-decoration: none;
            transition: transform 0.3s ease;
        }

        .brand:hover {
            transform: scale(1.05);
        }

        .brand-icon {
            width: 45px;
            height: 45px;
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
            color: white;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
        }

        .brand-text {
            background: linear-gradient(135deg, #ffffff, #cccccc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        /* Navigation Menu */
        .nav-menu {
            display: flex;
            list-style: none;
            gap: 0;
            margin: 0;
            padding: 0;
        }

        .nav-item {
            position: relative;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 12px 24px;
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.95rem;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            position: relative;
            border-radius: 8px;
            margin: 0 4px;
        }

        .nav-link::before {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 50%;
            width: 0;
            height: 2px;
            background: linear-gradient(90deg, #ff6b6b, #4ecdc4);
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            transform: translateX(-50%);
            border-radius: 1px;
        }

        .nav-link:hover {
            color: #ffffff;
            background: rgba(255, 255, 255, 0.05);
            transform: translateY(-2px);
        }

        .nav-link:hover::before {
            width: 80%;
        }

        .nav-link.active {
            color: #ffffff;
            background: rgba(255, 255, 255, 0.1);
        }

        .nav-link.active::before {
            width: 80%;
        }

        .nav-icon {
            font-size: 1rem;
            opacity: 0.9;
        }

        /* Mobile Menu */
        .mobile-toggle {
            display: none;
            flex-direction: column;
            gap: 4px;
            background: none;
            border: none;
            cursor: pointer;
            padding: 8px;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .mobile-toggle:hover {
            background: rgba(255, 255, 255, 0.1);
        }

        .mobile-toggle span {
            width: 25px;
            height: 2px;
            background: #ffffff;
            transition: all 0.3s ease;
            border-radius: 1px;
        }

        .mobile-toggle.active span:nth-child(1) {
            transform: rotate(45deg) translate(5px, 5px);
        }

        .mobile-toggle.active span:nth-child(2) {
            opacity: 0;
        }

        .mobile-toggle.active span:nth-child(3) {
            transform: rotate(-45deg) translate(7px, -6px);
        }

        /* Main Content */
        .main-container {
            margin-top: 80px;
            max-width: 1400px;
            margin-left: auto;
            margin-right: auto;
            padding: 40px 2rem;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
            min-height: calc(100vh - 80px);
        }

        .page-header {
            text-align: center;
            margin-bottom: 3rem;
            padding: 2rem 0;
        }

        .page-title {
            font-size: 3rem;
            font-weight: 800;
            background: linear-gradient(135deg, #ffffff, #cccccc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 0.5rem;
            line-height: 1.2;
        }

        .page-subtitle {
            font-size: 1.2rem;
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 2rem;
        }

        /* Search Container */
        .search-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            padding: 2rem;
            margin-bottom: 2rem;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        .search-wrapper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 2rem;
            flex-wrap: wrap;
        }

        .search-input-group {
            flex: 1;
            min-width: 300px;
            position: relative;
        }

        .search-input {
            width: 100%;
            padding: 16px 50px 16px 20px;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 50px;
            color: #ffffff;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .search-input:focus {
            outline: none;
            border-color: #4ecdc4;
            background: rgba(255, 255, 255, 0.15);
            box-shadow: 0 0 0 0.2rem rgba(78, 205, 196, 0.25);
        }

        .search-input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .search-icon {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            color: rgba(255, 255, 255, 0.6);
        }

        .product-count {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            padding: 12px 24px;
            border-radius: 25px;
            font-weight: 600;
            color: white;
            white-space: nowrap;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
        }

        /* Table Container */
        .table-container {
            background: rgba(255, 255, 255, 0.03);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
        }

        .table-header {
            padding: 1.5rem 2rem;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .table-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: #ffffff;
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .visible-count {
            color: rgba(255, 255, 255, 0.7);
            font-size: 0.9rem;
        }

        /* Products Table */
        .products-table {
            width: 100%;
            border-collapse: collapse;
            background: transparent;
        }

        .products-table thead th {
            background: rgba(255, 255, 255, 0.05);
            color: #ffffff;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 1.5rem 1rem;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
            position: sticky;
            top: 0;
            z-index: 10;
            font-size: 0.85rem;
        }

        .products-table tbody tr {
            transition: all 0.3s ease;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
        }

        .products-table tbody tr:hover {
            background: rgba(255, 255, 255, 0.05);
            transform: translateY(-2px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        .products-table td {
            padding: 1.5rem 1rem;
            vertical-align: middle;
            color: rgba(255, 255, 255, 0.9);
        }

        /* Product Image */
        .product-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 12px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            cursor: pointer;
        }

        .product-image:hover {
            transform: scale(2.5);
            z-index: 1000;
            position: relative;
            box-shadow: 0 8px 40px rgba(0, 0, 0, 0.6);
            border-color: #4ecdc4;
        }

        /* Badges and Links */
        .id-badge {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            color: white;
            padding: 0.5rem 0.8rem;
            border-radius: 50px;
            font-weight: bold;
            font-size: 0.85rem;
            box-shadow: 0 2px 10px rgba(255, 107, 107, 0.3);
        }

        .category-badge {
            background: rgba(255, 255, 255, 0.1);
            color: #4ecdc4;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
            border: 1px solid rgba(78, 205, 196, 0.3);
        }

        .cost-badge {
            background: linear-gradient(135deg, #27ae60, #2ecc71);
            color: white;
            padding: 0.6rem 1.2rem;
            border-radius: 25px;
            font-weight: 600;
            font-size: 1rem;
            box-shadow: 0 4px 15px rgba(39, 174, 96, 0.3);
        }

        .btn-link-custom {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            color: white;
            padding: 0.8rem 1.5rem;
            border-radius: 25px;
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 600;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
        }

        .btn-link-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.4);
            color: white;
            text-decoration: none;
        }

        .description-text {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            color: rgba(255, 255, 255, 0.8);
        }

        /* No Results */
        .no-results {
            text-align: center;
            padding: 4rem 2rem;
            color: rgba(255, 255, 255, 0.6);
        }

        .no-results i {
            color: rgba(255, 255, 255, 0.3);
            margin-bottom: 1rem;
        }

        .no-results h5 {
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 0.5rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .mobile-toggle {
                display: flex;
            }

            .nav-container {
                padding: 0 1rem;
                height: 70px;
            }

            .nav-menu {
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: rgba(0, 0, 0, 0.98);
                backdrop-filter: blur(20px);
                flex-direction: column;
                gap: 0;
                opacity: 0;
                visibility: hidden;
                transform: translateY(-20px);
                transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.3);
            }

            .nav-menu.active {
                opacity: 1;
                visibility: visible;
                transform: translateY(0);
            }

            .nav-item {
                width: 100%;
            }

            .nav-link {
                padding: 20px 2rem;
                margin: 0;
                border-radius: 0;
                border-bottom: 1px solid rgba(255, 255, 255, 0.05);
                justify-content: flex-start;
            }

            .nav-link::before {
                display: none;
            }

            .nav-link:hover {
                background: rgba(255, 255, 255, 0.08);
                transform: none;
                padding-left: 2.5rem;
            }

            .main-container {
                margin-top: 70px;
                padding: 20px 1rem;
            }

            .page-title {
                font-size: 2rem;
            }

            .search-wrapper {
                flex-direction: column;
                gap: 1rem;
            }

            .search-input-group {
                min-width: auto;
            }

            .products-table {
                font-size: 12px;
            }
            
            .products-table th,
            .products-table td {
                padding: 0.8rem 0.5rem;
            }
            
            .description-text {
                max-width: 100px;
            }

            .table-responsive {
                overflow-x: auto;
            }
        }

        /* Animations */
        .fade-in {
            animation: fadeIn 0.8s ease-out;
        }

        @keyframes fadeIn {
            from { 
                opacity: 0; 
                transform: translateY(30px); 
            }
            to { 
                opacity: 1; 
                transform: translateY(0); 
            }
        }

        .product-row {
            animation: slideInUp 0.6s ease-out;
            animation-fill-mode: both;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>
    <!-- Navigation Bar -->
    <header class="header" id="header">
        <div class="nav-container">
            <a href="/" class="brand">
                <div class="brand-icon">
                    <i class="fas fa-cube"></i>
                </div>
                <span class="brand-text">Product Management</span>
            </a>

            <nav class="nav">
                <ul class="nav-menu" id="navMenu">
                    <li class="nav-item">
                        <a href="/" class="nav-link">
                            <i class="fas fa-home nav-icon"></i>
                            Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="addproduct" class="nav-link">
                            <i class="fas fa-plus-circle nav-icon"></i>
                            Add Product
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="viewallprods" class="nav-link active">
                            <i class="fas fa-list nav-icon"></i>
                            View All
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="viewproductbyid" class="nav-link">
                            <i class="fas fa-search nav-icon"></i>
                            View By ID
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="viewproductsbycategory" class="nav-link">
                            <i class="fas fa-tags nav-icon"></i>
                            Categories
                        </a>
                    </li>
                </ul>
            </nav>

            <button class="mobile-toggle" id="mobileToggle">
                <span></span>
                <span></span>
                <span></span>
            </button>
        </div>
    </header>
    
    <div class="main-container">
        <!-- Page Header -->
        <div class="page-header fade-in">
            <h1 class="page-title">
                <i class="fas fa-box-open" style="margin-right: 1rem; color: #4ecdc4;"></i>
                Product Catalog
            </h1>
            <p class="page-subtitle">
                Manage and explore your complete product inventory
            </p>
        </div>

        <!-- Search Section -->
        <div class="search-container fade-in">
            <div class="search-wrapper">
                <div class="search-input-group">
                    <input type="text" 
                           id="searchInput" 
                           class="search-input" 
                           placeholder="Search by product name, category, or description..."
                           onkeyup="filterProducts()">
                    <i class="fas fa-search search-icon"></i>
                </div>
                <div class="product-count">
                    <i class="fas fa-cube" style="margin-right: 8px;"></i>
                    Total: <span id="productCount">${productlist.size()}</span> Products
                </div>
            </div>
        </div>

        <!-- Products Table -->
        <div class="table-container fade-in">
            <div class="table-header">
                <h3 class="table-title">
                    <i class="fas fa-list"></i>
                    Product Inventory
                </h3>
                <div class="visible-count">
                    Showing <span id="visibleCount">${productlist.size()}</span> products
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="products-table" id="productsTable">
                    <thead>
                        <tr>
                            <th><i class="fas fa-hashtag" style="margin-right: 8px;"></i>ID</th>
                            <th><i class="fas fa-tags" style="margin-right: 8px;"></i>Category</th>
                            <th><i class="fas fa-cube" style="margin-right: 8px;"></i>Product Name</th>
                            <th><i class="fas fa-align-left" style="margin-right: 8px;"></i>Description</th>
                            <th><i class="fas fa-dollar-sign" style="margin-right: 8px;"></i>Price</th>
                            <th><i class="fas fa-external-link-alt" style="margin-right: 8px;"></i>Details</th>
                            <th><i class="fas fa-image" style="margin-right: 8px;"></i>Image</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <c:forEach items="${productlist}" var="product" varStatus="status">
                            <tr class="product-row" style="animation-delay: ${status.index * 0.05}s;">
                                <td>
                                    <span class="id-badge">
                                        <c:out value="${product.id}"/>
                                    </span>
                                </td>
                                <td>
                                    <span class="category-badge">
                                        <c:out value="${product.category}"/>
                                    </span>
                                </td>
                                <td>
                                    <strong style="color: #ffffff;"><c:out value="${product.name}"/></strong>
                                </td>
                                <td>
                                    <div class="description-text" title="<c:out value='${product.description}'/>">
                                        <c:out value="${product.description}"/>
                                    </div>
                                </td>
                                <td>
                                    <span class="cost-badge">
                                        $<c:out value="${product.cost}"/>
                                    </span>
                                </td>
                                <td>
                                    <a href='<c:url value="${product.url}"/>' 
                                       target="_blank" 
                                       class="btn-link-custom">
                                        <i class="fas fa-external-link-alt"></i>
                                        View
                                    </a>
                                </td>
                                <td>
                                    <img src='displayprodimage?id=${product.id}' 
                                         class="product-image" 
                                         alt="<c:out value='${product.name}'/>"
                                         onerror="this.src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNjAiIGhlaWdodD0iNjAiIHZpZXdCb3g9IjAgMCA2MCA2MCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPHJlY3Qgd2lkdGg9IjYwIiBoZWlnaHQ9IjYwIiBmaWxsPSIjRjNGNEY2Ii8+CjxwYXRoIGQ9Ik0yMCAyMEg0MFY0MEgyMFYyMFoiIGZpbGw9IiNEMUQ1REIiLz4KPC9zdmc+'">
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                <!-- No Results Message -->
                <div id="noResults" class="no-results" style="display: none;">
                    <i class="fas fa-search fa-3x"></i>
                    <h5>No products found</h5>
                    <p>Try adjusting your search criteria</p>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        // Mobile menu toggle
        const mobileToggle = document.getElementById('mobileToggle');
        const navMenu = document.getElementById('navMenu');
        const header = document.getElementById('header');

        mobileToggle.addEventListener('click', function() {
            this.classList.toggle('active');
            navMenu.classList.toggle('active');
        });

        // Close mobile menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.nav') && !e.target.closest('.mobile-toggle')) {
                navMenu.classList.remove('active');
                mobileToggle.classList.remove('active');
            }
        });

        // Header scroll effect
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

        function filterProducts() {
            const input = document.getElementById("searchInput");
            const filter = input.value.toUpperCase();
            const table = document.getElementById("productsTable");
            const rows = table.getElementsByTagName("tr");
            let visibleCount = 0;
            
            // Skip header row (index 0)
            for (let i = 1; i < rows.length; i++) {
                const row = rows[i];
                const cells = row.getElementsByTagName("td");
                let found = false;
                
                // Search in name (index 2), category (index 1), and description (index 3)
                const searchFields = [1, 2, 3];
                
                for (let j of searchFields) {
                    if (cells[j]) {
                        const textValue = cells[j].textContent || cells[j].innerText;
                        if (textValue.toUpperCase().indexOf(filter) > -1) {
                            found = true;
                            break;
                        }
                    }
                }
                
                if (found) {
                    row.style.display = "";
                    visibleCount++;
                } else {
                    row.style.display = "none";
                }
            }
            
            // Update visible count
            document.getElementById("visibleCount").textContent = visibleCount;
            
            // Show/hide no results message
            const noResults = document.getElementById("noResults");
            const tableBody = document.getElementById("tableBody");
            
            if (visibleCount === 0 && filter !== "") {
                noResults.style.display = "block";
                tableBody.style.display = "none";
            } else {
                noResults.style.display = "none";
                tableBody.style.display = "";
            }
        }

        // Clear search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            if (this.value === '') {
                filterProducts();
            }
        });

        // Add stagger animation to table rows
        document.addEventListener('DOMContentLoaded', function() {
            const rows = document.querySelectorAll('.product-row');
            rows.forEach((row, index) => {
                row.style.animationDelay = `${index * 0.05}s`;
            });
        });
    </script>
</body>
</html>