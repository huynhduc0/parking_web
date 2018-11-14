<?php 
	class Parking 
	{
	    /**
	     * summary
	     */
	    private $id;
		private $place;
		private $host;
		private $timeStart;
		private $timeEnd;
		private $location;
		private $price;
		private $conn;
		private $tableName="listpark";

		function setId($id) { $this->id = $id; }
		function getId() { return $this->id; }
		function setPlace($place) { $this->place = $place; }
		function getPlace() { return $this->place; }
		function setHost($host) { $this->host = $host; }
		function getHost() { return $this->host; }
		function setTimeStart($timeStart) { $this->timeStart = $timeStart; }
		function getTimeStart() { return $this->timeStart; }
		function getTimeEnd() { return $this->timeEnd; }
		function setTimeEnd($timeEnd) { $this->timeEnd = $timeEnd; }
		function setLocation($location) { $this->location = $location; }
		function getLocation() { return $this->location; }
		function setPrice($price) { $this->price = $price; }
		function getPrice() { return $this->price; }

	    public function __construct()
	    {
	     	require 'connection.php';   
	     	$conne = new DB_connect;
	     	$this->conn = $conne->connect(); 
	    }
	    function getListParkByLatLng()
	    {
	    	$sql = "SELECT * FROM $this->tableName";
	    	$result= $this->conn->query($sql);
	    	$data = array();
	    	while ($res=$result->fetch_assoc())
	    		$data[]=$res;
	    	return $data;
	    }
	    public function insertPark()
	    {
	    	$sql="INSERT INTO $this->tableName value('','$this->place','','$this->timeStart','$this->timeEnd','$this->location','$this->price')";
	    	if($this->conn->query($sql)){
	    		echo 'success';
	    	}
	    	else{
	    		echo 'error -_-';
	    	}
	    }
	    function search($placeSeach)
	    {
	    	$sql="SELECT * FROM $this->tableName WHERE MATCH (place) AGAINST ('$placeSeach' IN NATURAL LANGUAGE MODE)";
	    	$result= $this->conn->query($sql);
	    	$data = array();
	    	while ($res=$result->fetch_assoc())
	    		$data[]=$res;
	    	return $data;
	    }
	}
 ?>
  