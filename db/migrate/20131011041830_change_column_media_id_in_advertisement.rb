class ChangeColumnMediaIdInAdvertisement < ActiveRecord::Migration
  def change
    remove_index :advertisements, :media_id
    remove_column :advertisements, :media_id

    add_column :advertisements, :medium_id, :integer
    add_index :advertisements, :medium_id
  end
end
