class ChangeColumnMediaInAdevertisement < ActiveRecord::Migration
  def change
    remove_column :advertisements, :media
    add_column    :advertisements, :media_id, :integer
    add_index     :advertisements, :media_id
  end
end
