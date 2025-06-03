<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    <style>
<style>
    #myTableContainer {
        width: 90%;
        margin: auto;
        margin-top: 20px;
        border-radius: 8px;
        overflow: hidden;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    #myTable {
        width: 100%;
        border-collapse: collapse;
        font-size: 16px;
        background-color: #ffffff;
    }

    #myTable th, #myTable td {
        padding: 12px 15px;
        text-align: left;
        border-bottom: 1px solid #dddddd;
    }

    #myTable th {
        background-color: black;
        color: white;
        font-weight: bold;
        text-align: center;
    }

    #myTable tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    #myTable tr:nth-child(odd) {
        background-color: #f2f2f2;
    }

    #myTable tr:hover {
        background-color: #d1e7dd;
    }

    #myInput {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin-bottom: 20px;
        box-sizing: border-box;
    }
</style>


       
    <script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[2];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>
    
</head>

<body>

<%@ include file="productnavbar.jsp" %>

<h3 align=center><u>View All Products</u></h3>

<br>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Product Name">

<table align=center border=2 id="myTable">

<tr class="header">

<th>ID</th>
<th>Category</th>
<th>Name</th>
<th>Description</th>
<th>Cost</th>
<th>Link</th>
<th>Image</th>
</tr>

<c:forEach items="${productlist}" var="product">

<tr>

<td> <c:out value="${product.id}"></c:out>  </td>
<td> <c:out value="${product.category}"></c:out>   </td>
<td> <c:out value="${product.name}"></c:out>   </td>
<td> <c:out value="${product.description}"></c:out>   </td>
<td> <c:out value="${product.cost}"></c:out>   </td>
<td> 

<a href='<c:url value='${product.url}'></c:url>' target="_new">Click Here</a>&nbsp;&nbsp;

</td>

<td> 

<img src='displayprodimage?id=${product.id}' width="20%" height="20%"> 

</td>


</tr>

</c:forEach>

</table>

    
</body>

</html>
