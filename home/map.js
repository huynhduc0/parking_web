 if (navigator.geolocation) {
  // Lấy vị trí hiện tại sử dụng GeoLocation (HTML5), truyền giá trị vào cho hàm initMap
        navigator.geolocation.getCurrentPosition(initMap);
    } else { 
        $('#location').html('Geolocation is not supported by this browser.');
    }
var map;// Đối tượng hiển thị Google maps
var myPositionLatLng={}; // Vị trí của tôi
function initMap(position) {
  //Khởi tạo GoogleMaps
  myPositionLatLng={lat: position.coords.latitude, lng: position.coords.longitude};
  // Lấy kinh độ, vĩ dộ vị trí hiện tại
	var place = {lat: position.coords.latitude, lng: position.coords.longitude};
  map = new google.maps.Map(
      document.getElementById('map'), {zoom: 15, center: place
      });
  // Cứa sổ popUp trên maps
 	 infowindow = new google.maps.InfoWindow({
      content: document.getElementById('form')
      });
   //Lấy danh sách các địa điểm
  	var ds=document.getElementById('list').innerHTML;
  	//Giải mã giá trị Json lấy đc về mảng 
 	list=jQuery.parseJSON(ds);
  	list.map(function(e) {
      // Duyệt mảng và hiện thì thành các marker trên bản đồ
  		var ll = e.location.split(",");
      // Tách tọa độ thành kinh độ và vĩ độ
      // Tạo marker theo kinh độ và vĩ độ vùa tách
  		var marker= new google.maps.Marker({
  			position: new google.maps.LatLng(ll[0],ll[1]),
  			map:map
  		});
      //Bắt sự kiện click vào marker
  		 google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
            // Mở inffo windows khi cick, truyền các giá trị địa điểm, thời gian phí, vào marker
            $('#local').html("Vị trí: "+e.place);
            $('#fee').html("Giá: "+e.price+" đ/h");
            $('#time').html(e.timeStart+"-"+e.timeEnd);
            $('#allPrice').html("Tổng giá:");
            // console.log("Vị trí id"+e.id);
            $('#idplace').val(e.id);
            //Tìm tên vị trí hiện tại và vị trí đến để tìm đường
            var myPlaceName,DirectionLocationName;
             getLocationName(ll[0],ll[1], function(value){
                DirectionLocationName=value;
             });
            getLocationName(position.coords.latitude,position.coords.longitude, function(value){
                myPlaceName=value;
             });
            $('#direction').click(function(event) {
              // Mở cửa sổ chỉ đường trên Google Maps
              var newURL="https://www.google.com/maps/dir/"+myPlaceName+"/"+DirectionLocationName;
               // console.log(newURL);
             window.open(newURL);  
              // openNewDirectionWindows(newURL); 
            });
      		//$('#form').html('Vị trí: '+ e.place+'<br>'+'Giá thuê: '+e.price+'/giờ'+'<br>Từ: '+ e.time+'<br><button type="button" class="btn btn-primary">Thuê, sợ đéo gì?</button>');     		
          });
  	})
  
}
// Hàm lấy tên vị trí theo kinh độ, vĩ độ, request Json lên Open Cage API
function getLocationName(lat,lng, callback) {
  $.getJSON( "https://api.opencagedata.com/geocode/v1/json?q="+lat+","+lng+"&key=00f711f73483427c8577e646aa2bf4bf&jsonp?callback",
   function(data) {
   callback(data.results[0].formatted);
  });
  // return data[0].results[0].formatted;
}

var searchData;
// Di chuyển tâm bản đồ qua vị trí khác
function moveToLocation(id){
  var element= searchData[id];
       $('#local').html("Vị trí: "+element.place);
            $('#fee').html("Giá: "+element.price+" đ/h");
            $('#time').html(element.timeStart+"-"+element.timeEnd);
            $('#allPrice').html("Tổng giá:");
            // console.log("Vị trí id"+e.id);
            $('<div id="idplace"></div>').val(element.id);
            console.log(element.id);
      var ll = element.location.split(",");
    var center = new google.maps.LatLng(ll[0], ll[1]);
     map.panTo(center);
    var marker = new google.maps.Marker({
        position: new google.maps.LatLng(ll[0], ll[1]),
        map:map
      });
     infowindow.open(map, marker);
}
function findPlaceViaPlaceID(id) {
  list.map(function( element,index) {

    if (id==element.id) {
       $('#local').html("Vị trí: "+element.place);
            $('#fee').html("Giá: "+element.price+" đ/h");
            $('#time').html(element.timeStart+"-"+element.timeEnd);
            $('#allPrice').html("Tổng giá:");
            // console.log("Vị trí id"+e.id);
            $('<div id="idplace"></div>').val(element.id);
            console.log(element.id);
            var ll = element.location.split(",");
            var center = new google.maps.LatLng(ll[0], ll[1]);
             map.panTo(center);
            var marker = new google.maps.Marker({
                position: new google.maps.LatLng(ll[0], ll[1]),
                map:map
              });
             infowindow.open(map, marker);
            }
  })
  // body...
}
// Tìm các địa điểm trong database (Request Json)
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
  var token;
  $.getJSON( "../User/login.php?username="+$('#username').val()+"&password="+$('#password').val(),
   function(data) {
      decodeToken(data);
})
}
function decodeToken(data){
   if(data.token!='ERROR'){
    $.getJSON( "../User/decryptToken.php?token="+data.token,
      function (returndata) {
        console.log(returndata);
        swal("Thành công", "Đăng nhập thành công", "success");
          $('#sub').prop('disabled', false);
         $('#DN').html(returndata[0].FullName);
      });
  }
  else{
    swal("Thất bại", "Sai thông tin, kiểm tra lại", "error");
  }
}