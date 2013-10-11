class InflowersController < ApplicationController

  def index
    Garb::Session.login(ENV["GA_USER"], ENV["GA_PASSWD"])

    profile = Garb::Management::Profile.all.detect do |p|
      p.web_property_id == ENV["GA_PROPERTY_ID"]
    end

    options = {
      :start_date => Date.today,
      :end_date => Date.today
    }

    rs = Result.results(profile, options)

    @results = rs.collect do |r|
      [
        r.page_path,
        r.unique_pageviews,
        r.visitors,
        r.new_visits
      ]
    end

    render :text => @results

  end

  class Result
    extend Garb::Model
    metrics :unique_page_views, :visitors, :new_visits
    dimensions :page_path
  end



end