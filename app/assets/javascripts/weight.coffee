compute_weight = ->
  sum = 0
  $('.weight-compute').each ->
    sum += Number($(this).val())
  $('#weightkg').val(sum/100)
  $('#weightlb').val(sum/50)

$(document).on 'turbolinks:load', ->
  $('.weight-compute').change ->
    compute_weight()

  $('.weight-compute').keyup ->
    compute_weight()

