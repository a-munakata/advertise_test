#encoding: utf-8
require 'modules/inflowers_chart'

class InflowersController < ApplicationController
  include InflowersChart
  before_filter :ga_setting


  def index
    @chart_results = @demensions.each_with_index.collect do |demension, index|
      inflowers_chart(demension, index, @period).to_json
    end
  end

  def ga_setting
    @start_date = Date.today
    @end_date   = Date.today - 7.days
    @period = (@start_date - @end_date).to_i
    @demensions = ["visits", "pageviews", "new_visits"]
  end

  class Result
    extend Garb::Model
    metrics :pageviews, :visitors, :new_visits, :visits
    dimensions :visitor_type
  end
end