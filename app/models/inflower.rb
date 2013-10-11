# encoding: utf-8

class Inflower < ActiveRecord::Base
  attr_accessible :campaign_url, :opportunity, :referrer, :is_signed_up, :unique_id, :survey_count, :plan_id

  belongs_to :advertisement
  #belongs_to :medium, :through => :advertisement

  def self.fetch_latests
    # 例えば

    #JSON.parse( URI.open("https://example.com/api/admin/inflowers").read ).each do |inflower_attribute|
    #  unique_id = inflower_attribute.delete :unique_id
    #  inflower = unique_id && Inflower.find_or_initialize_by_unique_id(unique_id)
    #  next unless inflower.present?
    #  inflower.attributes = inflower_attribute
    #  inflower.save!
    #end
  end
end


## task

#namespace :inflower => :environment do
#  task :update do
#    Inflower.fetch_latests
#  end
#end

## cron

# alias "bundle exec rake inflower:update", update_xxx
# 0 0 0 update_xxx