class Order < ActiveRecord::Base
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
end

