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
    <title>Current Inventory</title>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <ul class="nav nav-pills">
            <li role="presentation"><a href="employeehome.html">Home</a></li>
            <li role="presentation"><a href="viewschedule.php">View Current Schedule</a></li>
            <li role="presentation"><a href="updateschedule.html">Update Schedule</a></li>
            <li role="presentation"><a href="newemployee.html">Add a New Employee</a></li>
            <li role="presentation" class="active"><a href="viewinventories.php">View Store & Online Inventories</a></li>
            <li role="presentation"><a href="updatestore.html">Update Inventory</a></li>
        </ul>
    </div>
</nav>
<br>
<?php
echo "<pre>";
$query1 = "SELECT * FROM storeinv; ";
$result1 = mysqli_query($conn, $query1) or die(mysqli_error($conn));

echo "<p><h1>Store Inventory</h1></p>";
echo "<table style='width:70%'>";
echo "<tr><th>Item#</th> <th>Item Name</th> <th>Quantity</th> <th>Price Per Unit</th></tr>";

while($row = mysqli_fetch_array($result1, MYSQLI_BOTH)) {
    echo "<tr>";
    echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[quantity]</td> <td>&#36;$row[price]</td>";
    echo "</tr>";
}

echo "</table>";
echo "<br>";
echo "<hr>";

$query2 = "SELECT * FROM onlineinv; ";
$result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));

echo "<p><h1>Online Inventory</h1></p>";
echo "<table style='width:70%'>";
echo "<tr><th>Item#</th> <th>Item Name</th> <th>Quantity</th> <th>Price Per Unit</th></tr>";

while($row = mysqli_fetch_array($result2, MYSQLI_BOTH)) {
    echo "<tr>";
    echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[quantity]</td> <td>&#36;$row[price]</td>";
    echo "</tr>";
}

echo "</table>";
echo "<br>";
echo "<hr>";

$query3 = "SELECT * FROM allitems; ";
$result3 = mysqli_query($conn, $query3) or die(mysqli_error($conn));

echo "<p><h1>All The Items</h1></p>";
echo "<table style='width:70%'>";
echo "<tr><th>Item#</th> <th>Item Name</th> <th>Description</th></tr>";

while($row = mysqli_fetch_array($result3, MYSQLI_BOTH)) {
    echo "<tr>";
    echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[description]</td>";
    echo "</tr>";
}

echo "</table>";
echo "</pre>";

mysqli_free_result($result);


echo "</pre>";

mysqli_free_result($result1);
mysqli_free_result($result2);
mysqli_close($conn);
?>



</body>
</html>