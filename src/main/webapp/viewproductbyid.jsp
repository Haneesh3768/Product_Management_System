<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    
    <style>
    
        .form-container {
            width: 50%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
            text-align: center;
        }

        .form-container table {
            width: 100%;
            margin-top: 20px;
        }

        .form-container td {
            padding: 10px;
        }

        .form-container select {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .form-container .button {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 25%;
        }

        .form-container .button:hover {
            background-color: #45a049;
        }
    
    </style>
    
</head>

<body>

<%@ include file="productnavbar.jsp" %>
 
    <form method="post" action="displayproduct" class="form-container">
    <table align="center">
    
    <tr>
    <td>Select Product</td>
    <td>
    <select name="pid" required>
    <option value="">---Select---</option>
    <c:forEach items="${productlist}" var="product">
<option value="${product.id}">${product.name}</option>
</c:forEach>
</select>
    </td>
    </tr>
    <tr>
    <td colspan="2">
    <input type="submit" value="View" class="button">
    </td>
    </tr>
    
    </table>
    </form>
   
</body>

</html>
