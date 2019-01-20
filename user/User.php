<?php 
class User 
	{
	 
private $UserID;
private $UserName;
private $Password;
private $Avatar;
private $PhoneNumber;
private $FullName;
private $Balance;
private $conn;
private $tableName="user";
function setUserID($UserID) { $this->UserID = $UserID; }
function getUserID() { return $this->UserID; }
function setUserName($UserName) { $this->UserName = $UserName; }
function getUserName() { return $this->UserName; }
function setPassword($Password) { $this->Password = $Password; }
function getPassword() { return $this->Password; }
function setAvatar($Avatar) { $this->Avatar = $Avatar; }
function getAvatar() { return $this->Avatar; }
function setPhoneNumber($PhoneNumber) { $this->PhoneNumber = $PhoneNumber; }
function getPhoneNumber() { return $this->PhoneNumber; }
function setFullName($FullName) { $this->FullName = $FullName; }
function getFullName() { return $this->FullName; }
function setBalance($Balance) { $this->Balance = $Balance; }
function getBalance() { return $this->Balance; }

 public function __construct()
	    {
	     	require '../home/connection.php';   
	     	$conne = new DB_connect;
	     	$this->conn = $conne->connect(); 
	    }

public function createToken()
{
require("jwt.php");
 // thuc te: Nho escapte tranh Injection
$sql = 'SELECT * FROM user
        WHERE Username="'.$this->UserName.'"
        AND   Password="'.md5($this->Password).'"';
      $result = $this->conn->query($sql);
      // echo $sql;
        if ($result->num_rows > 0) { 
  			$data=array();
  			 while($row = $result->fetch_assoc()) {
                       $data[]=$row;
                   }
  			$jsonwebtoken = JWT::encode($data, "DUNG_CHO_AI_BIET_NHA");
  			return JsonHelper::getJson("token", $jsonwebtoken);
		}
else{
  // login sai
  return '{"token":"ERROR"}';
}

}
function successOrder($id)
{
  $sql="UPDATE `order` set status=0 where id=".$id;
  if ($this->conn->query($sql) === TRUE) {
    echo "Thanh toán thành công";
} else {
    echo "Có lỗi: " . $conn->error;
}
}
function getBooking($token)
{
  require("jwt.php");
$json = JWT::decode($token, "DUNG_CHO_AI_BIET_NHA", true);
$sql= "SELECT order.id, order.TimeIn, order.TimeOut, order.MarineNumber,order.placeID, listpark.place, listpark.location FROM `User` JOIN `order` on order.UserID= user.UserID
                            JOIN `listpark` on listpark.id=order.placeID
 where status=1 and Order.UserID=".$json[0]->UserID;
// echo $sql;
$result = $this->conn->query($sql);
        if ($result->num_rows > 0) { 
        $data=array();
         while($row = $result->fetch_assoc()) {
                       $data[]=$row;
                   }
// $json[0]->UserID);
}
  echo json_encode($data,true);
}
}
 ?>