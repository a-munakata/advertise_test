jQuery ->
  change = ->
    $(".chart").each (index, element) ->
      if $(element).data('chart')?
        $(element).highcharts $(element).data('chart')

  $(document).ready change
  $(document).on "change", "select", change