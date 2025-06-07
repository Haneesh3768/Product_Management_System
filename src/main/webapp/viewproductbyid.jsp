<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Product Selection - Product Management System</title>
    
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
            min-height: 100vh;
        }

        /* Main Content Container */
        .main-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 6rem 2rem 4rem;
            min-height: 100vh;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
        }

        .page-header {
            text-align: center;
            margin-bottom: 4rem;
        }

        .page-title {
            font-size: 3.2rem;
            font-weight: 800;
            background: linear-gradient(135deg, #ffffff, #cccccc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1rem;
            line-height: 1.2;
        }

        .page-subtitle {
            font-size: 1.2rem;
            color: rgba(255, 255, 255, 0.7);
            font-weight: 400;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Form Styling */
        .form-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border-radius: 24px;
            padding: 3rem;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            max-width: 600px;
            margin: 0 auto;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .form-container:hover {
            border-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4);
        }

        .form-group {
            margin-bottom: 2.5rem;
        }

        .form-label {
            display: block;
            margin-bottom: 1rem;
            font-weight: 600;
            color: #ffffff;
            font-size: 1.1rem;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-label i {
            color: #ff6b6b;
            font-size: 1.2rem;
        }

        .form-select {
            width: 100%;
            padding: 1.2rem 1.5rem;
            font-size: 1rem;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
            background: rgba(255, 255, 255, 0.03);
            color: #ffffff;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            appearance: none;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%23ffffff' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m6 8 4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 1.2rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em;
            padding-right: 3.5rem;
            position: relative;
        }

        .form-select:focus {
            outline: none;
            border-color: rgba(255, 107, 107, 0.5);
            box-shadow: 0 0 0 4px rgba(255, 107, 107, 0.1);
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 0.08);
        }

        .form-select:hover {
            border-color: rgba(255, 255, 255, 0.3);
            background: rgba(255, 255, 255, 0.05);
            transform: translateY(-1px);
        }

        .form-select option {
            background: #1a1a1a;
            color: #ffffff;
            padding: 10px;
            border: none;
        }

        .form-select option:hover {
            background: rgba(255, 107, 107, 0.1);
        }

        .submit-btn {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 16px 40px;
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            color: white;
            border: none;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            box-shadow: 0 8px 30px rgba(255, 107, 107, 0.3);
            text-transform: none;
            letter-spacing: 0.5px;
            position: relative;
            overflow: hidden;
        }

        .submit-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s;
        }

        .submit-btn:hover::before {
            left: 100%;
        }

        .submit-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(255, 107, 107, 0.4);
        }

        .submit-btn:active {
            transform: translateY(-1px);
        }

        .submit-btn i {
            font-size: 1.1rem;
        }

        .form-actions {
            text-align: center;
            margin-bottom: 0;
        }

        /* Loading Animation */
        .loading {
            opacity: 0.8;
            pointer-events: none;
        }

        .loading .submit-btn {
            background: linear-gradient(135deg, #666, #888);
        }

        .loading .submit-btn .btn-text {
            opacity: 0.7;
        }

        .loading .submit-btn .loading-spinner {
            display: inline-block;
            width: 18px;
            height: 18px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Enhanced Visual Effects */
        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255, 107, 107, 0.5), transparent);
            opacity: 0;
            transition: opacity 0.3s ease;
        }

        .form-container:hover::before {
            opacity: 1;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-container {
                padding: 4rem 1rem 3rem;
            }

            .page-title {
                font-size: 2.5rem;
            }

            .page-subtitle {
                font-size: 1.1rem;
            }

            .form-container {
                padding: 2rem;
                border-radius: 20px;
                margin: 0 1rem;
            }

            .submit-btn {
                width: 100%;
                padding: 18px;
                justify-content: center;
            }

            .form-select {
                padding: 1rem 1.2rem;
                padding-right: 3rem;
            }
        }

        /* Floating animation for icons */
        .form-label i {
            animation: float 3s ease-in-out infinite;
            animation-delay: 0.5s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-3px); }
        }

        /* Smooth entrance animations */
        .page-header {
            animation: fadeInUp 0.8s ease-out;
        }

        .form-container {
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>

<body>
    <!-- Keep Original Navigation -->
    <%@ include file="productnavbar.jsp" %>

    <!-- Main Content -->
    <div class="main-container">
        <div class="page-header">
            <h1 class="page-title">Product Selection</h1>
            <p class="page-subtitle">Choose a product to view detailed information and specifications</p>
        </div>

        <form method="post" action="displayproduct" class="form-container" id="productForm">
            <div class="form-group">
                <label for="productSelect" class="form-label">
                    <i class="fas fa-cube"></i>
                    Select Product
                </label>
                <select name="pid" id="productSelect" class="form-select" required>
                    <option value="">Choose a product...</option>
                    <c:forEach items="${productlist}" var="product">
                        <option value="${product.id}">${product.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-actions">
                <button type="submit" class="submit-btn">
                    <i class="fas fa-search"></i>
                    <span class="btn-text">View Product Details</span>
                    <span class="loading-spinner" style="display: none;"></span>
                </button>
            </div>
        </form>
    </div>

    <script>
        // Add loading state to form submission
        document.getElementById('productForm').addEventListener('submit', function() {
            this.classList.add('loading');
            const btn = document.querySelector('.submit-btn');
            const btnText = btn.querySelector('.btn-text');
            const spinner = btn.querySelector('.loading-spinner');
            
            btnText.textContent = 'Loading...';
            spinner.style.display = 'inline-block';
            
            // Remove the search icon temporarily
            const icon = btn.querySelector('.fas');
            icon.style.display = 'none';
        });

        // Add smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth'
                    });
                }
            });
        });

        // Enhanced select interaction
        const selectElement = document.getElementById('productSelect');
        selectElement.addEventListener('change', function() {
            if (this.value) {
                this.style.color = '#ffffff';
            }
        });

        // Add subtle hover effects
        document.querySelector('.form-container').addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-2px)';
        });

        document.querySelector('.form-container').addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    </script>
</body>

</html>