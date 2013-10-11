class Medium < ActiveRecord::Base
  attr_accessible :name

  has_many :advertisements
  has_many :inflowers, :through => :advertisements
  has_many :ad_reports, :through => :advertisements
end
