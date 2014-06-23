ready =->
  $(".datetimepicker").datetimepicker()
  console.log("datetimepicker")
  $('.btn').button()

$(document).ready(ready)
$(document).on('page:load', ready)