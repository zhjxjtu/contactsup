$ ->
  $('#message_flash_close').click ->
    $(".flash-message").fadeOut(200)
  $('.field_with_errors input').focus ->
    $(this).parent().removeClass('field_with_errors')