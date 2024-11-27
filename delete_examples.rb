class Order < ApplicationRecord
  Order.delete(123)
  User.delete([2,3,4,5])
  Product.delete_all(["price>?", @expensive_price])

  order = Order.find_by(:name "Dave")
  order.destroy
  # ... order is now frozen

  Order.destroy_all(["shipped_at < ?", 30.days.ago])
  
end