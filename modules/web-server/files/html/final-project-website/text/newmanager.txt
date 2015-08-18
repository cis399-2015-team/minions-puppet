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
    <title>Manager Added</title>
</head>
<center><h2>Manager Added</h2></center>
<hr>
<body>
<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <ul class="nav nav-pills">
            <li role="presentation"><a href="employeehome.html">Home</a></li>
            <li role="presentation"><a href="viewschedule.php">View Current Schedule</a></li>
            <li role="presentation"><a href="updateschedule.html">Update Schedule</a></li>
            <li role="presentation" class="active"><a href="newemployee.html">Add a New Employee</a></li>
            <li role="presentation"><a href="viewinventories.php">View Store & Online Inventories</a></li>
            <li role="presentation"><a href="updatestore.html">Update Inventory</a></li>
        </ul>
    </div>
</nav>
<p>Manager Added: </p>

<?php
echo '<pre>';
    $ssn = trim($_POST['mssn']);
    print $ssn;
    print ", ";

    $fname = trim($_POST['mfname']);
    print $fname;
    print ", ";

    $lname = trim($_POST['mlname']);
    print $lname;
    print ", ";

    $shiftid = trim($_POST['mshiftid']);
    print $shiftid;
    print ".";
    print "\n";

    $query1 = "INSERT INTO managers (ssn, fname, lname) VALUES ($ssn, '".$fname."', '".$lname."'); ";
    $stmt1 = mysqli_prepare($conn, $query1);
    mysqli_stmt_bind_param($stmt1, "issi", $ssn, $fname, $lname, $shiftid);
    mysqli_stmt_execute($stmt1);
    mysqli_stmt_close($stmt1);

    $query2 = "INSERT INTO payroll (ssn, wage) VALUES (?, 12.50); ";
    $stmt2 = mysqli_prepare($conn, $query2);
    mysqli_stmt_bind_param($stmt2, "i", $ssn);
    mysqli_stmt_execute($stmt2);
    mysqli_stmt_close($stmt2);


echo '</pre>';

mysqli_close($conn);
?>

</body>
</html>