require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(email: "john@example.com", password: "password")
  end

  test "get new category form and create category" do
    sign_in_as(@user, "password")
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
    post categories_path, params: { category: {name: "sports"}}
    follow_redirect!
    end
    assert_template 'categories/index'
    assert_match 'sports', response.body
  end

end