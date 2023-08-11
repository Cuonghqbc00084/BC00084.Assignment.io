<?php
    $host = "localhost";
    $username = "root";
    $password = "";
    $database = "lego_manage";

    $conn = mysqli_connect($host, $username, $password, $database);

    if($conn -> connect_error){
        die("Connect Database server failed!" . $conn->connect_error);
    }
    // echo "Connected successfully";
?>      



