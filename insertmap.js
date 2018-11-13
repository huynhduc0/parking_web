 if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(initMap);
    } else { 
        $('#location').html('Geolocation is not supported by this browser.');
    };
  
function initMap(position) {
	var place = {lat: position.coords.latitude, lng: position.coords.longitude};
	var geocoder = new google.maps.Geocoder;
 	var map = new google.maps.Map(
      	document.getElementById('map'), {zoom: 15, center: place});
	infowindow = new google.maps.InfoWindow({
      content: document.getElementById('form')
      });

      messagewindow = new google.maps.InfoWindow({
       content: document.getElementById('message')
        });

        google.maps.event.addListener(map, 'click', function(event) {
          marker = new google.maps.Marker({
            position: event.latLng,
            map: map
          });
          google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
            var lat = marker.getPosition().lat();
			var lng = marker.getPosition().lng();
			var latlng={lat:lat, lng:lng};
			$('#location').val(latlng.lat+','+latlng.lng);
			console.log(latlng);
			 geocoder.geocode({'location': latlng}, 
			 	function(results, status) {
			 	alert(status);
        	});			
          });
})
}
function saveData(){
	var data={};
	data.place = document.getElementById('name').value;
	data.location = document.getElementById('location').value;
	data.time ={};
	data.time.start = document.getElementById('startTime').value;
	data.time.end= document.getElementById('endTime').value;
	data.price = document.getElementById('cost').value;
	$.ajax({
		url: 'addDb.php',
		type: 'POST',
		data: data,
		success:function(result) {
			// body...
			console.log(result);
		}
	})
	.done(function() {
		console.log("success");
	})
	.fail(function() {
		console.log("error");
	})
	.always(function() {
		console.log("complete");
	});
	
};
