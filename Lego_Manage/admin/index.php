<?php
    session_start();

    if(!isset($_SESSION['adminAcc']))
        header("Location: Login.php");
    else{
        $AdminName = $_SESSION['adminAcc']['admin_fullname'];
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page</title>
    <link rel="stylesheet" href="CSS/MenuStyles.css">
</head>

<body>
    <div class="header">
        <div class="admin-info">
            <?php
                echo "Welcome " .  $AdminName;
            ?>
            <a class="logout-button" href="Logout.php">Logout</a>
        </div>
    </div>

    <!-- Menu -->
    <div class="menu">
        <ul>
            <li><a href="index.php?page=ListProduct">List Product</a></li>
            <li><a href="#">List User</a></li>
            <li><a href="#">List Feedback</a></li>
            <li><a href="#">List Invoice</a></li>
        </ul>
    </div>

    <!-- Content -->
    <div class="content">
        <?php
            if(isset($_GET['page'])){
                if($_GET['page'] === "AddProduct")
                    require_once ("AddNewProduct.php");
                else if($_GET['page'] === "ListProduct")
                    require_once ("ListProduct.php");
                else if($_GET['page'] === "ModifyProduct")
                    require_once ("ModifyProduct.php");
                else if($_GET['page'] === "DeleteProduct")
                    require_once ("DeleteProduct.php");
                else if($_GET['page'] === "ListUser")
                    require_once ("ListUser.php");
                else if($_GET['page'] === "ModifyUser")
                    require_once ("ModifyUser.php");
                else if($_GET['page'] === "DeleteUser")
                    require_once ("DeleteUser.php");
                else if($_GET['page'] === "ListFeedback")
                    require_once ("ListFeedback.php");
                else if($_GET['page'] === "DeleteFeedback")
                    require_once ("DeleteFeedback.php");
            }
            else
                echo "<marquee direction='right' scrolldelay='80'>Welcome to Administrator website</marquee>";
        ?>
    </div>  
</body>

</html>
            