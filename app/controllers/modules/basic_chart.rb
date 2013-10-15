#encoding: utf-8
require 'date'

module BasicChart
  def basic_chart_option
    @colors           = ["#72b1c0", "#747dc0", "#d24623", "#7ba444", "#dc7b9a", "#e7b727", "#eaa21a", "#999999", "#c42525", "#a6c96a"]
    {
      exporting: {
        enabled: true
      },
      chart: {
        margin: 75,
        backgroundColor: "#f6f6f6",
        plotBorderColor: "#d4d4d4"
      },
      colors: @colors,
      navigation: {
        buttonOptions: {
          width: 30,
          height: 30,
          symbolFill: "#cccccc",
          symbolStroke: "#fff",
          symbolX: 15,
          symbolY: 15,
          theme: {
            r: 0,
            stroke: '#cccccc',
            fill: '#cccccc',
            states: {
              hover: {
                stroke: '#72b1c0',
                fill: '#72b1c0'
              },
              select: {
                stroke: '#72b1c0',
                fill: '#72b1c0'
              }
            }
          }
        }
      },
      plotOptions: {
        series: {
          lineWidth: 5
        }
      },
      credits: {
        enabled: false
      },
      title: {
        text: ""
      },
      xAxis: {
        allowDecimals: false,
        lineColor: "#4b4b4b",
        lineWidth: 1
      },
      yAxis: {
        allowDecimals: false,
        gridLineColor: '#d4d4d4',
        lineColor: "#4b4b4b",
        lineWidth: 1,
        title: {
          text: 'Users',
          style: {
            color: "#4b4b4b"
          }
        }
      }
    }
  end
end

