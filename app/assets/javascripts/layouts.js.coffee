$ ->

  $("[rel=tooltip]").tooltip()
  $("[rel=tooltip]").tooltip()
  $("[rel=popover]").popover()

  $('#flash_close').click ->
    $('.flash-message').fadeOut(300)

  $('.tablesorter-header-inner i').removeClass()
  $('.td-hide').hide()
  $('#contacts_table').tablesorter({sortList: [[0,0], [1,0]]})

  $('.btn-accept').click ->
    $(this).parents('.btn-group').fadeOut(100)
    $(this).parents('tr').removeClass()
  $('.btn-ignore').click ->
    $(this).parents('tr').fadeOut(100)
  $('.btn-remind').click ->
    $(this).fadeOut(100)

  $('#search_input').keyup ->
      kword = $(this).val()
      if kword == ''
        $('#contacts_table tbody tr').show()
      else
        $('#contacts_table tbody tr').each ->
          if $(this).text().search(new RegExp(kword, "i")) <= 0
            $(this).fadeOut()
          else
            $(this).fadeIn()