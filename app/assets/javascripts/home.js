function homeready(){

    
    console.log("registerd");
	$("input[type='checkbox']").change(function(check){
		console.log("action");
		var $el =$('#total');
		var checked = $("input[type='checkbox']:checked").length;
		var total = $el.data('price') * checked;
		$('#total').html('$ ' + total);
	});
    
	$('.moviecalendar').calendar({
	tmpl_path: "bootstrap-calendar/tmpls/",
	events_source: '/movie_calendar.json',
	views: {
		year: {
		slide_events: 1,
		enable: 0
		},
		month: {
		slide_events: 1,
		enable: 1
		},
		week: {
		enable: 0
		},
		day: {
		enable: 0
		}
	}
    });
}
  
$(document).ready(homeready)
$(document).on('page:load', homeready)