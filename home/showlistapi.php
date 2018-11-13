<?php  
			require 'parking.php';
			$list= new Parking;
			$data=$list->getListParkByLatLng();
			$scr=json_encode($data,true); 
			echo $scr;
		 

 ?>