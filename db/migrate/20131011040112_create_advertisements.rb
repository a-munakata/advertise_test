class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :campaign_url
      t.string :media

      t.timestamps
    end
    add_index :advertisements, :campaign_url

  end
end
