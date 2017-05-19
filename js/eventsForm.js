$(document).ready(function(){
	$('#eventsAdd').on('click', function(){
		event.preventDefault();

		$('#eventsTitle').val('');
		$('#eventsText').val('');
		$('#eventsTags').val('');

		if (!$('#eventsButton').length) {
			$('#eventsEdit').remove();
			$('.formForEvents').append('<input type="submit" id="eventsButton" value="добавить">');
		}
		$('.formForEvents').toggle();


		$('#eventsButton').on('click', function(){
			event.preventDefault();
			var eventsTitle = $('#eventsTitle').val();
			var eventsText = $('#eventsText').val();
			var eventsTags = $('#eventsTags').val();

			if (eventsTitle.length || eventsText.length || eventsTags.length) {
				$.post(MAIN + 'events/add/', {eventsTitle: eventsTitle, eventsText: eventsText, eventsTags: eventsTags}, function(data){
					console.log(data);
					// console.log(data['error'] + ' ' + data['text'] + ' ' + data['type']);
					//location.reload();
				}, 'json');
			} else {
				alert('поля пустые');
			}
		});
	});

	$('.eventsEdit').on('click', function(){
		event.preventDefault();

		var eventsId = '';
		eventsId = $(this).data('item');

		var title = $($('.eventsEdit[data-item=' + eventsId + ']').closest('tr').children()[0]).text();
		var text = $($('.eventsEdit[data-item=' + eventsId + ']').closest('tr').children()[3]).text();
		var tags = $($('.eventsEdit[data-item=' + eventsId + ']').closest('tr').children()[4]).text();

		$('#eventsTitle').val('');
		$('#eventsText').val('');
		$('#eventsTags').val('');

		$('#eventsTitle').val(title);
		$('#eventsText').val(text);
		$('#eventsTags').val(tags);

		if (!$('#eventsEdit').length) {
			$('#eventsButton').remove();
			$('.formForEvents form').append('<input type="submit" id="eventsEdit" value="редактировать">');
		}
		$('.formForEvents').toggle();

		$('#eventsEdit').on('click', function(){
			event.preventDefault();

			var newTitle = $('#eventsTitle').val();
			var newText = $('#eventsText').val();
			var newTags = $('#eventsTags').val();

			if (newTitle.length || newText.length || newTags.length) {

				$.post(MAIN + 'events/edit/' + eventsId + '/', {newTitle: newTitle, newText: newText, newTags: newTags}, function(data){
					// console.log(data['error'] + ' ' + data['text'] + ' ' + data['type']);
					//location.reload();
				}, 'json');
			} else {
				alert('поля пустые');
			}

		});
	});
});
