class CreateAdReports < ActiveRecord::Migration
  def change
    create_table :ad_reports do |t|
      t.integer :advertisement_id
      t.integer :count
      t.datetime :checked_at

      t.timestamps
    end
    add_index :ad_reports, :advertisement_id
  end
end
