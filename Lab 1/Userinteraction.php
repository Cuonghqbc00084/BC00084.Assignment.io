<form action="helloworld3.php" method="post">
        <input type="text" name="name">
        <input type="text" name="sothich">
        <input type="submit" value="Submit" name="submit">
</form>

<?php
    if(isset($POST['submit'])&&$_POST['submit']){
    $name=$_POST['name'];
    $sothich=$_POST['sothich'];
    echo '<table>
    <tr><td>Tôi tên là</td><td>:</td><td>'.$name.'</td></tr>
    <tr><td>Sở thích </td><td>:</td><td>'.$sothich.'</td></tr>
    </table>';
    }
?>