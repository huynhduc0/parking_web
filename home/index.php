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
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	 <script src="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>
<link href="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet"/>
<script >
	jQuery(document).ready(function($) {
		var token={token:"ERROR"};
		<?php 
		session_start();
		if(isset($_SESSION['token']))
			echo'token='.$_SESSION['token'];
		 ?>	
		 $('#token').val(token.token);
		 	if(token.token!='ERROR'){
			    $.getJSON( "../User/decryptToken.php?token="+token.token,
			      function (returndata) {
			        console.log(returndata);
			         $('#DN').html(returndata[0].FullName);
			           $('#sub').prop('disabled', false);
			           $('#booking').removeClass('d-none');
			           $.getJSON('../user/load_booking.php?token='+token.token, function(returndata) {
			           		/*optional stuff to do after success */
			           			$('#list_book').html('');
			           		returndata.map(function(elem) {
			           			$('#list_book').append('<a class="dropdown-item" style="color: red" onclick="findPlaceViaPlaceID('+elem.placeID+')" href="#">'+elem.place+ " <br>  <p>từ " + elem.TimeIn+' đến '+elem.TimeOut+'<br><img style="width:120px" class="img-responsive" src="https://chart.googleapis.com/chart?chs=300x300&cht=qr&chl=http://192.168.1.98/parking_web/user/thanhtoan.php/?id='+elem.id+'" title="Đưa QR để xác nhận" />'+'</p></a>');

			           		})
			           });
			      });
			  }
			  else{
			    swal("Bạn chưa đăng nhập", "Hãy đăng nhập để sử dụng dịch vụ", "success");
			    $('#sub').prop('disabled', true);
			  } 
		$('#thue').click(function(event) {
	/* Act on the event */
	if(token.token=='ERROR'){
		$('#modal_login').modal("show");
		// window.location.href("insert.php?token="+token);
	}
	else{
		window.location.href="insert.php?token="+token.token;
	}
});
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
						<a id="DN" data-toggle="modal" data-target="#modal_login" class="site-btn header-btn">ĐĂNG NHẬP</a>
						<nav class="main-menu">
							<ul>
								<li><a href="index.html">TRANG CHỦ</a></li>
								<li><a href="#">THÀNH PHỐ HỖ TRỢ</a></li>
								<li><a href="#">LỢI ÍCH</a></li>
								<li><a href="#">SẢN PHẨM</a></li>
								
								<li id="thue"><a>Cho thuê vị trí</a></li>
								<li id="booking" class="d-none">
									<div class="btn-group">
									  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									    Booking list
									  </button>
									  <div class="dropdown-menu" id="list_book">
									    <a class="dropdown-item" style="color: red" href="#">Không có gì</a>
									  </div>
									</div>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>	
	</header>
			<div class="modal fade" id="modal_login" >
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
                <label id="local" for="local">Vị trí</label>
               <!-- <input type="text" class="form-control" id="local"> -->
              </div>
               <div class="form-group">
                <label id="fee" for="fee">Giá</label><br>
                <label id="time" for="time"></label>
              </div>
               <div class="form-group">
                <label for="fee">Thời gian bắt đầu thuê</label>
                <input type="text" name="start" class="form-control" id="startTime">
              </div>
               <div class="form-group">
                <label for="fee">Số giờ thuê</label>
                <input type='number' name="lengthTime" min="1" id='lengthTime' max="23" oninput="AllFee()" class="form-control">
              </div>
              <div class="form-group">
                <label id="allPrice">Tổng giá:</label>
              </div>

               <script >
				     {
				    var timepicker = new TimePicker('startTime', {
				        lang: 'en',
				        theme: 'dark'
				    });
				    timepicker.on('change', function(evt) {
				  
				      var value = (evt.hour || '00') + ':' + (evt.minute || '00');
				        evt.element.value = value;
				         acceptTime=$('#time').text();
				 
				 	 finalTime=acceptTime.split("-");
				  startTimeinput=$('#startTime').val()+":00";
				  // console.log(finalendtime[1]+"huhu"+startTimeinput[0])
				  	if(finalTime[0]>finalTime[1]) finalTime[1]+="23:00:00";
				  	  console.log(startTimeinput>finalTime[1] ); 
				  if(startTimeinput<finalTime[0] || startTimeinput>finalTime[1]){
				  		console.log(finalTime[0]+' to '+finalTime[1]+ 'input:'+startTimeinput);
				  		$('#allPrice').html("Lỗi, Thời gian bắt đầu thuê không hợp lệ")
				  }
				  else{
				  	$('#allPrice').html("Tổng giá");
				  }
				    });

				  }
				  function AllFee() {
				  	var fee=$('#fee').text().split(":");
				  	var finalfee=fee[1].split(" ");
				  	var finalfianlfee=parseInt($('#lengthTime').val())*parseInt(finalfee[1]);
				 	$('#allPrice').html("Tổng giá: "+ finalfianlfee);
				 	$('#price').val(finalfianlfee);
				  }
				  </script>
              <div class="form-group">
                <label for="fee">Biển số xe</label>
                <input type="text" name="bsx" class="form-control" id="BSX">
              </div>
             <!--  <input type="text" class="d-none" name="start" id="start">
              <input type="text" class="d-none"  name="price" id="price">
              <input type="text" class="d-none"  name="token" id="token"> -->
              <input type="text" class="d-none"  name="idplace" id="idplace">
               <button type="button" id="direction" class="btn btn-default">Chỉ đường</button>
              <button type="submit" id="sub" class="btn btn-default">Thuê</button>
            </form>    
        </div>
	</div>
	
	
</body>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdqZALzdBcHhHyQm64AQ3GtlvkuOctElo&callback=initMap"></script>
</html>
