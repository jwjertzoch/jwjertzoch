class AddPriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :string
    if column_exists? :products, :price
      remove_column :products, :price
    end
  end
end
