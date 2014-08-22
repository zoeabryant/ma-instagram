// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){

	var postID = $('#map').data('id')

	if(postID){

		$.get('/posts/' + postID + '.json', function(postInfo){

			var map = new GMaps({
				div: '#map',
				width: '100%',
				height: '500px',
				lat: 0,
				lng: 0
			});

			GMaps.geocode({
				address: postInfo.location,
				callback: function(results, status) {
					if (status == 'OK') {
						var latlng = results[0].geometry.location;

						map.setCenter(latlng.lat(), latlng.lng());
						map.addMarker({
							lat: latlng.lat(),
							lng: latlng.lng()
						});
					}
				}
			});

		});

	}

});