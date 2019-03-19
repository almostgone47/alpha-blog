require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(email: "john@example.com", password: "password")
  end

  test "should get category index" do
    sign_in_as(@user, "password")
    get categories_path
    assert_response :success
  end

  test "should get category new" do
    sign_in_as(@user, "password")
    get "/categories/new"
    assert_response :success
  end

  test "should get category show" do
    sign_in_as(@user, "password")
    get "/categories/1"
    assert_response :success
  end
end