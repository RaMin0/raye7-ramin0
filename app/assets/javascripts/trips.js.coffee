$(document).on 'click', '.trip-details', (e) ->
  e.preventDefault()
  $(@).hide().closest('.trip').find('.details').show()
