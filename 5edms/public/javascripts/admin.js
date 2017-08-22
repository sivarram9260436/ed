/*script for menus*/
$(function(){
        jQuery('#navlist>li').click(function (){$(this).find('ul').slideToggle('medium')});
});
$(function () {
    $('li.green').click(function(){
        $('#navlist li.green').not(this).each(function () {
            $(this).find('ul').css('display','none');
        });
    });
});


/*script for menus hiding*/
$(document).ready(function() {

    var value = window.location.href.substring(window.location.href.lastIndexOf('/') + 1);

  $('#'+value).parent().show();
});


//helptext
$(document).ready(function() {
	$('a.title').cluetip({
				arrows: false,
				splitTitle: '|',
				positionBy: 'fixed',
  				leftOffset: '8',
  				topOffset: '-11'
			});

	});

//for leave status filter
$(document).ready(function(){
	$(".all_year").change(function(event){
		event.preventDefault();
		var path = window.location
		var yea = $("#date_year").val()
		$.ajax({
			type: "GET",
			url: "/select/list",
			data: "year=" + $("#date_year").val() + "&status=" + $("#select_status").val(),
			// beforeSend: function(xhr) {xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'))},
			datatype: "html",
			success: function(data) {
				$(".leave_status_list").html(data);
			}
		});
	});
});

$(function(){
	$(document).on("change", ".status_change", function(){
	$.ajax({
		type: 'GET',
		url: "/select/list",
		data: "year=" + $("#date_year").val() + "&status=" + $("#select_status").val(),
		datatype: 'html',
		success: function(data) {
			$(".leave_status_list").html(data)
		}
	});
	});
});


