#encoding: utf-8
require 'modules/inflowers_chart'

class InflowersController < ApplicationController
  include InflowersChart
  before_filter :ga_setting

  def index
    @inflowers_chart = inflowers_chart.to_json
  end

  def ga_setting
    @demensions = ["pageviews", "visitors", "new_visits"]
    Garb::Session.login(ENV["GA_USER"], ENV["GA_PASSWD"])

    profile = Garb::Management::Profile.all.detect do |p|
      p.web_property_id == ENV["GA_PROPERTY_ID"]
    end

    @results = 7.times.collect do |n|
      options = {
        :start_date => Date.today - (7 - n).day,
        :end_date => Date.today - (7 - n).day
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
    metrics :pageviews, :visitors, :new_visits
    dimensions :visitor_type
  end
end