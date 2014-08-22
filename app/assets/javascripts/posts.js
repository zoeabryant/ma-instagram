// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
function readURL(input) {
	// http://stackoverflow.com/questions/4459379/preview-an-image-before-it-is-uploaded
	if (input.files && input.files[0]) {
		var reader = new FileReader();

		reader.onload = function (e) {
			var background = "background-image: url('" + e.target.result + "')"
			$('#photo_area').empty();
			$('#photo_area').attr('style', background);
		}

		reader.readAsDataURL(input.files[0]);
	}
}

function getLocation() {
	GMaps.geolocate({
		success: function(position) {
			lat = position.coords.latitude
			lng = position.coords.longitude

			getLocationName(lat, lng);
		},
		error: function(error) {
			alert('Geolocation failed: '+error.message);
		},
		not_supported: function() {
			alert("Your browser does not support geolocation");
		}
	});

}

function getLocationName(lat, lng){
	GMaps.geocode({
		lat: lat,
		lng: lng,

		callback: function(results, status) {
			if (status == 'OK') {
				var address = results[0].formatted_address
				$('#post_location').val(address)
			} else {
				alert('There was an error in finding your location, please enter manually')
			}
		}
	});
}

$(document).ready(function(){
	var fileField = $('#post_picture')
	var	locationButton = $('#get_location')

	fileField.change(function(){
		readURL(this)
	});

	locationButton.click(function(){
		getLocation()
	});
});