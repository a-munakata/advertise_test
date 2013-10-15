class AddIndexToDateInGaReport < ActiveRecord::Migration
  def change
    add_index :ga_reports, :date, :unique => true
  end
end
