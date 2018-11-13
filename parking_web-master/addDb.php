<?php 
	require 'parking.php';
	$park= new Parking;
	$park->setPlace($_REQUEST['place']);
	$park->setTime($_REQUEST['time']['start'].'-'.$_REQUEST['time']['end']);
	$park->setLocation($_REQUEST['location']);
	$park->setPrice($_REQUEST['place']);
	echo $park->insertPark();

 ?>