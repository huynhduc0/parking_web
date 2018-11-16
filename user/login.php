<?php 
  require 'user.php';
  $User= new User;
  $User->setUserName($_POST['username']);
  $User->setPassword($_POST['password']);
  echo $User->userName;
  die();
  echo $User->createToken();
 ?>