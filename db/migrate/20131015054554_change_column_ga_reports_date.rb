class ChangeColumnGaReportsDate < ActiveRecord::Migration
  def change
    remove_column :ga_reports, :date
    add_column :ga_reports, :date, :date
  end
end
