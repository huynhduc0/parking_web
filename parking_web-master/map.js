 if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(initMap);
    } else { 
        $('#location').html('Geolocation is not supported by this browser.');
    }
function initMap(position) {
	var place = {lat: position.coords.latitude, lng: position.coords.longitude};
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 15, center: place
      });
 	 infowindow = new google.maps.InfoWindow({
      content: document.getElementById('form')

      });
  	var ds=document.getElementById('list').innerHTML;
  	console.log(ds);
 	list=jQuery.parseJSON(ds);
  	list.map(function(e) {
  		var ll = e.location.split(",");
  		console.log(e.location);
  		var marker= new google.maps.Marker({
  			position: new google.maps.LatLng(ll[0],ll[1]),
  			map:map
  		});
  		 google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
            console.log(document.getElementById('form'));
            $('#local').val(e.place);
            $('#time').val(e.time);
            $('#fee').val(e.price);
      		//$('#form').html('Vị trí: '+ e.place+'<br>'+'Giá thuê: '+e.price+'/giờ'+'<br>Từ: '+ e.time+'<br><button type="button" class="btn btn-primary">Thuê, sợ đéo gì?</button>');
      		
          });
  	})
  
}
