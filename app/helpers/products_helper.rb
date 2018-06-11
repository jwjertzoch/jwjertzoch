module ProductsHelper
  def cache_key_for_products
    count          = @products
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end
  def get_products
    products = $redis.get("products3")
    #puts "Am I Here"
    if products.nil?
      puts "first run"
      products=Product.all
      $redis.set("products3",products)
  end
    products
    #JSON.load products
  end
end
