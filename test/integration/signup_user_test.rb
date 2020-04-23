# rails test test/integration/signup_user_test.

require 'test_helper'

class SignupUserTest < ActionDispatch::IntegrationTest

  def setup

  end

  test "should load signup view" do
    get signup_path
    assert_response :success
    assert_template 'users/show'
  end

  test "should create new user" do
    assert_difference 'User.count', 1 do
      post users_path, params: {user: {username: "Jose", email: "jose@example.com", password: "dascouves" } }
      follow_redirect!
    end
  end

end
