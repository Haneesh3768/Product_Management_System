<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    <style>

    /* Styling for main content container */
    .content {
        text-align: left;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        max-width: 600px;
        margin: 20px;
    }

    /* Styling for list items */
    .content b {
        font-size: 1.2em;
        line-height: 1.6;
    }

    /* Styling for navigation links */
    .content a {
        color: #007BFF;
        text-decoration: none;
        font-weight: bold;
    }

    .content a:hover {
        text-decoration: underline;
    }
</style>
    
</head>

<body>

<%@ include file="productnavbar.jsp" %>

<div class="content">
    <b>
        1. Add Product with Image<br/>
        2. View All Products<br/>
        3. View Product By ID [IDs will be populated from database]<br/>
        4. View Product By Category
    </b>
</div>

</body>

</html>
