class GaReport < ActiveRecord::Base
  attr_accessible :date, :new_visits, :pageviews, :visits

  def self.fetch_ga_lists
    @fetch_period = 1
    @ga_set_date = Date.today
    @demensions = ["visits", "pageviews", "new_visits"]

    Garb::Session.login(ENV["GA_USER"], ENV["GA_PASSWD"])

    profile = Garb::Management::Profile.all.detect do |p|
      p.web_property_id == ENV["GA_PROPERTY_ID"]
    end

    @results = @fetch_period.times.collect do |p|
      adjust_time = @ga_set_date - (@fetch_period - p + 1).days

      options = {
        :start_date => adjust_time,
        :end_date => adjust_time
      }

      rs = Result.results(profile, options)

      rs.collect do |r|
        begin
          GaReport.create(
            :visits     => r.visits,
            :new_visits => r.new_visits,
            :pageviews  => r.pageviews,
            :date       => adjust_time
          )
        rescue => e
        end
      end
    end
  end

  class Result
    extend Garb::Model
    metrics :pageviews, :visitors, :new_visits, :visits
  end
end
