<?php 
	require 'parking.php';
	$park= new Parking;
	$data=$park->search($_REQUEST['key']);
	echo json_encode($data);

 ?>