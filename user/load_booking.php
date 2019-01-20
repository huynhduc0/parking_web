<?php 
	require 'user.php';
  $User= new User;
  $User->getBooking($_GET['token']);
 ?>