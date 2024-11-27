class Order < ApplicationRecord
#CREATE
an_order = Order.new
  an_order.name = "Dave Thomas"
  an_order.email = "dave@example.com"
  an_order.address = "123 Main St"
  an_order.pay_type = "check"
  an_order.save #Pierszy przykład dla Active Record, wypełnianie wartości atrybutami
  puts "The ID of this order is #{an_order.id}"

Order.new do |o|
  o.name = "Dave Thomas"
  o.email = "dave@example.com"
  o.address = "123 Main St"
  o.pay_type = "check"
  o.save #Drugi przykład dla Active Record, użycie opcjonalnego bloku
end

an_order = Order.new(
  name: "Dave Thomas",
  email: "dave@example.com",
  address: "123 Main St",
  pay_type: "check"
) an_order.save #Trzeci przykład dla Active Record, konstruktory przyjmują wartości jako opcjonalny parametr

an_order = Order.create(
  name: "Dave Thomas",
  email: "dave@example.com",
  address: "123 Main St",
  pay_type: "check"
  )

orders = Order.create([
  {
    name: "Dave Thomas",
    email: "dave@example.com",
    address: "123 Main St",
    pay_type: "check"

  },
  {
    name: "Andy Hunt",
    email: "andy@example.com",
    address: "456 Gentle Drive",
    pay_type: "po"
  }
] )

orders = LineItem.find_by_sql("select line_items.* from line_items, orders" +
"where order_id = orders.id" +
"and orders.name = 'Dave Thomas'")

orders = Order.find_by_sql("select name, pay_type from orders")
first = orders[0]
p first.attributes #=> {"name"=>"Dave Thomas", "pay_type"=>"check"}
p first.attributes_names #=> ["name", "pay_type"]
p first.attribute_present?("address") #=> false

items = LineItem.find_by_sql("select *,"+
"products.price as unit_price,"+
"quantity*products.price as total_price,"+
"products.title as title"+
"from line_items, products"+
"where line_items.product_id = products.id")
li = items[0]
puts "#{li.title}: #{li.quantity}x#{li.unit_price} => #{li.total_price}"

Order.find_by_sql(["select * from orders where amount > ?", params[:amount]])
end

