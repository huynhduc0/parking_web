<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Maps</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
	<script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script>
	<script type="text/javascript" src="insertmap.js"></script>
 
  <link rel="stylesheet" href="../css/style.css"/>
  <link rel="stylesheet" href="../css/font-awesome.min.css"/>
  <link rel="stylesheet" href="../css/owl.carousel.css"/>
  <link rel="stylesheet" href="../css/style.css"/>
  <script src="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>
<link href="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet"/>
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
            <a href="" class="site-btn header-btn">ĐĂNG NHẬP</a>
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
	
		    <div class="container-fluid">
          <div class="row">
            <div class="col-lg-4">  
              <form class="" " >
                                <div class="card-body row no-gutters align-items-center">
                                    <div class="col-auto">
                                        <i class="fglyphicon glyphicon-search"></i>
                                    </div>
                                    <!--end of col-->
                                    <div class="col">
                                        <input class="form-control form-control-lg form-control-borderless" type="search" placeholder="Tìm địa điểm">
                                    </div>
                                    <!--end of col-->
                                    <div class="col-auto">
                                        <button class="btn btn-lg btn-outline-primary" type="submit">Search</button>
                                    </div>
                                    <!--end of col-->
                                </div>
                            </form>
            </div>
          <div class="col-lg-8">
            <div id="map" style="width: 98%; height: 640px;">
          </div>
          </div>
        </div>
        </div>
        </div>

	<div id="form">
      <table>
      <tr><td>Name:</td> <td><input type='text' id='name'/> <input type='text' class="d-none" id='location'/> </td> </tr>
       <tr><td>Start Time</td> <td><input type='text' id='startTime'/> </td> </tr>
        <tr><td>Tổng thời gian</td> <td><input type='number'  min="1" id='lengthTime' max="23" oninput="getEndTime()"/> </td> </tr>
          <tr><td >EndTime: <td id="endTime"></td></td> </tr>
           <script >
            {
    var timepicker = new TimePicker('startTime', {
        lang: 'en',
        theme: 'dark'
    });
    timepicker.on('change', function(evt) {
  
      var value = (evt.hour || '00') + ':' + (evt.minute || '00');
        evt.element.value = value;
    });
  }
  function getEndTime() {
    var timeEnd=$('#startTime').val();
    var res = timeEnd.split(":");
    var end=parseInt(res[0])+parseInt($('#lengthTime').val());
    if(end>23){
      end= end-24;
    }
    $('#endTime').html(end+":"+res[1]);

  }
  </script>
         <tr><td>Giá mỗi giờ</td> <td><input type='text' id='cost'/> </td> </tr>
          <tr><td></td><td><input type='button' value='Save' onclick='saveData()'/></td></tr>
      </table>
    </div>
</body>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdqZALzdBcHhHyQm64AQ3GtlvkuOctElo&callback=initMap">
    </script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?AIzaSyBKneRHrIEIMMEFrsKGM31IO15OpjGSPPM&callback=initMap"></script> -->
</html>
