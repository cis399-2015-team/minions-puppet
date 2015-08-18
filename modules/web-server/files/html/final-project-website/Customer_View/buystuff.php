<?php
    include('custConnectionData.txt');
    $conn = mysqli_connect($server, $user, $pass, $dbname, $port)
    or die('Error connecting to MySQL server.');
?>
<html>
<head>
    <!-- Latest compiled and minified CSS for bootstrap from Max CDN-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">
    <!-- Link to my own stylesheet -->
    <link rel="stylesheet" type="text/css" href="customerview.css">
    <title>Buy Our Stuff!</title>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <ul class="nav nav-pills">
            <li role="presentation"><a href="customerhome.html">Home</a></li>
            <li role="presentation"><a href="vieworigins.php">View Bean Origins</a></li>
            <li role="presentation" class="active"><a href="buystuff.php">Buy Stuff</a></li>
        </ul>
    </div>
</nav>
<h2>Stuff We Have for Sale Online</h2>
<?php
echo '<pre>';
    $query1 = "SELECT onlineinv.item_num, onlineinv.item_name, onlineinv.quantity, allitems.description, onlineinv.price FROM onlineinv JOIN allitems USING (item_num) WHERE quantity > 0; ";

    $result1 = mysqli_query($conn, $query1) or die(mysqli_error($conn));

    echo "<table style='width:70%'>";
    echo "<tr><th>Item#</th> <th>Item Name</th> <th>#Available</th> <th>Description</th> <th>Price Per Unit</th></tr>";

    while($row = mysqli_fetch_array($result1, MYSQLI_BOTH)) {
        echo "<tr>";
        echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[quantity]</td> <td>$row[description]</tc> <td>&#36;$row[price]</td>";
        echo "</tr>";
    }
    echo "</table>";

    echo "<h2>Stuff Currently Out of Stock</h2>";
    $query2 = "SELECT item_num, item_name, quantity, price FROM onlineinv WHERE quantity = 0; ";
    $result2 = mysqli_query($conn, $query2) or die(mysqli_error($conn));

    echo "<table style='width:70%'>";
    echo "<tr><th>Item#</th> <th>Item Name</th> <th>#Available</th> <th>Price Per Unit</th></tr>";

    while($row = mysqli_fetch_array($result2, MYSQLI_BOTH)) {
        echo "<tr>";
        echo "<td>$row[item_num]</td> <td>$row[item_name]</td> <td>$row[quantity]</td> <td>&#36;$row[price]</td>";
        echo "</tr>";
    }
    echo "</table>";

echo '</pre>';
?>

<h2>Order From Us!</h2>
<pre>
<p>Enter the item number and quantity of the item you wish to buy</p>
<form action="stuffbought.php" method="POST">
    Item# (As Shown above): <input type="text" name="item_num" placeholder="Item Number" required><br>
    Quantity:               <input type="text" name="want" placeholder="quantity" required><br>
    <br>
    <b>Your Information:</b> <br>
    First Name: <input type="text" name="fname" placeholder="first name" required><br>
    Last Name:  <input type="text" name="lname" placeholder="last name" required><br>
    Address1:   <input type="text" name="addr1" placeholder="address line 1" required><br>
    Address2:   <input type="text" name="addr2" placeholder="address line 2"><br>
    City:       <input type="text" name="city" placeholder="city" required><br>
    State:      <input type="text" name="state" placeholder="state" required><br>
    Zipcode:    <input type="text" name="zipcode" placeholder="zipcode" required><br>
    </pre>
    <input type="submit" value="submit">
    <input type="reset" value="reset">
</form>

<?php
mysqli_free_result($result1);
mysqli_free_result($result2);
mysqli_close($conn);
?>

</body>
</html>