class RenameColorsInProducts < ActiveRecord::Migration[5.1]
  def change
    rename_column :products, :color, :colour, default: 0
  end
end
