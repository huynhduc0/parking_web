<?php 
/**
 * summary
 */
class DB_connect
{
    /**
     * summary
     */

    public function connect(){
    	  $conn = new mysqli('localhost', 'root','','parking');
                mysqli_set_charset($conn, 'UTF8');
                if ($conn->connect_error) {
                    die("Failed to connect: " . $conn->connect_error);
                } 
    	return $conn;
    }
   

    
}          
 ?>