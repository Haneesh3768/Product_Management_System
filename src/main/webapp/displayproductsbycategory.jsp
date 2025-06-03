<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
 
 <style>
    /* Style for the input filter */
    #myInput {
        width: 80%;
        font-size: 16px;
        padding: 12px 20px;
        margin: 20px auto;
        display: block;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    /* Center the table and make it look modern */
    #myTable {
        width: 80%;
        margin: 0 auto;
        border-collapse: collapse;
        font-size: 16px;
        color: #333;
        background-color: #f9f9f9;
        border-radius: 5px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    #myTable th, #myTable td {
        padding: 15px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }

    #myTable th {
        background-color: black;
        color: white;
        text-transform: uppercase;
    }

    #myTable tr:hover {
        background-color: #f1f1f1;
    }

    #myTable img {
        border-radius: 5px;
    }

    /* Center alignment for the heading */
    h3 {
        text-align: center;
        color: #333;
        font-family: Arial, sans-serif;
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

<a href='<c:url value='${product.url}'></c:url>'>Click Here</a>&nbsp;&nbsp;

</td>

<td> 

<img src='displayprodimage?id=${product.id}' width="20%" height="20%"> 


</td>


</tr>

</c:forEach>

</table>

    
</body>

</html>