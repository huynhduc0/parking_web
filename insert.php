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
	<script src="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.js"></script>
<link href="http://cdn.jsdelivr.net/timepicker.js/latest/timepicker.min.css" rel="stylesheet"/>
	<script type="text/javascript" src="insertmap.js"></script>
</head>
<body>
	
		
	<div id="map" style="width: 100%; height: 500px;">
			
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
         <tr><td>Cost per hour:</td> <td><input type='text' id='cost'/> </td> </tr>
      <tr><td>Type:</td> <td><select id='type'> +
                 <option value='bar' SELECTED>bar</option>
                 <option value='restaurant'>restaurant</option>
                 </select> </td></tr>
                 <tr><td></td><td><input type='button' value='Save' onclick='saveData()'/></td></tr>
      </table>
    </div>
</body>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBdqZALzdBcHhHyQm64AQ3GtlvkuOctElo&callback=initMap">
    </script>
<!-- <script src="https://maps.googleapis.com/maps/api/js?AIzaSyBKneRHrIEIMMEFrsKGM31IO15OpjGSPPM&callback=initMap"></script> -->
</html>
