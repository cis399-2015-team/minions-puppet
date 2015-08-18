<?php
    include('empConnectionData.txt');
    $conn = mysqli_connect($server, $user, $pass, $dbname, $port)
    or die('Error connecting to MySQL server.');
?>
<html>
<head>
    <!-- Latest compiled and minified CSS for bootstrap from Max CDN-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <!-- Link to my own stylesheet -->
    <link rel="stylesheet" type="text/css" href="employeeview.css">
    <title>Add A New Roast</title>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <ul class="nav nav-pills">
            <li role="presentation"><a href="employeehome.html">Home</a></li>
            <li role="presentation"><a href="viewschedule.php">View Current Schedule</a></li>
            <li role="presentation"><a href="updateschedule.html">Update Schedule</a></li>
            <li role="presentation"><a href="newemployee.html">Add a New Employee</a></li>
            <li role="presentation"><a href="viewinventories.php">View Store & Online Inventories</a></li>
            <li role="presentation" class="active"><a href="updatestore.html">Update Inventory</a></li>
        </ul>
    </div>
</nav>
<h1>Adding New Roast</h1>

<?php
echo '<pre>';
    $roast_name = trim($_POST['roast_name']);
    $roaster_name = trim($_POST['roaster_name']);
    $roast_type = trim($_POST['roast_type']);
    $origin = trim($_POST['origin']);
    $quantity = trim($_POST['quantity']);
    $price = trim($_POST['price']);
    $descr = trim($_POST['descr']);


    echo $online;
    echo " Adding: ".$roast_name;
    echo "\n";

    $query1 = "INSERT INTO allitems (item_name,description) VALUES (?, ?); ";
    $stmt1 = mysqli_prepare($conn, $query1);
    mysqli_stmt_bind_param($stmt1, "ss", $roast_name, $descr);
    mysqli_stmt_execute($stmt1);
    mysqli_stmt_close($stmt1);


    $query2 = "SELECT * FROM allitems; ";
    $result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));

    echo "<p><h3>Updated Items</h3></p>";
    echo "<table style='width:70%'>";
    echo "<tr><th>Item#</th> <th>Item Name</th> <th>Description</th></tr>";

    while($row = mysqli_fetch_array($result2, MYSQLI_BOTH)) {
        echo "<tr>";
        echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[description]</td>";
        echo "</tr>";
    }

    mysqli_free_result($result2);
    echo "</table>";


    $query3 = "SELECT MAX(item_num) AS maxnum FROM allitems; ";
    $result3 = mysqli_query($conn, $query3) or die(mysqli_error($conn));
    while($row = mysqli_fetch_array($result3, MYSQLI_BOTH)) {
        $item_num = $row[maxnum];
    }

    mysqli_free_result($result3);


    $query4 = "INSERT INTO storeinv (item_num,item_name,quantity,price) VALUES ($item_num, ?, ?, ?); ";
    $stmt4 = mysqli_prepare($conn, $query4);
    mysqli_stmt_bind_param($stmt4, "sii", $roast_name, $quantity, $price);
    mysqli_stmt_execute($stmt4);
    mysqli_stmt_close($stmt4);


    $query5 = "SELECT * FROM storeinv; ";
    $result5 = mysqli_query($conn, $query5) or die(mysqli_error($conn));

    echo "<p><h3>Updated Store Inventory</h3></p>";
    echo "<table style='width:70%'>";
    echo "<tr><th>Item#</th> <th>Item Name</th> <th>Quantity</th> <th>Price Per Unit</th></tr>";

    while($row = mysqli_fetch_array($result5, MYSQLI_BOTH)) {
        echo "<tr>";
        echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[quantity]</td> <td>&#36;$row[price]</td>";
        echo "</tr>";
    }

    mysqli_free_result($result5);

    echo "</table>";

    if(isset($_POST['online'])) {
        echo "<p>";
        $query8 = "INSERT INTO onlineinv (item_num,item_name,quantity,price) VALUES ($item_num, ?, ?, ?); ";
        $stmt8 = mysqli_prepare($conn, $query8);
        mysqli_stmt_bind_param($stmt8, "sii", $roast_name, $quantity, $price);
        mysqli_stmt_execute($stmt8);
        mysqli_stmt_close($stmt8);

        $query9 = "SELECT * FROM onlineinv; ";
        $result9 = mysqli_query($conn, $query9) or die(mysqli_error($conn));
        echo "</p>";
        echo "<p><h3>Updated Online Inventory</h3></p>";
        echo "<table style='width:70%'>";
        echo "<tr><th>Item#</th> <th>Item Name</th> <th>Quantity</th> <th>Price Per Unit</th></tr>";

        while($row = mysqli_fetch_array($result9, MYSQLI_BOTH)) {
            echo "<tr>";
            echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[quantity]</td> <td>&#36;$row[price]</td>";
            echo "</tr>";
        }

        mysqli_free_result($result9);
        echo "</table>";
        echo "</p>";
    } else {
        $online = 0;
        echo $online;
        echo "\n";
    }



    $query6 = "INSERT INTO roasts (item_num,roast_name,roaster_name,roast_type,origin,description) VALUES ($item_num,?,?,?,?,?); ";
    $stmt6 = mysqli_prepare($conn, $query6);
    mysqli_stmt_bind_param($stmt6, "sssss", $roast_name, $roaster_name, $roast_type, $origin, $descr);
    mysqli_stmt_execute($stmt6);
    mysqli_stmt_close($stmt6);


    $query7 = "SELECT * FROM roasts; ";
    $result7 = mysqli_query($conn, $query7) or die (mysqli_error($conn));

    echo "<p><h3>Updated Roast List</h3></p>";
    echo "<table style='width:70%'>";
    echo "<tr><th>Item#</th> <th>Roast Name</th> <th>Roaster Name</th> <th>Roast Type</th> <th>Origin</th> <th>Description</th></tr>";

    while($row = mysqli_fetch_array($result7, MYSQLI_BOTH)) {
        echo "<tr>";
        echo "<td>$row[item_num]</td> <td>$row[roast_name]</td> <td>$row[roaster_name]</td> <td>$row[roast_type]</td> <td>$row[origin]</td> <td>$row[description]</td>";
        echo "</tr>";
    }

    mysqli_free_result($result7);

    echo "</table>";

echo '</pre>';
mysqli_close($conn);

?>

</body>
</html>