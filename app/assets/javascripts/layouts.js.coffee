$ ->
  $("[rel=tooltip]").tooltip()
  $("[rel=popover]").popover()
  $('.field_with_errors input').focus ->
    $(this).parent().removeClass('field_with_errors')
  $('#flash_close').click ->
    $('.flash-message').fadeOut(300)
  