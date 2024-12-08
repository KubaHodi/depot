require "application_system_test_case"

class CartsTest < ApplicationSystemTestCase

  test "should reveal Cart" do 
  visit store_index_url
  click_on "Add to card", match: :first
  assert_selector 'h2', text: 'Your Cart'
  end

  test "should hide Cart" do
    visit store_index_url
    click_on "Add to card", match: :first
    click_on "Empty cart"
    assert_text "Your cart is currently empty"
  end
end