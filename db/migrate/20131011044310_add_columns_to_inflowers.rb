class AddColumnsToInflowers < ActiveRecord::Migration
  def change
    add_column :inflowers, :is_signed_up, :boolean
    add_column :inflowers, :unique_id, :integer
    add_index :inflowers, :unique_id
    add_column :inflowers, :survey_count, :integer
    add_column :inflowers, :plan_name, :string
    add_index :inflowers, :plan_name
  end
end
