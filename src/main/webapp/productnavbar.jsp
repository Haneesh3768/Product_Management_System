<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <title>Product Management System</title>
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

        /* Header Styles */
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

        /* Content Area */
        .content {
            margin-top: 80px;
            min-height: calc(100vh - 80px);
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 4rem 2rem;
        }

        .hero-content {
            max-width: 800px;
        }

        .hero-title {
            font-size: 3.5rem;
            font-weight: 800;
            background: linear-gradient(135deg, #ffffff, #cccccc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 1.5rem;
            line-height: 1.2;
        }

        .hero-subtitle {
            font-size: 1.2rem;
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 2rem;
            line-height: 1.6;
        }

        .cta-button {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 16px 32px;
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            box-shadow: 0 8px 30px rgba(255, 107, 107, 0.3);
        }

        .cta-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(255, 107, 107, 0.4);
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

            .content {
                margin-top: 70px;
                min-height: calc(100vh - 70px);
                padding: 2rem 1rem;
            }

            .hero-title {
                font-size: 2.5rem;
            }

            .hero-subtitle {
                font-size: 1.1rem;
            }
        }

        /* Smooth animations */
        .nav-link {
            animation: slideInUp 0.6s ease-out;
            animation-delay: calc(var(--i) * 0.1s);
            animation-fill-mode: both;
        }

        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Floating animation for brand icon */
        .brand-icon {
            animation: float 3s ease-in-out infinite;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
        }
    </style>
</head>
<body>
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
                        <a href="/" class="nav-link active" style="--i: 0">
                            <i class="fas fa-home nav-icon"></i>
                            Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="addproduct" class="nav-link" style="--i: 1">
                            <i class="fas fa-plus-circle nav-icon"></i>
                            Add Product
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="viewallprods" class="nav-link" style="--i: 2">
                            <i class="fas fa-list nav-icon"></i>
                            View All
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="viewproductbyid" class="nav-link" style="--i: 3">
                            <i class="fas fa-search nav-icon"></i>
                            View By ID
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="viewproductsbycategory" class="nav-link" style="--i: 4">
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

    <main class="content">
        <div class="hero-content">
            <h1 class="hero-title">Product Management System</h1>
            <p class="hero-subtitle">
                Streamline your product workflow with our comprehensive management solution. 
                Add, view, search, and organize your products with ease.
            </p>
            <a href="addproduct" class="cta-button">
                <i class="fas fa-plus-circle"></i>
                Get Started
            </a>
        </div>
    </main>

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

        // Add stagger animation to nav items
        const navItems = document.querySelectorAll('.nav-link');
        navItems.forEach((item, index) => {
            item.style.setProperty('--i', index);
        });
    </script>
</body>
</html>