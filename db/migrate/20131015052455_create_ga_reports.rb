class CreateGaReports < ActiveRecord::Migration
  def change
    create_table :ga_reports do |t|
      t.datetime :date
      t.integer :visits
      t.integer :new_visits
      t.integer :pageviews

      t.timestamps
    end
  end
end
