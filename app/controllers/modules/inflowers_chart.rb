#encoding: utf-8
require 'date'
require 'modules/basic_chart'

module InflowersChart
  include BasicChart

  def inflowers_chart(demension, index, period)

    inflowers_count = Hash[*inflowers_count(period, index).compact.flatten]

    chart_data = {
      title: {
        text: get_title[index]
      },
      xAxis: {
        categories: inflowers_count.keys
      },
      yAxis: {
        title: {
          text: demension
        }
      },
      series: [
        {
         name: get_series_title[index],
         data: inflowers_count.values
        }
      ]
    }

    basic_chart_option.deep_merge(chart_data)
  end

  def get_title
    ["訪問数", "ページビュー数", "新規訪問数"]
  end

  def get_series_title
    ["ユーザー数", "PV数", "ユーザー数"]
  end

  def inflowers_count(period, index)
    period.times.collect do |p|
      adjust_time = p + 1
      [
        (@end_date - (period - adjust_time).days ).strftime("%m/%d"),
        GaReport.where(:date => (@end_date - (period - adjust_time).days ))
                .last.send(@demensions[index])
      ]
    end
  end
end