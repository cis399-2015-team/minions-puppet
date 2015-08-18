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
    <title>Bean Origins</title>
</head>

<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <ul class="nav nav-pills">
            <li role="presentation"><a href="customerhome.html">Home</a></li>
            <li role="presentation" class="active"><a href="vieworigins.php">View Bean Origins</a></li>
            <li role="presentation"><a href="buystuff.php">Buy Stuff</a></li>
        </ul>
    </div>
</nav>
<h3>About Our Beans</h3>
<?php
echo '<pre>';
    $query1 = "SELECT roast_name, roaster_name, origin, description FROM roasts; ";

    $result1 = mysqli_query($conn, $query1) or die(mysqli_error($conn));

    echo "<table style='width:70%'>";
    echo "<tr><th>Roaster Name</th> <th>Roast Name</th> <th>Origin</th> <th>Description</th></tr>";

    while($row = mysqli_fetch_array($result1, MYSQLI_BOTH)) {
        echo "<tr>";
        echo "<td>$row[roaster_name]</td> <td>$row[roast_name]</td> <td>$row[origin]</td> <td>$row[description]</td>";
        echo "</tr>";
    }
    echo "</table>";

echo '</pre>';

mysqli_free_result($result);
mysqli_close($conn);
?>

</body>
</html>