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
      series: [{
                 name: get_series_title[index],
                 data: inflowers_count.values
               }]
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
    set_date = period - 1
    period.times.collect do |p|
      [
        (Time.now.change(:hour => 0, :min => 0, :sec => 0) - (set_date - p).days ).strftime("%m/%d"),
        @results[p].inject(0){ |sum, i| i[index].to_i + sum }
      ]
    end
  end
end