class AddRawParameterToAdvertisement < ActiveRecord::Migration
  def change
    add_column :advertisements, :raw_parameter, :string
  end
end
