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
    <title>Update Online items</title>
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
<h3>Update Store Items</h3>
<?php
echo '<pre>';

echo "Changing item #: ";
$item_num = trim($_POST['item_num']);
echo $item_num;
echo "\n";
echo "Now at quantity: ";
$newq = trim($_POST['newq']);
echo $newq;
echo "\n";

$query1 = "UPDATE onlineinv SET quantity = ? WHERE item_num = ?; ";
$stmt1 = mysqli_prepare($conn, $query1);
mysqli_stmt_bind_param($stmt1, "ii", $newq, $item_num);
mysqli_stmt_execute($stmt1);
mysqli_stmt_close($stmt1);

$query2 = "SELECT * FROM onlineinv; ";
$result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));

$query3 = "UPDATE onlineinv SET quantity = ? WHERE item_num = ?; ";
$stmt3 = mysqli_prepare($conn, $query3);
mysqli_stmt_bind_param($stmt3, "ii", $newq, $item_num);
mysqli_stmt_execute($stmt3);
mysqli_stmt_close($stmt3);

echo "<p><h1>Updated Online Inventory</h1></p>";
echo "<table style='width:70%'>";
echo "<tr><th>Item#</th> <th>Item Name</th> <th>Quantity</th> <th>Price Per Unit</th></tr>";

while($row = mysqli_fetch_array($result2, MYSQLI_BOTH)) {
    echo "<tr>";
    echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[quantity]</td> <td>&#36;$row[price]</td>";
    echo "</tr>";
}

echo "</table>";

mysqli_free_result($result2);
mysqli_close($conn);


echo '</pre>';
?>


</body>
</html>