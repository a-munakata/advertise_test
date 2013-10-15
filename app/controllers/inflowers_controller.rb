#encoding: utf-8
require 'modules/inflowers_chart'

class InflowersController < ApplicationController
  include InflowersChart

  def index
    start_date = params[:range]["start_date"]
    end_date   = params[:range]["end_date"]

    start_date.present? ? @start_date = start_date.to_date - 1.day : @start_date = Date.today - 7.days
    end_date.present?   ? @end_date   = end_date.to_date           : @end_date   = Date.today

    (start_date.present? && end_date.present?) ? @period = (@end_date - @start_date).to_i : @period = 7

    @demensions = ["visits", "pageviews", "new_visits"]

    @chart_results = @demensions.each_with_index.collect do |demension, index|
      inflowers_chart(demension, index, @period).to_json
    end
  end
end