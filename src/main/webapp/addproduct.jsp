<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=ISO-8859-1" isELIgnored="false"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
</head>

<body>

<%@ include file="productnavbar.jsp" %>

<h3 align=center><u>Add Product</u></h3>

<br>

<form action="insertproduct" method="post" enctype="multipart/form-data" class="form-container">

<table align="center">

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

<tr>
<td><label>Name</label></td>
<td><input type="text" name="name" required="required"/></td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Description</label></td>
<td>
<textarea name="description"></textarea>
</td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Cost</label></td>
<td><input type="number" name="cost" required="required" step="0.01" /></td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Link</label></td>
<td><input type="text" name="productlink"/></td>
</tr>

<tr><td></td></tr>

<tr>
<td><label>Image</label></td>
<td><input type="file" name="productimage" required="required"/></td>
</tr>

<tr><td></td></tr>
<tr><td></td></tr>

<tr align=center>
<td colspan=2><input type="submit" value="Add" class="button"></td>
</tr>

</table>

</form>
    
    
</body>

</html>
