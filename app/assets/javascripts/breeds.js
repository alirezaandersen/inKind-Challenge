function handleData(data) {
	var dogPicUrl = data.message;
	$('#dogPic').attr('src', dogPicUrl);
}

function getRemote(remote_url) {
	return $.ajax({
		type: "GET",
		url: remote_url,
		async: false,
		success: handleData,
	})
}

function titleCase(str) {
	var name = str.split('-').map(function(word) {
		return (word.charAt(0).toUpperCase() + word.slice(1));
	}).join(' ');
	dogBreed = $('#sel-breed span').text(name)
}

function getImage(type) {
	var baseUrl = 'show_image/';
	var apiUrl = baseUrl + type;
	parsedName = titleCase(type)
	dogUrl = getRemote(apiUrl);
}
$(document).ready(function() {});
