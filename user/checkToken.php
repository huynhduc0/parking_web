<?php
$token = $_GET["token"];
require("jwt.php");
$json = JWT::decode($token, "DUNG_CHO_AI_BIET_NHA", true);
echo json_encode($json);
?>
