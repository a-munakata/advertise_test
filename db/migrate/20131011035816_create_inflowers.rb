class CreateInflowers < ActiveRecord::Migration
  def change
    create_table :inflowers do |t|
      t.string :campaign_url
      t.string :referrer
      t.string :opportunity

      t.timestamps
    end
    add_index :inflowers, :campaign_url
  end
end
