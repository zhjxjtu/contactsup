$ ->

  $("[rel=tooltip]").tooltip()
  $("[rel=tooltip]").tooltip()
  $("[rel=popover]").popover()

  $('#flash_close').click ->
    $('.flash-message').fadeOut(300)

  $('.tablesorter-header-inner i').removeClass()
  $('#contacts_table').tablesorter({sortList: [[0,0]]})