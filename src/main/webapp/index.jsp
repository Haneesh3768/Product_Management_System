<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Product Management - Spring Boot</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background-color: #f8fafc;
            line-height: 1.6;
            color: #334155;
        }

        .main-container {
            max-width: 900px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 48px;
        }

        .page-title {
            font-size: 2.25rem;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 12px;
            letter-spacing: -0.025em;
        }

        .page-subtitle {
            font-size: 1.125rem;
            color: #64748b;
            font-weight: 400;
        }

        .menu-container {
            background: white;
            border-radius: 16px;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
            border: 1px solid #e2e8f0;
            overflow: hidden;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 24px 32px;
            text-decoration: none;
            color: inherit;
            border-bottom: 1px solid #f1f5f9;
            transition: all 0.2s ease;
            position: relative;
        }

        .menu-item:last-child {
            border-bottom: none;
        }

        .menu-item:hover {
            background-color: #f8fafc;
            transform: translateX(4px);
        }

        .menu-number {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            background-color: #e2e8f0;
            color: #475569;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 600;
            font-size: 0.875rem;
            margin-right: 20px;
            transition: all 0.2s ease;
        }

        .menu-item:hover .menu-number {
            background-color: #3b82f6;
            color: white;
        }

        .menu-content {
            flex: 1;
        }

        .menu-title {
            font-size: 1.125rem;
            font-weight: 500;
            color: #1e293b;
            margin-bottom: 4px;
        }

        .menu-description {
            font-size: 0.9375rem;
            color: #64748b;
        }

        .menu-arrow {
            color: #cbd5e1;
            font-size: 1rem;
            transition: all 0.2s ease;
        }

        .menu-item:hover .menu-arrow {
            color: #3b82f6;
            transform: translateX(4px);
        }

        .divider {
            height: 1px;
            background: linear-gradient(to right, transparent, #e2e8f0, transparent);
            margin: 32px 0;
        }

        @media (max-width: 768px) {
            .main-container {
                padding: 24px 16px;
            }
            
            .page-title {
                font-size: 1.875rem;
            }
            
            .menu-item {
                padding: 20px 24px;
            }
            
            .menu-number {
                width: 28px;
                height: 28px;
                margin-right: 16px;
            }
        }

        /* Subtle entrance animation */
        .menu-container {
            animation: fadeInUp 0.6s ease-out;
        }

        .page-header {
            animation: fadeInUp 0.6s ease-out 0.1s both;
        }

        @keyframes fadeInUp {
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
    <%@ include file="productnavbar.jsp" %>

    <div class="main-container">
        <div class="page-header">
            <h1 class="page-title">Product Management</h1>
            <p class="page-subtitle">Manage your product inventory with ease</p>
        </div>

        <div class="menu-container">
            <a href="#" class="menu-item">
                <div class="menu-number">1</div>
                <div class="menu-content">
                    <div class="menu-title">Add Product with Image</div>
                    <div class="menu-description">Create new products and upload images</div>
                </div>
                <i class="fas fa-chevron-right menu-arrow"></i>
            </a>

            <a href="#" class="menu-item">
                <div class="menu-number">2</div>
                <div class="menu-content">
                    <div class="menu-title">View All Products</div>
                    <div class="menu-description">Browse your complete product catalog</div>
                </div>
                <i class="fas fa-chevron-right menu-arrow"></i>
            </a>

            <a href="#" class="menu-item">
                <div class="menu-number">3</div>
                <div class="menu-content">
                    <div class="menu-title">View Product By ID</div>
                    <div class="menu-description">Search products using database IDs</div>
                </div>
                <i class="fas fa-chevron-right menu-arrow"></i>
            </a>

            <a href="#" class="menu-item">
                <div class="menu-number">4</div>
                <div class="menu-content">
                    <div class="menu-title">View Product By Category</div>
                    <div class="menu-description">Filter products by category</div>
                </div>
                <i class="fas fa-chevron-right menu-arrow"></i>
            </a>
        </div>
    </div>

    <script>
        // Simple hover enhancement
        document.querySelectorAll('.menu-item').forEach(item => {
            item.addEventListener('click', function(e) {
                e.preventDefault();
                // Add your navigation logic here
                console.log('Navigating to:', this.querySelector('.menu-title').textContent);
            });
        });
    </script>
</body>

</html>