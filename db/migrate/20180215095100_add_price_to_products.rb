class AddPriceToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :price, :string
  end
end

if column_exists? :products, :price, :string
               remove_column :products, :price, :string
       end
     
