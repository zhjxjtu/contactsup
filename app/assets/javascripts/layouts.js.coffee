$ ->

  $("[rel=tooltip]").tooltip()
  $("[rel=popover]").popover()

  $('.field_with_errors input').focus ->
    $(this).parent().removeClass('field_with_errors')

  $('#flash_close').click ->
    $('.flash-message').fadeOut(300)

  $('.tablesorter-header-inner i').removeClass()
  $('#contacts_table').tablesorter({sortList: [[1,0],[2,0], [3,0],[4,0],[5,0],[6,0]]})

  $('#contactsUpdateModal').modal('show')