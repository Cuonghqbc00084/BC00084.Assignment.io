<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Modern Website</title>
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Proudct.css">
    <script src="js/JSscript.js"></script>
</head>

<body>
<header style="text-align: center; padding: 20px 0;">
    <img src="images/logolego.png" alt="Logo Phone" height="100">
</header>

    <nav>
        <ul>
            <li><a href="index.php?page=Home">Home</a></li>
            <li><a href="index.php?page=Introduction">Introduction</a></li>
            <li><a href="index.php?page=Product">Product</a></li>
            <li><a href="index.php?page=Contact">Contact</a></li>

            <?php
                // Thêm phần kiểm tra đăng nhập ở đây
             
                if (isset($_SESSION['user'])) {
                    echo '<li><a href="index.php?page=Cart">Cart</a></li>';
                    echo '<li><a href="Logout.php">Logout</a></li>';
                } else {
                    echo '<li><a href="index.php?page=Login">Login</a></li>';
                    echo '<li><a href="index.php?page=Registration">Registration</a></li>';
                }
            ?>
        </ul>
    </nav>
                
    <main>
        <?php
            if (isset($_GET['page'])) {
                if ($_GET['page'] === "Introduction")
                    require_once("Introduction.html");
                else if ($_GET['page'] === "Registration")
                    require_once("Registration.php");
                else if ($_GET['page'] === "Product")
                    require_once("Product.php");
                else if ($_GET['page'] === "ProductDetail")
                    require_once("ProductDetail.php");
                else if ($_GET['page'] === "Login")
                    require_once("Login.php");
                else if ($_GET['page'] === "Cart")
                    require_once("Cart.php");
                else if ($_GET['page'] === "Contact")
                    require_once("Contact.php");
                else if ($_GET['page'] === "Home")
                    require_once("Home.php");
            } else {
                require_once("Product.php");
            }
        ?>
    </main>

    <footer>
    <p>Contact us: 123 Đường ABC, Quận XYZ, Thành phố HCM</p>
    <p>Phone: 0123 456 789</p>
    <p>Email: contact@example.com</p>
    <p>Follow us on social media:
        <a href="https://www.facebook.com/your_facebook_page" class="social-button" target="_blank">
            <img src="images/fb.png" alt="Facebook" height="20px">
        </a>
    </p>
    <p>© 2023 My Website. All rights reserved.</p>
    </footer>

</body>
</html>




