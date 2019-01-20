<?php 
session_start();
// echo $_SESSION['token'];
// var_dump($_POST);
$conn = new mysqli('localhost', 'root','','parking');
  mysqli_set_charset($conn, 'UTF8');
 if ($conn->connect_error) {
    die("Failed to connect: " . $conn->connect_error);
};
$token= json_decode($_SESSION['token'],true);
ini_set("allow_url_fopen", 1);
$json = file_get_contents('http://localhost/parking_web/user/decryptToken.php?token='.$token['token']);
$obj = json_decode($json);
// var_dump($obj);
$timestamp = strtotime($_POST['start']) + $_POST['lengthTime']*60*60;
$time = date('H:i', $timestamp);
$sql="insert into `order` values('','".$_POST['start']."','".$time."','".$obj[0]->UserID."','".$_POST['idplace']."','".$_POST['bsx']."',1)";
echo $sql;
if ($conn->query($sql) === TRUE) {
              header('Location:index.php');
            } else {
              echo '<div class="alert alert-danger mt-1" role="alert">Failed</div>';

        }
 ?>