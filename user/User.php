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
$qr = " SELECT * FROM user
        WHERE Username=$this->UserName
        AND   Password="+md5($this->Password)+"
      ";
      echo $qr;
$user = $this->conn->query($qr);
  if ($user->num_rows == 1) {
  //login dung
  $u = mysql_fetch_array($users);
  $jsonwebtoken = JWT::encode($u, "DUNG_CHO_AI_BIET_NHA");
  return JsonHelper::getJson("token", $jsonwebtoken);
}
else{
  // login sai
  return '{"token":"ERROR"}';
}
}
}
 ?>