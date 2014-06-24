function homeready(){
	$('.moviecalendar').calendar({
    	tmpl_path: "bootstrap-calendar/tmpls/",
    	events_source: function () { return []; },
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