 if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(initMap);
    } else { 
        $('#location').html('Geolocation is not supported by this browser.');
    }
var map;
var myPositionLatLng={};
function initMap(position) {
  myPositionLatLng={lat: position.coords.latitude, lng: position.coords.longitude};
	var place = {lat: position.coords.latitude, lng: position.coords.longitude};
  map = new google.maps.Map(
      document.getElementById('map'), {zoom: 15, center: place
      });
 	 infowindow = new google.maps.InfoWindow({
      content: document.getElementById('form')
      });
  	var ds=document.getElementById('list').innerHTML;
  	
 	list=jQuery.parseJSON(ds);
  	list.map(function(e) {
  		var ll = e.location.split(",");
  	
  		var marker= new google.maps.Marker({
  			position: new google.maps.LatLng(ll[0],ll[1]),
  			map:map
  		});
  		 google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
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
    var e=JSON.stringify(elem);
    var ll = elem.location.split(",");
    var noidung="<div id='place' >";
    noidung+="<div>"+elem.place+"</div>"+"Cách "+getDistanceFromLatLonInKm(myPositionLatLng.lat,myPositionLatLng.lng,ll[0],ll[1])+" KM";
    noidung+='<div>'+elem.price+"</div><button type='button' class='btn btn-primary' onclick='moveToLocation("+index+")'>Tìm</button>";
     $('#listSearch').append(noidung);

  })
}
    
});
}
function caculateDistance(vt){
 $.getJSON( "https://api.opencagedata.com/geocode/v1/json?q="+vt+"&key=0ce69a90ea30455eaf7a836aef584c2d&pretty=1", function( data ) { 
  console.log(data.results[0].confidence)
        $('#listSearch').append("Loại"+data.results[0].confidence+"</div>");
    
  });
}
function getPlace(lat,lng) {
  $.getJSON( "https://api.opencagedata.com/geocode/v1/json?q="+lat+","+lng+"&key=00f711f73483427c8577e646aa2bf4bf&jsonp",
   function( data ) {
    console.log(data);
      if(data.results[0].formatted){
        caculateDistance(data.results[0].formatted);
      }
      else{
        return;
      }
  });
}
function getDistanceFromLatLonInKm(lat1,lon1,lat2,lon2) {
  var R = 6371; // Radius of the earth in km
  var dLat = deg2rad(lat2-lat1);  // deg2rad below
  var dLon = deg2rad(lon2-lon1); 
  var a = 
    Math.sin(dLat/2) * Math.sin(dLat/2) +
    Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * 
    Math.sin(dLon/2) * Math.sin(dLon/2)
    ; 
  var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a)); 
  var d = R * c; // Distance in km
  return Math.round(d,5);
}

function deg2rad(deg) {
 return deg * (Math.PI/180)
}
function login() {
  // body...
  $.ajax({
    url: '../User/login.php',
    type: 'POST',
    data: {username: $('#username').val(), password:$('#password').val()},
    success:function(result) {
      // body...
      console.log(result);
    }
  })
}