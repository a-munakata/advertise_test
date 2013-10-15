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

    @ga_set_date = @start_date
    @demensions = ["visits", "pageviews", "new_visits"]

    Garb::Session.login(ENV["GA_USER"], ENV["GA_PASSWD"])

    profile = Garb::Management::Profile.all.detect do |p|
      p.web_property_id == ENV["GA_PROPERTY_ID"]
    end

    @results = @period.times.collect do |p|
      adjust_time = p + 1
      options = {
        :start_date => @ga_set_date- (@period - adjust_time).day,
        :end_date => @ga_set_date - (@period - adjust_time).day
      }

      rs = Result.results(profile, options)

      rs.collect do |r|

        @demensions.each.collect do |demension|
          eval("r.#{demension}")
        end

      end
    end
  end

  class Result
    extend Garb::Model
    metrics :pageviews, :visitors, :new_visits, :visits
    dimensions :visitor_type
  end
end