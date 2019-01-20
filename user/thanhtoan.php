<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>THÀNH CÔNG</title>
	
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12">	
	<div class="alert alert-success" role="alert">
		<strong>			
			<?php 
  require 'user.php';
  $User= new User;
 $User->successOrder($_GET['id'])
  ?>

		</strong> Cho đơn hàng này
	</div>
</div>
</div>
<script >
	alert('Thanh toán thành công!')
</script>
	
</body>
</html>
