require "test_helper"

class ProductTest < ActiveSupport::TestCase
  fixtures :products
   def new_product(image_url)
    Product.new(title: "My book title",
    description: "yyy",
    price: 1,
    image_url: image_url)
end
test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
    http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |image_url|
      assert new_product(image_url).valid?,
        "#{image_url} must be valid"      
      
    end

    bad.each do |image_url|
      assert new_product(image_url).invalid?,
      "#{image_url} must be invalid"
      
    end
end
end