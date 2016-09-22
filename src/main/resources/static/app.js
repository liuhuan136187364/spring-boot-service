$(document).ready(function() {
	$.ajax({
		url : "/info"
	}).then(function(data) {
		console.log($('.app-version'));
		$('.app-version').append("<small>Version: </small>" + data.version);
		console.log(data);
		// $('.greeting-content').append(data.content);
	});
	
	$.ajax({
		url : "/inet"
	}).then(function(data) {
		console.log();
		$('.hostname').append("<small>Hostname: </small>" + data.hostname);
		$('.inet').append("<small>Ip Address: </small>" + data.ipAddress);
		console.log(data);
		// $('.greeting-content').append(data.content);
	});

	$.ajax({
		url : "/env"
	}).then(function(data) {
		$.each(data, function(key, value) {		
			var innerHtml=''; 
			$.each(value, function(k, v) {
				innerHtml = innerHtml +'<tr>' +
		          '<td style="word-break: break-all;">' + k + '</td>' +
		          '<td style="word-break: break-all; width: 62%;">' + v + '</td>' +
		        '</tr>';
			});
			$('.env').append(
					'<div class="panel panel-success">' +
					'<div class="panel-heading">' + key + '</div>' +
					'<div class="panel-body">' +
						'<table class="table table-striped">' +
							'<collgroup>' +
								'<col widthd=38%">' +
								'<col widthd=62%">' +
							'</collgroup>' +
							'<tbody>' +
							innerHtml +
							'</tbody>' +
						'</table>' +
					'</div>' +
				'</div>');
		
		});
		$('.info-table-body')
	});
});