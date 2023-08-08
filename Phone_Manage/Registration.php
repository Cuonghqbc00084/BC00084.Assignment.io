<?php
    if(isset($_POST['registrationBtn'])){
        require_once "admin/DatabaseConnect.php";
        
        $fullname = $_POST['fullname'];
        $email = $_POST['email'];
        $password = $_POST['password'];
        $address = $_POST['address'];
        $phonenumber = $_POST['phonenumber'];

        $sql = "INSERT INTO user(user_fullname, user_email, user_password, user_address, user_phonenumber)
                VALUES('$fullname', '$email', md5('$password'), '$address', '$phonenumber')";
        $result = $conn -> query($sql);

        if($result){
            header("Location: Login.php");
            
        }
        else
        echo "Can't access the login page!";
    }


    
?>





<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
</head>
<body>
    <form action="" method="POST" onsubmit="return checkUserRegistration()">
    <table border="0" cellpadding="10" cellspacing="0" align="center" width="400">
        <tr>
            <td colspan="2" align="center">
                <h2>User Registration</h2>
            </td>
        </tr>
        <tr>
            <td>Full name</td>
            <td><input type="text" name="fullname"></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="email" name="email"></td>
        </tr>
        <tr>
            <td>Phone number</td>
            <td><input type="text" name="phonenumber"></td>
        </tr>
        <tr>
            <td>Password</td>
            <td><input type="password" name="password"></td>
        </tr>
        <tr>
            <td>Retype password</td>
            <td><input type="password" name="password2"></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><input type="text" name="address"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
            <input type="submit" value="Registration" name="registrationBtn" style="background-color: #4CAF50; color: #fff;"></td>
        </tr>
    </table>
    </form>
</body>
</html>




