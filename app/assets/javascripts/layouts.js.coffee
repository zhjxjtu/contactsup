$ ->
  $('#flash_close').click ->
    $(".flash-message").fadeOut(200)
  $('.field_with_errors input').focus ->
    $(this).parent().removeClass('field_with_errors')
  $('#login_flash').hover ->
  	$(this).delay(3000).fadeOut(1000)
