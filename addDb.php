<?php 
	require 'parking.php';
	$park= new Parking;
	$park->setPlace($_REQUEST['place']);
	$park->setTimeStart($_REQUEST['time']['start']);
	$park->setTimeEnd($_REQUEST['time']['end']);
	$park->setLocation($_REQUEST['location']);
	$park->setPrice($_REQUEST['place']);
	echo $park->insertPark();

 ?>