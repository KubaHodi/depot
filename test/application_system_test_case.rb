require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]

  def log_in(user = users(:one))
    visit login_url
    fill_in :name,	with: user.name
    fill_in :password,	with: "secret123"
    click_on 'Login'
    assert_content("We have #{Order.count}")
  end
end
