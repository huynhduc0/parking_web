<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Maps</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
	<script type="text/javascript" src="map.js"></script>
	<link rel="stylesheet" href="../css/style.css"/>
	<link rel="stylesheet" href="../css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/owl.carousel.css"/>
	<link rel="stylesheet" href="../css/style.css"/>
	<script >
	jQuery(document).ready(function($) {
		var token;
		<?php 
		session_start();
		if(isset($_SESSION['token']))
			echo'token='.$_SESSION['token'];
		 ?>	
		 console.log(token.token);
		 	if(token.token!='ERROR'){
			    $.getJSON( "../User/decryptToken.php?token="+token.token,
			      function (returndata) {
			        console.log(returndata);
			         $('#DN').html(returndata[0].FullName);
			      });
			  }
			  else{
			    alert('Đăng nhập đi con giời');
			  }
		
	});
</script>
</head>
<body>
		<header class="header-section">
			<div class="maphome">
				<div class="row navbar">
					<div class="col-lg-3 col-md-3">
						<div class="site-logo">
							<img src="../img/icon.png" alt="">
						<div class="nav-switch">
							<i class="fa fa-bars"></i>
						</div>
					</div>
					</div>
					<div class="col-lg-9 col-md-9">
						<a id="DN" data-toggle="modal" data-target="#modal-1" class="site-btn header-btn">ĐĂNG NHẬP</a>
						<nav class="main-menu">
							<ul>
								<li><a href="index.html">TRANG CHỦ</a></li>
								<li><a href="#">THÀNH PHỐ HỖ TRỢ</a></li>
								<li><a href="#">LỢI ÍCH</a></li>
								<li><a href="#">SẢN PHẨM</a></li>
								<li><a href="insert.php">Cho thuê vị trí</a></li>
							</ul>
						</nav>
					</div>
				</div>
			</div>	
	</header>
			<div class="modal fade" id="modal-1" >
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
								<span class="sr-only">Close</span>
							</button>
							<h4 class="modal-title">Đăng nhập cái nhẹ nà</h4>
						</div>
						<div class="modal-body">
							
														
							<section class="login-block">
							    <div class="container">
								<div class="row">
									<div class="col-md-12 login-sec">
									    <h2 class="text-center">Login Now</h2>
									    <div class="login-form">
							  <div class="form-group">
							    <label for="exampleInputEmail1" class="text-uppercase">Username</label>
							    <input id="username" type="text" class="form-control" placeholder="">
							    
							  </div>
							  <div class="form-group">
							    <label for="exampleInputPassword1" class="text-uppercase">Password</label>
							    <input id="password" type="password" class="form-control" placeholder="">
							  </div>
							  
							  
							    <div class="form-check">
							    <label class="form-check-label">
							      <input type="checkbox" class="form-check-input">
							      <small>Remember Me</small>
							    </label>
							    <button type="submit" class="btn btn-login float-right" onclick="login()">Submit</button>
							  </div>
							  </div>
							</div>
						</div>
					</div>
				</section>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save changes</button>
						</div>
					</div><!-- /.modal-content -->
				</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
		<?php 
			require 'parking.php';
			$list= new Parking;
			$data=$list->getListParkByLatLng();
			$scr=json_encode($data,true); 
			echo '<div id="list" style="display:none"> '.$scr.'</div>'
		 ?>

		  	<div class="container-fluid">
		  		<div class="row">
		  			<div class="col-lg-4">	
		  				
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <i class="fglyphicon glyphicon-search"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col">
                                        <input class="form-control form-control-lg form-control-borderless" type="search" id="searchkey" placeholder="Tìm địa điểm">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-outline-primary" onclick='search()'>Search</button>
                                    </div>
                                    <!--end of col-->
                                  
                                </div>
                          <div id="listSearch">
                                 
                                    </div>
                                    <div id="lastSelect" class="d-none">
                                    	
                                    </div>
		  			</div>
					<div class="col-lg-8">
						<div id="map" style="width: 98%; height: 640px;">
					</div>
					</div>
				</div>
		  	</div>
		  	</div>

		 
	<div class="d-none">
		<div id="form">
            <form role="form" action="order.php" method="POST">
              <div class="form-group">
                <label for="local">Vị trí</label>
                <input type="text" class="form-control" id="local">
              </div>
              <div class="form-group">
                <label id="time"></label>
              </div>
              <div class="form-group">
                <label for="fee">Giá</label>
                <input type="text" class="form-control" id="fee">
              </div>
               <button type="button" id="direction" class="btn btn-default">Chỉ đường</button>
              <button type="submit" class="btn btn-default">Thuê</button>
            </form>    
        </div>
	</div>
	
	
</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdqZALzdBcHhHyQm64AQ3GtlvkuOctElo&callback=initMap"></script>
</html>
