<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Management System - View All Products</title>
    
    <!-- Bootstrap CSS for better responsiveness -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome for icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #3498db;
            --accent-color: #e74c3c;
            --success-color: #27ae60;
            --warning-color: #f39c12;
            --light-bg: #f8f9fa;
            --border-color: #dee2e6;
        }

        body {
            background-color: var(--light-bg);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
        }

        .main-container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }

        .page-header {
            background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
            color: white;
            padding: 2rem 0;
            margin-bottom: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .page-title {
            font-size: 2.5rem;
            font-weight: 300;
            margin: 0;
            text-align: center;
        }

        .search-container {
            background: white;
            padding: 1.5rem;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
        }

        .search-input {
            border: 2px solid var(--border-color);
            border-radius: 25px;
            padding: 12px 20px;
            font-size: 16px;
            transition: all 0.3s ease;
            width: 100%;
        }

        .search-input:focus {
            border-color: var(--secondary-color);
            box-shadow: 0 0 0 0.2rem rgba(52, 152, 219, 0.25);
            outline: none;
        }

        .table-container {
            background: white;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .products-table {
            margin: 0;
            font-size: 14px;
        }

        .products-table thead th {
            background: var(--primary-color);
            color: white;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 1rem 0.75rem;
            border: none;
            position: sticky;
            top: 0;
            z-index: 10;
        }

        .products-table tbody tr {
            transition: all 0.3s ease;
        }

        .products-table tbody tr:nth-child(even) {
            background-color: #f8f9fa;
        }

        .products-table tbody tr:hover {
            background-color: #e3f2fd;
            transform: translateY(-1px);
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }

        .products-table td {
            padding: 1rem 0.75rem;
            vertical-align: middle;
            border-bottom: 1px solid var(--border-color);
        }

        .product-image {
            width: 60px;
            height: 60px;
            object-fit: cover;
            border-radius: 8px;
            border: 2px solid var(--border-color);
            transition: transform 0.3s ease;
        }

        .product-image:hover {
            transform: scale(3);
            z-index: 1000;
            position: relative;
            box-shadow: 0 8px 25px rgba(0,0,0,0.3);
        }

        .btn-link-custom {
            background: linear-gradient(45deg, var(--secondary-color), var(--success-color));
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            text-decoration: none;
            font-size: 0.875rem;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-block;
        }

        .btn-link-custom:hover {
            background: linear-gradient(45deg, var(--success-color), var(--secondary-color));
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(0,0,0,0.2);
            text-decoration: none;
        }

        .cost-badge {
            background: var(--success-color);
            color: white;
            padding: 0.4rem 0.8rem;
            border-radius: 15px;
            font-weight: 600;
            font-size: 0.9rem;
        }

        .category-badge {
            background: var(--warning-color);
            color: white;
            padding: 0.3rem 0.6rem;
            border-radius: 12px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        .no-results {
            text-align: center;
            padding: 3rem;
            color: #6c757d;
            font-style: italic;
        }

        .stats-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
            padding: 0 1rem;
        }

        .product-count {
            color: var(--primary-color);
            font-weight: 600;
        }

        .description-text {
            max-width: 200px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .id-badge {
            background: var(--primary-color);
            color: white;
            padding: 0.3rem 0.6rem;
            border-radius: 50%;
            font-weight: bold;
            font-size: 0.8rem;
        }

        @media (max-width: 768px) {
            .products-table {
                font-size: 12px;
            }
            
            .products-table th,
            .products-table td {
                padding: 0.5rem 0.3rem;
            }
            
            .page-title {
                font-size: 1.8rem;
            }
            
            .description-text {
                max-width: 100px;
            }
        }

        .fade-in {
            animation: fadeIn 0.5s ease-in;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>

<body>
    <%@ include file="productnavbar.jsp" %>
    
    <div class="main-container">
        <!-- Page Header -->
        <div class="page-header fade-in">
            <h1 class="page-title">
                <i class="fas fa-box-open me-3"></i>
                Product Management System
            </h1>
        </div>

        <!-- Search Section -->
        <div class="search-container fade-in">
            <div class="row align-items-center">
                <div class="col-md-8">
                    <div class="input-group">
                        <span class="input-group-text bg-transparent border-end-0">
                            <i class="fas fa-search text-muted"></i>
                        </span>
                        <input type="text" 
                               id="searchInput" 
                               class="form-control search-input border-start-0" 
                               placeholder="Search by product name, category, or description..."
                               onkeyup="filterProducts()">
                    </div>
                </div>
                <div class="col-md-4 text-end">
                    <div class="product-count">
                        Total Products: <span id="productCount" class="badge bg-primary">${productlist.size()}</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Products Table -->
        <div class="table-container fade-in">
            <div class="stats-container">
                <h5 class="mb-0">
                    <i class="fas fa-list me-2"></i>
                    Product Catalog
                </h5>
                <small class="text-muted">Showing <span id="visibleCount">${productlist.size()}</span> products</small>
            </div>
            
            <div class="table-responsive">
                <table class="table products-table" id="productsTable">
                    <thead>
                        <tr>
                            <th><i class="fas fa-hashtag me-1"></i>ID</th>
                            <th><i class="fas fa-tags me-1"></i>Category</th>
                            <th><i class="fas fa-cube me-1"></i>Product Name</th>
                            <th><i class="fas fa-align-left me-1"></i>Description</th>
                            <th><i class="fas fa-dollar-sign me-1"></i>Price</th>
                            <th><i class="fas fa-external-link-alt me-1"></i>Link</th>
                            <th><i class="fas fa-image me-1"></i>Image</th>
                        </tr>
                    </thead>
                    <tbody id="tableBody">
                        <c:forEach items="${productlist}" var="product">
                            <tr class="product-row">
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
                                    <strong><c:out value="${product.name}"/></strong>
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
                                        <i class="fas fa-external-link-alt me-1"></i>
                                        View Details
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
                    <i class="fas fa-search fa-3x text-muted mb-3"></i>
                    <h5>No products found</h5>
                    <p>Try adjusting your search criteria</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
    
    <script>
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

        // Add smooth scrolling and loading animation
        document.addEventListener('DOMContentLoaded', function() {
            // Add fade-in animation to table rows
            const rows = document.querySelectorAll('.product-row');
            rows.forEach((row, index) => {
                row.style.opacity = '0';
                row.style.transform = 'translateY(20px)';
                setTimeout(() => {
                    row.style.transition = 'all 0.5s ease';
                    row.style.opacity = '1';
                    row.style.transform = 'translateY(0)';
                }, index * 50);
            });
        });

        // Clear search functionality
        document.getElementById('searchInput').addEventListener('input', function() {
            if (this.value === '') {
                filterProducts();
            }
        });
    </script>
</body>
</html>