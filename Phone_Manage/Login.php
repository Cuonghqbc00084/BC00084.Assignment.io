<?php
//    session_start();

    if(isset($_POST['btnLogin'])){
        require_once ("admin/DatabaseConnect.php");
        
        $username = $_POST['username'];
        $password = $_POST['password'];

        $sql = "SELECT * FROM user WHERE user_email='$username' AND user_password= MD5('$password') AND user_status=1";
        $result = $conn -> query($sql);
     
        if(mysqli_num_rows($result) == 1){
            $row = mysqli_fetch_assoc($result);
            $_SESSION['user'] = $row;
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
    <title>User login</title>
    <!-- <link rel="stylesheet" href="CSS/Style.css"> -->
    <link rel="stylesheet" href="CSS/Style.css">
    <script src="admin/JS/Product_Manage_Script.js"></script>
    <style>
 body {
    font-family: Arial, sans-serif;
    background-color: #f2f2f2;
    margin: 0;
    padding: 0;
}

.login-container {
    max-width: 400px;
    margin: 100px auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.login-header {
    text-align: center;
    color: #333;
    font-size: 24px;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-size: 16px;
    color: #333;
    margin-bottom: 5px;
}
    
.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 16px;
}

.form-group input[type="checkbox"] {
    margin-right: 5px;
}

.btn {
    background-color: #4CAF50;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
    width: 100%;
}

.btn:hover {
    background-color: #45a049;
}

    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="login-header">USER LOGIN</h2>
        <form action="" method="POST" onsubmit="return checkLoginForm()">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter username">
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter password">
            </div>
            <div class="form-group">
                <input class="btn" type="submit" value="Login" name="btnLogin">
            </div>
        </form>
    </div>
</body>


</html>




