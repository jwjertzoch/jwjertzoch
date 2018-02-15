class RemovePriceFromProducts < ActiveRecord::Migration[5.1]
  def change
    if column_exists? :products, :price, :string
    remove_column :products, :price, :string
  end
end
end
