<html>
    <table width="100%" border="1" style="border-collapse:collapse">
    <div class="row">
               <div class="col-sm-12">
                  <h1 class="product_taital">Our Products</h1>
               </div>
            </div>


        <?php
            require_once ("admin/DatabaseConnect.php");
            $sql = "SELECT * FROM product";
            $result = $conn -> query($sql);
            $i = 0;
            while($row = mysqli_fetch_assoc($result)){
                if($i % 3 == 0)
                    echo "<tr>";
                        echo "<td width='33%'><a href='index.php?page=ProductDetail&id={$row['product_id']}'>
                                <center>
                                    <b>{$row['product_name']}</b><br/>
                                    <img src=\"admin/{$row['product_image']}\" height='100px'><br/>
                                    "?> <?php echo number_format($row['product_price'],0) ?> <?php echo "VND
                                </center></a>
                            </td>";
                if($i % 3 == 2)
                    echo "</tr>";
                $i++;
            }
            if($i % 3 != 0)
                    echo "</tr>";
        ?>
    </table>
    <div class="about_section layout_padding">
         <div class="container">
            <div class="about_section_main">
               <div class="row">
                  <div class="col-md-6">
                     <div class="about_taital_main">
                        <h1 class="about_taital">About Our beauty sotore</h1>
                        <p class="about_text">Welcome</p>
                        <div class="readmore_bt"><a href="#">Read More</a></div>
                     </div>
                  </div>
                  <div class="col-md-6">
                     <div><img src="images/about-img.png" class="image_3"></div>
                  </div>
               </div>
            </div>
         </div>
      </div>
</html>