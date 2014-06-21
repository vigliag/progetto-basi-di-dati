ready =->
  $(".datetimepicker").datetimepicker()
  console.log("datetimepicker")

$(document).ready(ready)
$(document).on('page:load', ready)