class AddPriceColumnToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :price, :integer
  end
end
