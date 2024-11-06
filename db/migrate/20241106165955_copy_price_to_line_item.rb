class CopyPriceToLineItem < ActiveRecord::Migration[7.2]
  def self.up
    add_column :line_items, :price, :decimal 
    LineItem.all.each do |li|
      li.price = li.product.price if li.price
      
    end
  end
  def self_down
    remove_column :line_items, :price
end
end