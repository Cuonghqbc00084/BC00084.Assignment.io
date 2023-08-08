<?php
    session_start();

    if(isset($_POST['btnLogin'])){
        require_once "DatabaseConnect.php";
        
        $username = $_POST['username'];
        $password = $_POST['password']; 

        $sql = "SELECT * FROM adminaccount WHERE admin_username='$username' AND admin_password=MD5(MD5('$password'))";
        $result = $conn -> query($sql);
     
        if(mysqli_num_rows($result) == 1){
            $row = mysqli_fetch_assoc($result);
            $_SESSION['adminAcc'] = $row;
            header("Location: index.php");
        }
        else
            echo "Login failed!";
    }
?>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin login</title>
    <link rel="stylesheet" href="CSS/Product_Manage_Style.css">
    <script src="JS/Product_Manage_Script.js"></script>
</head>
<body>
    <form action="" method="POST" onsubmit="return checkLoginForm()">
        <div class="login-form">
            <h2 class="login-header">ADMINISTRATOR</h2>
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter password" required>
            </div>
            <div class="form-group">
                <input class="btn" type="submit" value="Login" name="btnLogin">
            </div>
        </div>
    </form>
</body>
</html>