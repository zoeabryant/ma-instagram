// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
	var file_field = $('#post_picture')

	// http://stackoverflow.com/questions/4459379/preview-an-image-before-it-is-uploaded
	function readURL(input) {
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

	file_field.change(function(){
		readURL(this)
	});
});