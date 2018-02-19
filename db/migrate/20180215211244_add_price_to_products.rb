class AddPriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :strings, default: 0
  end
end
