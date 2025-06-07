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

        .brand-text {
            background: linear-gradient(135deg, #ffffff, #cccccc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

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
            max-width: 1000px;
            margin: 0 auto;
            padding: 120px 20px 40px;
            min-height: 100vh;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
        }

        .page-header {
            text-align: center;
            margin-bottom: 64px;
        }

        .page-title {
            font-size: 3.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, #ffffff, #cccccc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 16px;
            letter-spacing: -0.025em;
            line-height: 1.2;
        }

        .page-subtitle {
            font-size: 1.25rem;
            color: rgba(255, 255, 255, 0.7);
            font-weight: 400;
        }

        .menu-container {
            background: rgba(255, 255, 255, 0.03);
            border-radius: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 32px 40px;
            text-decoration: none;
            color: inherit;
            border-bottom: 1px solid rgba(255, 255, 255, 0.05);
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            position: relative;
            overflow: hidden;
        }

        .menu-item::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            width: 0;
            height: 100%;
            background: linear-gradient(90deg, rgba(255, 107, 107, 0.1), rgba(78, 205, 196, 0.1));
            transition: width 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
        }

        .menu-item:last-child {
            border-bottom: none;
        }

        .menu-item:hover {
            background: rgba(255, 255, 255, 0.05);
            transform: translateY(-2px);
        }

        .menu-item:hover::before {
            width: 100%;
        }

        .menu-number {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: linear-gradient(135deg, rgba(255, 107, 107, 0.2), rgba(78, 205, 196, 0.2));
            color: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            font-size: 1.1rem;
            margin-right: 24px;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .menu-item:hover .menu-number {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            transform: scale(1.1) rotate(5deg);
            box-shadow: 0 8px 25px rgba(255, 107, 107, 0.3);
        }

        .menu-content {
            flex: 1;
            position: relative;
            z-index: 2;
        }

        .menu-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 8px;
            transition: all 0.3s ease;
        }

        .menu-item:hover .menu-title {
            color: #ffffff;
            transform: translateX(8px);
        }

        .menu-description {
            font-size: 1rem;
            color: rgba(255, 255, 255, 0.6);
            transition: all 0.3s ease;
        }

        .menu-item:hover .menu-description {
            color: rgba(255, 255, 255, 0.8);
            transform: translateX(8px);
        }

        .menu-arrow {
            color: rgba(255, 255, 255, 0.3);
            font-size: 1.2rem;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            position: relative;
            z-index: 2;
        }

        .menu-item:hover .menu-arrow {
            color: #ffffff;
            transform: translateX(8px) scale(1.2);
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

            .brand {
                font-size: 1.3rem;
            }

            .brand-icon {
                width: 40px;
                height: 40px;
            }

            .main-container {
                padding: 90px 16px 24px;
            }
            
            .page-title {
                font-size: 2.5rem;
            }
            
            .menu-item {
                padding: 24px 28px;
            }
            
            .menu-number {
                width: 40px;
                height: 40px;
                margin-right: 20px;
                font-size: 1rem;
            }

            .menu-title {
                font-size: 1.1rem;
            }

            .menu-description {
                font-size: 0.9rem;
            }
        }

        /* Animations */
        .menu-container {
            animation: fadeInUp 0.8s ease-out;
        }

        .page-header {
            animation: fadeInUp 0.8s ease-out 0.2s both;
        }

        .menu-item {
            animation: slideInUp 0.6s ease-out;
            animation-delay: calc(var(--i) * 0.1s);
            animation-fill-mode: both;
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

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
        }

        /* Loading state */
        .menu-item {
            opacity: 0;
            transform: translateY(20px);
        }

        .menu-item.loaded {
            opacity: 1;
            transform: translateY(0);
            transition: all 0.6s cubic-bezier(0.25, 0.46, 0.45, 0.94);
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
                        <a href="/" class="nav-link active">
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
                        <a href="viewallprods" class="nav-link">
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

    <!-- Main Content -->
    <div class="main-container">
        <div class="page-header">
            <h1 class="page-title">Product Management</h1>
            <p class="page-subtitle">Manage your product inventory with ease and efficiency</p>
        </div>

        <div class="menu-container">
            <a href="addproduct" class="menu-item" style="--i: 0">
                <div class="menu-number">1</div>
                <div class="menu-content">
                    <div class="menu-title">Add Product with Image</div>
                    <div class="menu-description">Create new products and upload high-quality images</div>
                </div>
                <i class="fas fa-chevron-right menu-arrow"></i>
            </a>

            <a href="viewallprods" class="menu-item" style="--i: 1">
                <div class="menu-number">2</div>
                <div class="menu-content">
                    <div class="menu-title">View All Products</div>
                    <div class="menu-description">Browse your complete product catalog with detailed information</div>
                </div>
                <i class="fas fa-chevron-right menu-arrow"></i>
            </a>

            <a href="viewproductbyid" class="menu-item" style="--i: 2">
                <div class="menu-number">3</div>
                <div class="menu-content">
                    <div class="menu-title">View Product By ID</div>
                    <div class="menu-description">Search and find specific products using database IDs</div>
                </div>
                <i class="fas fa-chevron-right menu-arrow"></i>
            </a>

            <a href="viewproductsbycategory" class="menu-item" style="--i: 3">
                <div class="menu-number">4</div>
                <div class="menu-content">
                    <div class="menu-title">View Products By Category</div>
                    <div class="menu-description">Filter and organize products by their categories</div>
                </div>
                <i class="fas fa-chevron-right menu-arrow"></i>
            </a>
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

        // Active link highlighting
        const currentPath = window.location.pathname;
        const navLinks = document.querySelectorAll('.nav-link');
        
        navLinks.forEach(link => {
            link.classList.remove('active');
            const linkPath = link.getAttribute('href');
            if (linkPath === currentPath || 
                (currentPath === '/' && linkPath === '/')) {
                link.classList.add('active');
            }
        });

        // Staggered animation for menu items
        const menuItems = document.querySelectorAll('.menu-item');
        
        // Add loaded class with delay for smooth entrance
        setTimeout(() => {
            menuItems.forEach((item, index) => {
                setTimeout(() => {
                    item.classList.add('loaded');
                }, index * 100);
            });
        }, 400);

        // Enhanced hover effects
        menuItems.forEach(item => {
            item.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-4px)';
            });
            
            item.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });

        // Smooth scroll for internal links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });
                }
            });
        });
    </script>
</body>

</html>