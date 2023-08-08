<!DOCTYPE html>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="CSS/Proudct.css">

</head>
<body>
    <table>
        <tr>
            <th colspan="3"><b>Product</b></th>
        </tr>

        <?php
            require_once("admin/DatabaseConnect.php");
            $sql = "SELECT * FROM product";
            $result = $conn->query($sql);
            $i = 0;
            while ($row = mysqli_fetch_assoc($result)) {
                if ($i % 3 == 0)
                    echo "<tr>";

                echo "<td width='33%'>
                        <a href='index.php?page=ProductDetail&id={$row['product_id']}'>
                            <b>{$row['product_name']}</b><br/>
                            <img src=\"admin/{$row['product_image']}\" alt='{$row['product_name']}'><br/>
                            " . number_format($row['product_price'], 0) . " VND
                        </a>
                        <br/>
                        <a href='index.php?page=Cart&action=add&id={$row['product_id']}'>
                            <button class='add-to-cart-btn'>Add to Cart</button>
                        </a>
                    </td>";

                if ($i % 3 == 2)
                    echo "</tr>";

                $i++;
            }

            if ($i % 3 != 0)
                echo "</tr>";
        ?>
    
    </table>
</body>
</html>
