<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Spring Boot Project</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
            background-color: #f8fafc;
            line-height: 1.6;
        }

        .header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 1000;
        }

        .header-content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        .brand-section {
            text-align: center;
            padding: 20px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .brand-title {
            color: white;
            font-size: 1.8rem;
            font-weight: 600;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .brand-icon {
            width: 32px;
            height: 32px;
            background: rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.2rem;
        }

        .navbar {
            padding: 0;
        }

        .navbar ul {
            list-style: none;
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 0;
        }

        .navbar li {
            position: relative;
        }

        .navbar a {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 16px 24px;
            color: rgba(255, 255, 255, 0.9);
            text-decoration: none;
            font-weight: 500;
            font-size: 0.95rem;
            transition: all 0.3s ease;
            position: relative;
            border-radius: 0;
        }

        .navbar a::before {
            content: '';
            position: absolute;
            bottom: 0;
            left: 50%;
            width: 0;
            height: 3px;
            background: white;
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }

        .navbar a:hover {
            color: white;
            background: rgba(255, 255, 255, 0.1);
        }

        .navbar a:hover::before {
            width: 80%;
        }

        .navbar a.active {
            color: white;
            background: rgba(255, 255, 255, 0.15);
        }

        .navbar a.active::before {
            width: 80%;
        }

        .nav-icon {
            font-size: 1rem;
            opacity: 0.8;
        }

        /* Responsive Design */
        .mobile-toggle {
            display: none;
            background: none;
            border: none;
            color: white;
            font-size: 1.5rem;
            cursor: pointer;
            padding: 15px;
            position: absolute;
            right: 20px;
            top: 20px;
        }

        @media (max-width: 768px) {
            .mobile-toggle {
                display: block;
            }

            .navbar {
                position: relative;
            }

            .navbar ul {
                flex-direction: column;
                position: absolute;
                top: 100%;
                left: 0;
                right: 0;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
                transform: translateY(-100%);
                opacity: 0;
                visibility: hidden;
                transition: all 0.3s ease;
            }

            .navbar ul.active {
                transform: translateY(0);
                opacity: 1;
                visibility: visible;
            }

            .navbar li {
                width: 100%;
            }

            .navbar a {
                padding: 16px 24px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                justify-content: flex-start;
            }

            .navbar a::before {
                display: none;
            }

            .navbar a:hover {
                background: rgba(255, 255, 255, 0.1);
                padding-left: 32px;
            }

            .brand-section {
                position: relative;
            }
        }

        /* Content area styling */
        .content {
            max-width: 1200px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        /* Smooth scrolling */
        html {
            scroll-behavior: smooth;
        }

        /* Loading animation */
        .navbar {
            animation: slideDown 0.6s ease-out;
        }

        @keyframes slideDown {
            from {
                transform: translateY(-100%);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        /* Hover effects for better UX */
        .navbar li:hover {
            transform: translateY(-2px);
            transition: transform 0.2s ease;
        }

        @media (max-width: 768px) {
            .navbar li:hover {
                transform: none;
            }
        }
    </style>
</head>

<body>
    <header class="header">
        <div class="header-content">
            <div class="brand-section">
                <h2 class="brand-title">
                    <div class="brand-icon">
                        <i class="fas fa-cube"></i>
                    </div>
                    Product Management System
                </h2>
                <button class="mobile-toggle" id="mobileToggle">
                    <i class="fas fa-bars"></i>
                </button>
            </div>
            
            <nav class="navbar">
                <ul id="navMenu">
                    <li>
                        <a href="/" class="active">
                            <i class="fas fa-home nav-icon"></i>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="addproduct">
                            <i class="fas fa-plus-circle nav-icon"></i>
                            Add Product
                        </a>
                    </li>
                    <li>
                        <a href="viewallprods">
                            <i class="fas fa-list nav-icon"></i>
                            View All Products
                        </a>
                    </li>
                    <li>
                        <a href="viewproductbyid">
                            <i class="fas fa-search nav-icon"></i>
                            View By ID
                        </a>
                    </li>
                    <li>
                        <a href="viewproductsbycategory">
                            <i class="fas fa-tags nav-icon"></i>
                            View By Category
                        </a>
                    </li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="content">
        <!-- Your page content goes here -->
        <p style="text-align: center; color: #64748b; font-size: 1.1rem; margin-top: 40px;">
            Welcome to your Product Management System. Use the navigation above to manage your products.
        </p>
    </div>

    <script>
        // Mobile menu toggle
        const mobileToggle = document.getElementById('mobileToggle');
        const navMenu = document.getElementById('navMenu');
        
        mobileToggle.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            
            // Change icon
            const icon = this.querySelector('i');
            if (navMenu.classList.contains('active')) {
                icon.classList.remove('fa-bars');
                icon.classList.add('fa-times');
            } else {
                icon.classList.remove('fa-times');
                icon.classList.add('fa-bars');
            }
        });

        // Close mobile menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!e.target.closest('.navbar') && !e.target.closest('.mobile-toggle')) {
                navMenu.classList.remove('active');
                const icon = mobileToggle.querySelector('i');
                icon.classList.remove('fa-times');
                icon.classList.add('fa-bars');
            }
        });

        // Highlight active page
        const currentPath = window.location.pathname;
        const navLinks = document.querySelectorAll('.navbar a');
        
        navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === currentPath || 
                (currentPath === '/' && link.getAttribute('href') === '/')) {
                link.classList.add('active');
            }
        });

        // Smooth hover effects
        navLinks.forEach(link => {
            link.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-2px)';
            });
            
            link.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });
    </script>
</body>

</html>