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
    @period = 7

    @demensions = ["visits", "pageviews", "new_visits"]
    Garb::Session.login(ENV["GA_USER"], ENV["GA_PASSWD"])

    profile = Garb::Management::Profile.all.detect do |p|
      p.web_property_id == ENV["GA_PROPERTY_ID"]
    end

    @results = @period.times.collect do |n|
      set_date = @period - 1
      options = {
        :start_date => Date.today - (set_date - n).day,
        :end_date => Date.today - (set_date - n).day
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