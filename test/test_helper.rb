ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user, password)
    post user_session_path, params: { user: {email: user.email, password: password, confirmed_at: Time.now}}
  end
end
