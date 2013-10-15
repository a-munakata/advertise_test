# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131015062024) do

  create_table "ad_reports", :force => true do |t|
    t.integer  "advertisement_id"
    t.integer  "count"
    t.datetime "checked_at"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "ad_reports", ["advertisement_id"], :name => "index_ad_reports_on_advertisement_id"

  create_table "advertisements", :force => true do |t|
    t.string   "campaign_url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "raw_parameter"
    t.integer  "medium_id"
    t.integer  "price"
  end

  add_index "advertisements", ["campaign_url"], :name => "index_advertisements_on_campaign_url"
  add_index "advertisements", ["medium_id"], :name => "index_advertisements_on_medium_id"

  create_table "ga_reports", :force => true do |t|
    t.integer  "visits"
    t.integer  "new_visits"
    t.integer  "pageviews"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.date     "date"
  end

  add_index "ga_reports", ["date"], :name => "index_ga_reports_on_date", :unique => true

  create_table "inflowers", :force => true do |t|
    t.string   "campaign_url"
    t.string   "referrer"
    t.string   "opportunity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.boolean  "is_signed_up"
    t.integer  "unique_id"
    t.integer  "survey_count"
    t.string   "plan_name"
  end

  add_index "inflowers", ["campaign_url"], :name => "index_inflowers_on_campaign_url"
  add_index "inflowers", ["plan_name"], :name => "index_inflowers_on_plan_name"
  add_index "inflowers", ["unique_id"], :name => "index_inflowers_on_unique_id"

  create_table "media", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
