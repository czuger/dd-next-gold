can_save = false

compute_weight = ->

  sum = 0
  $('.weight-compute').each ->
    sum += Number($(this).val())
  $('#weightkg').val(Math.floor(sum/100))
  $('#weightlb').val(Math.floor(sum/50))

  cp = parseInt($('#cp').val())
  cp = 0 unless cp

  sp = parseInt($('#sp').val())
  sp = 0 unless sp
  cp += sp * 10

  ep = parseInt($('#ep').val())
  ep = 0 unless ep
  cp += ep * 50

  gp = parseInt($('#gp').val())
  gp = 0 unless gp
  cp += gp * 100

  pp = parseInt($('#pp').val())
  pp = 0 unless pp
  cp += pp * 1000

  change = parseInt($('#change_tax').val())
  if change > 0
    tax = Math.floor( cp / change )
    $('#change_cost').val(tax)
    cp -= tax
  else
    $('#change_cost').val(0)

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


save_data = ->
  if can_save
    window.localStorage.cp = $('#cp').val()
    window.localStorage.sp = $('#sp').val()
    window.localStorage.ep = $('#ep').val()
    window.localStorage.gp = $('#gp').val()
    window.localStorage.pp = $('#pp').val()
    window.localStorage.change_tax = $('#change_tax').val()


load_data = ->
  if can_save
    $('#cp').val(window.localStorage.cp)
    $('#sp').val(window.localStorage.sp)
    $('#ep').val(window.localStorage.ep)
    $('#gp').val(window.localStorage.gp)
    $('#pp').val(window.localStorage.pp)
    $('#change_tax').val(window.localStorage.change_tax) if window.localStorage.change_tax


$(document).on 'turbolinks:load', ->

  if typeof Storage != 'undefined'
    $('#database_status').html('Database OK')
    can_save = true
  else
    $('#database_status').html('Database not working')

  load_data()
  compute_weight()

  $('.weight-compute').change ->
    save_data()
    compute_weight()

  $('.weight-compute').keyup ->
    save_data()
    compute_weight()

  $('#change_tax').change ->
    save_data()
    compute_weight()

  $('#change_tax').keyup ->
    save_data()
    compute_weight()
