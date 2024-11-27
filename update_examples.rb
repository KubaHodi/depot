class Order < ApplicationRecord
  order = Order.find(123)
  order.name = "Fred"
  order.save

  orders = Order.find_by_sql("select id, name, pay_type from orders where id=123")
  first = orders[0]
  first.name = "Wilma"
  first.save

  order = Order.find(321)
  order.update(name: "Barney", email: "barney@bedrock.com")

  def save_after_edit
    order = Order.find(params[:id])
    if order.update(order_params)
      redirect_to action: :index
    else
      render action: :edit
  end

  order = Order.update(12, name: "Barney", email: "barney@bedrock.com")

  result = Product.update_all("price=1.1*price","title like '%Java%'")

  if order.save
    # all OK
  else
    # validation failed
  end

  begin
    order.save!
  rescue RecordInvalid => error
    # validation failed
  end
end