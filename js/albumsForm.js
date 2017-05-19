$(document).ready(function(){
	$('#albumsAdd').on('click', function(){
		event.preventDefault();

		$('#albumsTitle').val('');
		$('#albumsText').val('');
		$('#albumsTags').val('');

		if (!$('#albumsButton').length) {
			$('#albumsEdit').remove();
			$('.formForAlbums').append('<input type="submit" id="albumsButton" value="добавить">');
		}
		$('.formForAlbums').toggle();


		$('#albumsButton').on('click', function(){
			event.preventDefault();
			var albumsTitle = $('#albumsTitle').val();
			var albumsText = $('#albumsText').val();
			var albumsTags = $('#albumsTags').val();

			if (albumsTitle.length || albumsText.length || albumsTags.length) {
				$.post(MAIN + 'albums/add/', {albumsTitle: albumsTitle, albumsText: albumsText, albumsTags: albumsTags}, function(data){
					console.log(data);
					// console.log(data['error'] + ' ' + data['text'] + ' ' + data['type']);
					//location.reload();
				}, 'json');
			} else {
				alert('поля пустые');
			}
		});
	});

	$('.albumsEdit').on('click', function(){
		event.preventDefault();

		var albumsId = '';
		albumsId = $(this).data('item');

		var title = $($('.albumsEdit[data-item=' + albumsId + ']').closest('tr').children()[0]).text();
		var text = $($('.albumsEdit[data-item=' + albumsId + ']').closest('tr').children()[3]).text();
		var tags = $($('.albumsEdit[data-item=' + albumsId + ']').closest('tr').children()[4]).text();

		$('#albumsTitle').val('');
		$('#albumsText').val('');
		$('#albumsTags').val('');

		$('#albumsTitle').val(title);
		$('#albumsText').val(text);
		$('#albumsTags').val(tags);

		if (!$('#albumsEdit').length) {
			$('#albumsButton').remove();
			$('.formForAlbums form').append('<input type="submit" id="albumsEdit" value="редактировать">');
		}
		$('.formForAlbums').toggle();

		$('#albumsEdit').on('click', function(){
			event.preventDefault();

			var newTitle = $('#albumsTitle').val();
			var newText = $('#albumsText').val();
			var newTags = $('#albumsTags').val();

			if (newTitle.length || newText.length || newTags.length) {

				$.post(MAIN + 'albums/edit/' + albumsId + '/', {newTitle: newTitle, newText: newText, newTags: newTags}, function(data){
					// console.log(data['error'] + ' ' + data['text'] + ' ' + data['type']);
					//location.reload();
				}, 'json');
			} else {
				alert('поля пустые');
			}

		});
	});
});
