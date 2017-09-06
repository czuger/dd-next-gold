compute_weight = ->
  sum = 0
  $('.weight-compute').each ->
    sum += Number($(this).val())
  $('#weightkg').val(Math.floor(sum/100))
  $('#weightlb').val(Math.floor(sum/50))

  cp = parseInt($('#cp').val())
  cp = 0 unless cp

  sp = $('#sp').val()
  sp = 0 unless sp
  cp += sp * 10

  ep = $('#ep').val()
  ep = 0 unless ep
  cp += ep * 50

  gp = $('#gp').val()
  gp = 0 unless gp
  cp += gp * 100

  pp = $('#pp').val()
  pp = 0 unless pp
  cp += pp * 1000

  final_pp = Math.floor( cp / 1000 )
  cp -= final_pp * 1000

  final_gp = Math.floor( cp / 100 )
  cp -= final_gp * 100

  final_sp = Math.floor( cp / 10 )
  cp -= final_sp * 10

  final_cp = cp

  $('#pp_change').val(final_pp)
  $('#gp_change').val(final_gp)
  $('#sp_change').val(final_sp)
  $('#cp_change').val(final_cp)

  sum = final_pp + final_gp + final_sp + final_cp
  $('#weight_change_kg').val(Math.floor(sum/100))
  $('#weight_change_lb').val(Math.floor(sum/50))

$(document).on 'turbolinks:load', ->
  $('.weight-compute').change ->
    compute_weight()

  $('.weight-compute').keyup ->
    compute_weight()

