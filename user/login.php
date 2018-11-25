<?php 
  require 'user.php';
  $User= new User;
  $User->setUserName($_REQUEST['username']);
  $User->setPassword($_REQUEST['password']);
  session_start();
  $_SESSION['token']=$User->createToken();
  echo $_SESSION['token'];
 ?>