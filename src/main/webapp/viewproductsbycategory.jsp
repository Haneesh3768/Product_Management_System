<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    
      <style>
        /* Centering and styling the card */
        .card {
            width: 40%;
            margin: auto;
            padding: 20px;
            text-align: center;
            border: 1px solid #ddd;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            background-color: #f9f9f9;
        }

        /* Styling the image */
        .card img {
            width: 50%;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        /* Styling for headings and paragraphs within the card */
        .card h1, .card h2 {
            color: #333;
            margin: 10px 0;
        }

        .card p {
            color: #555;
            margin: 10px 0;
            font-size: 16px;
        }

        /* Styling the link */
        .card a {
            color: #4CAF50;
            text-decoration: none;
            font-weight: bold;
        }

        .card a:hover {
            text-decoration: underline;
        }
    </style>
   
</head>

<body>

<%@ include file="productnavbar.jsp" %>

<h3 align=center><u>View Products by Category</u></h3>

<br>

<form action="displayproductsbycategory" method="post" class="form-container">

<table align=center>

<tr>
<td><label>Category</label></td>
<td>
<select name="category" required="required">
<option value="">---Select---</option>
<option value="Mobile">Mobile</option>
<option value="Laptop">Laptop</option>
<option value="Watch">Watch</option>
</select>
</td>
</tr>



<tr><td></td></tr>
<tr><td></td></tr>

<tr align=center>
<td colspan=2><input type="submit" value="View" class="button"></td>
</tr>

</table>

</form>
    
    
</body>

</html>
