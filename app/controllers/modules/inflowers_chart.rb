#encoding: utf-8
require 'date'
require 'modules/basic_chart'

module InflowersChart
  include BasicChart

  def inflowers_chart
    #unique_pageviews = @results.collect{ |result| result.inject(0){|sum, i| i[0].to_i + sum } }
    inflowers_count = Hash[*inflowers_count(7).compact.flatten]

    chart_data = {
      title: {
        text: "unique_pageviews"
      },
      xAxis: {
        categories: inflowers_count.keys
      },
      yAxis: {
        title: {
          text: 'users'
        }
      },
      series: [{
                 name: 'ユーザー数',
                 data: inflowers_count.values
               }]
    }

    basic_chart_option.deep_merge(chart_data)
  end

  def inflowers_count(period)
    period.times.collect do |p|
      [
        (Time.now.change(:hour => 0, :min => 0, :sec => 0) - (period - p).days ).strftime("%m/%d"),
        @results[p].inject(0){ |sum, i| i[0].to_i + sum }
      ]
    end
  end

  def main_title(interval)
    case interval
      when "monthly"
        "月ごとのユーザー増加推移"
      when "daily"
        "最近1ヶ月のユーザー増加推移"
    end
  end

end