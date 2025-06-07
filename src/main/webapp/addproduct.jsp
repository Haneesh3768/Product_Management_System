<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Product - Product Management System</title>
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

        /* Header Styles - Matching your navbar */
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
            max-width: 800px;
            margin: 0 auto;
            padding: 120px 20px 40px;
            background: linear-gradient(135deg, #0a0a0a 0%, #1a1a1a 100%);
            min-height: 100vh;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .page-title {
            font-size: 2.25rem;
            font-weight: 700;
            background: linear-gradient(135deg, #ffffff, #cccccc);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .title-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.3rem;
            box-shadow: 0 4px 15px rgba(255, 107, 107, 0.3);
        }

        .page-subtitle {
            font-size: 1.125rem;
            color: rgba(255, 255, 255, 0.7);
            font-weight: 400;
        }

        .form-container {
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(20px);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.1);
            overflow: hidden;
            animation: fadeInUp 0.6s ease-out;
        }

        .form-header {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            padding: 30px;
            text-align: center;
            color: white;
        }

        .form-header h3 {
            font-size: 1.5rem;
            font-weight: 600;
            margin: 0;
        }

        .form-body {
            padding: 40px;
        }

        .form-row {
            margin-bottom: 28px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-label {
            font-weight: 500;
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .label-icon {
            color: #ff6b6b;
            font-size: 1rem;
        }

        .form-input,
        .form-select,
        .form-textarea {
            padding: 14px 16px;
            border: 2px solid rgba(255, 255, 255, 0.1);
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.05);
            color: #ffffff;
            font-family: inherit;
        }

        .form-input::placeholder,
        .form-textarea::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }

        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {
            outline: none;
            border-color: #ff6b6b;
            box-shadow: 0 0 0 3px rgba(255, 107, 107, 0.2);
            transform: translateY(-1px);
            background: rgba(255, 255, 255, 0.08);
        }

        .form-textarea {
            min-height: 100px;
            resize: vertical;
        }

        .form-select {
            cursor: pointer;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%23ffffff' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='m6 8 4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 12px center;
            background-repeat: no-repeat;
            background-size: 16px;
            padding-right: 40px;
            appearance: none;
        }

        .form-select option {
            background: #1a1a1a;
            color: #ffffff;
        }

        .file-input-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
            width: 100%;
        }

        .file-input {
            position: absolute;
            left: -9999px;
        }

        .file-input-button {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            padding: 14px 16px;
            border: 2px dashed rgba(255, 255, 255, 0.3);
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.05);
            color: rgba(255, 255, 255, 0.7);
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            min-height: 60px;
        }

        .file-input-button:hover {
            border-color: #ff6b6b;
            background: rgba(255, 107, 107, 0.1);
            color: #ffffff;
        }

        .file-input-button.has-file {
            border-color: #4ecdc4;
            background: rgba(78, 205, 196, 0.1);
            color: #4ecdc4;
        }

        .submit-container {
            text-align: center;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .submit-button {
            background: linear-gradient(135deg, #ff6b6b, #4ecdc4);
            color: white;
            border: none;
            padding: 16px 40px;
            border-radius: 50px;
            font-size: 1.1rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
            display: inline-flex;
            align-items: center;
            gap: 10px;
            min-width: 160px;
            justify-content: center;
            box-shadow: 0 8px 30px rgba(255, 107, 107, 0.3);
        }

        .submit-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(255, 107, 107, 0.4);
        }

        .submit-button:active {
            transform: translateY(0);
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
                padding: 90px 16px 40px;
            }
            
            .page-title {
                font-size: 1.875rem;
            }
            
            .form-body {
                padding: 30px 24px;
            }
            
            .form-input,
            .form-select,
            .form-textarea {
                padding: 12px 14px;
            }
        }

        /* Animations */
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

        @keyframes float {
            0%, 100% { transform: translateY(0px); }
            50% { transform: translateY(-5px); }
        }

        .form-row {
            animation: fadeInUp 0.6s ease-out both;
        }

        .form-row:nth-child(1) { animation-delay: 0.1s; }
        .form-row:nth-child(2) { animation-delay: 0.2s; }
        .form-row:nth-child(3) { animation-delay: 0.3s; }
        .form-row:nth-child(4) { animation-delay: 0.4s; }
        .form-row:nth-child(5) { animation-delay: 0.5s; }
        .form-row:nth-child(6) { animation-delay: 0.6s; }

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

        /* Validation styles */
        .form-input:invalid,
        .form-select:invalid {
            border-color: #ef4444;
        }

        .form-input:valid,
        .form-select:valid {
            border-color: #4ecdc4;
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
                        <a href="/" class="nav-link" style="--i: 0">
                            <i class="fas fa-home nav-icon"></i>
                            Home
                        </a>
                    </li>
                    <li class="nav-item">
                        <a href="addproduct" class="nav-link active" style="--i: 1">
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

    <div class="main-container">
        <div class="page-header">
            <h1 class="page-title">
                <div class="title-icon">
                    <i class="fas fa-plus-circle"></i>
                </div>
                Add New Product
            </h1>
            <p class="page-subtitle">Create a new product entry with detailed information</p>
        </div>

        <div class="form-container">
            <div class="form-header">
                <h3>Product Information</h3>
            </div>

            <form action="insertproduct" method="post" enctype="multipart/form-data">
                <div class="form-body">
                    
                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-tags label-icon"></i>
                                Category
                            </label>
                            <select name="category" class="form-select" required>
                                <option value="">Choose a category...</option>
                                <option value="Mobile">📱 Mobile</option>
                                <option value="Laptop">💻 Laptop</option>
                                <option value="Watch">⌚ Watch</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-cube label-icon"></i>
                                Product Name
                            </label>
                            <input type="text" name="name" class="form-input" required placeholder="Enter product name">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-align-left label-icon"></i>
                                Description
                            </label>
                            <textarea name="description" class="form-textarea" placeholder="Describe your product features and specifications..."></textarea>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-dollar-sign label-icon"></i>
                                Cost
                            </label>
                            <input type="number" name="cost" class="form-input" required step="0.01" min="0" placeholder="0.00">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-link label-icon"></i>
                                Product Link
                            </label>
                            <input type="url" name="productlink" class="form-input" placeholder="https://example.com/product">
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label class="form-label">
                                <i class="fas fa-image label-icon"></i>
                                Product Image
                            </label>
                            <div class="file-input-wrapper">
                                <input type="file" name="productimage" class="file-input" required accept="image/*" id="productImage">
                                <label for="productImage" class="file-input-button" id="fileButton">
                                    <i class="fas fa-cloud-upload-alt"></i>
                                    <span>Click to upload image or drag and drop</span>
                                </label>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="submit-container">
                    <button type="submit" class="submit-button">
                        <i class="fas fa-plus"></i>
                        Add Product
                    </button>
                </div>
            </form>
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
            if (linkPath === 'addproduct' || 
                (currentPath.includes('addproduct') && linkPath === 'addproduct')) {
                link.classList.add('active');
            }
        });

        // Add stagger animation to nav items
        const navItems = document.querySelectorAll('.nav-link');
        navItems.forEach((item, index) => {
            item.style.setProperty('--i', index);
        });

        // File input enhancement
        const fileInput = document.getElementById('productImage');
        const fileButton = document.getElementById('fileButton');

        fileInput.addEventListener('change', function(e) {
            const file = e.target.files[0];
            if (file) {
                fileButton.classList.add('has-file');
                fileButton.innerHTML = `
                    <i class="fas fa-check-circle"></i>
                    <span>Selected: ${file.name}</span>
                `;
            } else {
                fileButton.classList.remove('has-file');
                fileButton.innerHTML = `
                    <i class="fas fa-cloud-upload-alt"></i>
                    <span>Click to upload image or drag and drop</span>
                `;
            }
        });

        // Drag and drop functionality
        fileButton.addEventListener('dragover', function(e) {
            e.preventDefault();
            this.style.borderColor = '#ff6b6b';
            this.style.backgroundColor = 'rgba(255, 107, 107, 0.1)';
        });

        fileButton.addEventListener('dragleave', function(e) {
            e.preventDefault();
            this.style.borderColor = 'rgba(255, 255, 255, 0.3)';
            this.style.backgroundColor = 'rgba(255, 255, 255, 0.05)';
        });

        fileButton.addEventListener('drop', function(e) {
            e.preventDefault();
            this.style.borderColor = 'rgba(255, 255, 255, 0.3)';
            this.style.backgroundColor = 'rgba(255, 255, 255, 0.05)';
            
            const files = e.dataTransfer.files;
            if (files.length > 0) {
                fileInput.files = files;
                fileInput.dispatchEvent(new Event('change'));
            }
        });

        // Form validation enhancement
        const form = document.querySelector('form');
        const inputs = form.querySelectorAll('input[required], select[required]');

        inputs.forEach(input => {
            input.addEventListener('blur', function() {
                if (this.value.trim() === '') {
                    this.style.borderColor = '#ef4444';
                } else {
                    this.style.borderColor = '#4ecdc4';
                }
            });
        });

        // Form submission with loading state
        form.addEventListener('submit', function(e) {
            const submitButton = form.querySelector('.submit-button');
            submitButton.innerHTML = `
                <i class="fas fa-spinner fa-spin"></i>
                Adding Product...
            `;
            submitButton.disabled = true;
        });
    </script>
</body>

</html>