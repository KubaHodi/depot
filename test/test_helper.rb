ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors, with: :threads)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end

  class ActionDispatch::IntegrationTest
    def logout
      delete logout_url
    end

    def login
      post login_url, params: {name: users(:one).name, password: 'secret'}
    end
  end
end
