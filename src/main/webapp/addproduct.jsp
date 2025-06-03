<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Add Product - Spring Boot Project</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
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
            color: #334155;
        }

        .main-container {
            max-width: 800px;
            margin: 0 auto;
            padding: 40px 20px;
        }

        .page-header {
            text-align: center;
            margin-bottom: 40px;
        }

        .page-title {
            font-size: 2.25rem;
            font-weight: 600;
            color: #1e293b;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
        }

        .title-icon {
            width: 40px;
            height: 40px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 1.2rem;
        }

        .page-subtitle {
            font-size: 1.125rem;
            color: #64748b;
            font-weight: 400;
        }

        .form-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            border: 1px solid #e2e8f0;
            overflow: hidden;
            animation: fadeInUp 0.6s ease-out;
        }

        .form-header {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            padding: 30px;
            text-align: center;
            color: white;
        }

        .form-header h3 {
            font-size: 1.5rem;
            font-weight: 500;
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
            color: #374151;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .label-icon {
            color: #667eea;
            font-size: 1rem;
        }

        .form-input,
        .form-select,
        .form-textarea {
            padding: 14px 16px;
            border: 2px solid #e2e8f0;
            border-radius: 12px;
            font-size: 1rem;
            transition: all 0.3s ease;
            background: white;
            font-family: inherit;
        }

        .form-input:focus,
        .form-select:focus,
        .form-textarea:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.1);
            transform: translateY(-1px);
        }

        .form-textarea {
            min-height: 100px;
            resize: vertical;
        }

        .form-select {
            cursor: pointer;
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 20 20'%3e%3cpath stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='1.5' d='m6 8 4 4 4-4'/%3e%3c/svg%3e");
            background-position: right 12px center;
            background-repeat: no-repeat;
            background-size: 16px;
            padding-right: 40px;
            appearance: none;
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
            border: 2px dashed #cbd5e1;
            border-radius: 12px;
            background: #f8fafc;
            color: #64748b;
            cursor: pointer;
            transition: all 0.3s ease;
            text-align: center;
            min-height: 60px;
        }

        .file-input-button:hover {
            border-color: #667eea;
            background: #f1f5f9;
            color: #667eea;
        }

        .file-input-button.has-file {
            border-color: #10b981;
            background: #ecfdf5;
            color: #065f46;
        }

        .submit-container {
            text-align: center;
            margin-top: 40px;
            padding-top: 30px;
            border-top: 1px solid #f1f5f9;
        }

        .submit-button {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
            padding: 16px 40px;
            border-radius: 12px;
            font-size: 1.1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            min-width: 160px;
            justify-content: center;
        }

        .submit-button:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 25px rgba(102, 126, 234, 0.4);
        }

        .submit-button:active {
            transform: translateY(0);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .main-container {
                padding: 20px 16px;
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

        .form-row {
            animation: fadeInUp 0.6s ease-out both;
        }

        .form-row:nth-child(1) { animation-delay: 0.1s; }
        .form-row:nth-child(2) { animation-delay: 0.2s; }
        .form-row:nth-child(3) { animation-delay: 0.3s; }
        .form-row:nth-child(4) { animation-delay: 0.4s; }
        .form-row:nth-child(5) { animation-delay: 0.5s; }
        .form-row:nth-child(6) { animation-delay: 0.6s; }

        /* Validation styles */
        .form-input:invalid,
        .form-select:invalid {
            border-color: #ef4444;
        }

        .form-input:valid,
        .form-select:valid {
            border-color: #10b981;
        }
    </style>
</head>

<body>
    <%@ include file="productnavbar.jsp" %>

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
            this.style.borderColor = '#667eea';
            this.style.backgroundColor = '#f1f5f9';
        });

        fileButton.addEventListener('dragleave', function(e) {
            e.preventDefault();
            this.style.borderColor = '#cbd5e1';
            this.style.backgroundColor = '#f8fafc';
        });

        fileButton.addEventListener('drop', function(e) {
            e.preventDefault();
            this.style.borderColor = '#cbd5e1';
            this.style.backgroundColor = '#f8fafc';
            
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
                    this.style.borderColor = '#10b981';
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