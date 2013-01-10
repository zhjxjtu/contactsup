$ ->

  $("[rel=tooltip]").tooltip()
  $("[rel=tooltip]").tooltip()
  $("[rel=popover]").popover()

  $('#flash_close').click ->
    $('.flash-message').fadeOut(300)

  $('.tablesorter-header-inner i').removeClass()
  $('.table-column-hide').hide()
  $('#contacts_table').tablesorter({sortList: [[0,0], [1,0]]})

  $('.btn-accept').click ->
    $(this).parents('.btn-group').fadeOut(100)
    $(this).parents('tr').removeClass()
  $('.btn-ignore').click ->
    $(this).parents('tr').fadeOut(100)
  $('.btn-remind').click ->
    $(this).fadeOut(100)