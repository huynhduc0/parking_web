 if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(initMap);
    } else { 
        $('#location').html('Geolocation is not supported by this browser.');
    }
var map;
function initMap(position) {
	var place = {lat: position.coords.latitude, lng: position.coords.longitude};
  map = new google.maps.Map(
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
var searchData;
function moveToLocation(id){
  var element= searchData[id];
      $('#local').val(element.place);
      $('#time').html("Từ:"+element.timeStart+"<br>Đến "+element.timeEnd);
      $('#fee').val(element.price);
      var ll = element.location.split(",");
    var center = new google.maps.LatLng(ll[0], ll[1]);
     map.panTo(center);
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(ll[0], ll[1]),
        map:map
      });
     infowindow.open(map, marker);
}
function search() {
 key=$('#searchkey').val();
   $('#listSearch').html("");
   $.getJSON( "search.php?key="+key, function( data ) {
    searchData=data;
  if(data.length==0){
    $('#listSearch').append("Không tìm thấy");
  }
  else{
  data.map(function(elem,index) {
    console.log(elem.place);
    var e=JSON.stringify(elem);
    console.log(e);
    var noidung="<div id='place' >";
    noidung+="<div>"+elem.place+"</div>";
    noidung+='<div>'+elem.price+"</div><button type='button' class='btn btn-primary' onclick='moveToLocation("+index+")'>Tìm</button></div>";
     $('#listSearch').append(noidung);

  })
}
    
});
}
