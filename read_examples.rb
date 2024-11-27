class Order < ApplicationRecord
#READ

an_order = Order.find(27)
product_list = Product.find(params[:product_ids])

  # get the name from the form
  name = params[:name]

  # DON'T DO THIS!!!
  pos = Order.where("name = '#{name}' and pay_type = 'po'") #(SQL injection attack)

  #rewrite
  name = params[:name]
  pos = Order.where(["name = ? and pay_type = 'po'", name])

  #named placeholders
  name = params[:name]
  pay_type = params[:pay_type]
  pos = Order.where("name = :name and pay_type = :pay_type",
  pay_type: pay_type, name: name)

  #using params that is hash
  pos = Order.where("name= :name and pay_type = :pay_type", 
  params[:order])

  #another step further
  pos = Order.where(params[:order])

  #next same example
  pos = Order.where(name: params[:name], pay_type: params[:pay_type]
  
  #Like Clauses

  #Doesn't work
  User.where("name like '?%'", params[:name])

  #Does work
  User.where("name like ?", params[:name]+"%")

  #order
  orders = Order.where(name: 'Dave').order("pay_type, shipped_at DESC")

  #limit
  orders = Order.where(name: 'Dave').order("pay_type, shipped_at DESC").limit(10)

  #offset
  def Order.find_on_page(page_num, page_size)
    order(id).limit(page_size).offset(page_num*page_size)
  end

  #select
  list = Talk.select("title, speaker, recorded_on")

  #joins
  LineItem.select("li.quantity").where("pr.title = 'Programming Ruby 1.9'").joins("as li inner join products as pr on li.product_id = pr.id")

  #group
  summary = LineItem.select("sku, sum(amount) as amount").group("sku")

  #lock
  Account.transaction do
    ac = Account.where(id: id).lock("LOCK IN SHARE MODE").first
    ac.balance -= amount if ac.balance > amount
    ac.save
  end

  #statistics
  average = Product.average(:price)
  max = Product.maximum(:price)
  min = Product.minimum(:price)
  total = Product.sum(:price)
  number = Product.count

  Order.where("amount > 20").minimum(:amount)

  result = Order.group(:state).maximum(:amount)
  puts result #=> {"TX"=>12345, "NC"=>3456, ...}

  result = Order.group(:state).order("max(amount) desc").limit(3)

  #scope
  scope :last_n_days, ->(days) { where('updated < ?', days) }
  scope :checks, -> { where(pay_type: :check) }

  order = Order.last_n_days(7)
  order = Order.checks.last_n_days(7)


  in_house = Order.where('email LIKE "%@pragprog.com"')
  
  in_house.checks.last_n_days(7)
end