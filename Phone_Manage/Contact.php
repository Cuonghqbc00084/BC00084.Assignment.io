<?php
    $info = "";
    $namedb = "";
    $emaildb = "";
    if(isset($_SESSION['user'])){
        $namedb = $_SESSION['user']['user_fullname'];
        $emaildb = $_SESSION['user']['user_email'];
    }

    if(isset($_POST['submitBtn'])){
        require_once ("admin/DatabaseConnect.php");
        $name = $_POST['name'];
        $email = $_POST['email'];
        $title = $_POST['title'];
        $message = $_POST['message'];

        $sql = "INSERT INTO contact(contact_name, contact_email, contact_title, contact_message)
        VALUES ('$name' , '$email' , '$title' , '$message')";
        if($conn -> query($sql)){
            $info = "Submit feedback successful.";
        }
    }
?>  
    
<!DOCTYPE html>
<html>
<head>
    <title>Contact Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 0;
            padding: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #4285f4;
            color: #fff;
            text-align: center;
            padding: 10px 0;
        }

        td {
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        input[type="text"],
        input[type="email"],
        textarea {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        textarea {
            resize: vertical;
        }

        input[type="submit"] {
            background-color: #4285f4;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #2d4373;
        }
    </style>
</head>
<body>
    <h1 style="text-align: center">OUR CONTACT</h1>
    <table>
        <tr>
            <td>Address:</td>
            <td>KP Phước Thành Lập, Thị trấn Gò Quao, Kiên Giang</td>
        </tr>
        <tr>
            <td>Phone:</td>
            <td>+84 462138987</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>btecfptct@gmail.com</td>
        </tr>
    </table>

    <form action="" method="post" onsubmit="return checkContact()">
        <h1 style="text-align: center">YOUR FEEDBACK</h1>
        <table>
            <tr>
                <td>Your name:</td>
                <td><input type="text" name="name" id="name" value="<?php echo $namedb; ?>"></td>
            </tr>
            <tr>
                <td>Email:</td>
                <td><input type="email" name="email" id="email" value="<?php echo $emaildb; ?>"></td>
            </tr>
            <tr>
                <td>Title:</td>
                <td><input type="text" name="title" id="title"></td>
            </tr>
            <tr>
                <td>Message:</td>
                <td><textarea name="message" id="message" cols="45" rows="5"></textarea></td>
            </tr>
            <tr style="text-align: center">
                <td colspan="2">
                    <input type="submit" value="Submit" name="submitBtn" id="submitBtn">
                </td>
            </tr>
        </table>
    </form>

    <?php echo "<i><b>".$info."</b></i>"; ?>
</body>
</html>
