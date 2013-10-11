# enoding: utf-8

class Advertisement < ActiveRecord::Base
  class NoMediumException < Exception; end

  attr_accessible :campaign_url,
                  :raw_parameter,
                  :medium_id,


  has_many :inflowers
  has_many :ad_reports
  belongs_to :medium

  before_save :detect_medium

  validates_presence_of   :campaign_url
  validates_uniqueness_of :campaign_url

  validates_presence_of   :medium_id

  def detect_medium
    self.raw_parameter = URI.parse(campagin_url).query
    queries            = raw_parameter && Hash[*(raw_parameter.split("&").collect{|p| p.split("=")}.flatten)]
    medium_name         = queries["utm_source"]

    medium = medium_name && Medium.find_by_name(medium_name)
    medium = Medium.find_or_create_by_name(medium_name) if medium_name && medium.nil?
    raise NoMediumException if medium.nil?
    self.medium_id = medium.id
  end
end
