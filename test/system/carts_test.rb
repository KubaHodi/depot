require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase

  test "should reveal Cart" do 
  visit cart_url
  click_on "Add to Cart"
  assert_selector 'h2', text: 'Your Cart'
  end

  test "should hide Cart" do 
    click_on "Empty Cart"
    assert_selector 'p', text: 'Date:/'
  end