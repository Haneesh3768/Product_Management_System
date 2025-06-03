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

<br><br>

<h3 align="center"><u>Product Details</u></h3>

<br>

<div class="card">
    <img src="displayprodimage?id=${product.id}" width="25%" alt="${product.name} Image"/>
    <h1>${product.category}</h1>
    <h2>${product.name}</h2>
    <p>Cost: ${product.cost}</p>
    <p>${product.description}</p>
    <p><a href="${product.url}" target="_new">Click Here</a></p>
</div>


</body>
</html>
