require 'test_helper'

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(category_name: 'sports')
  end

  test "category should be valid" do
    assert @category.valid?
  end

  test "name should be present" do
    @category.category_name = " " 
    assert_not @category.valid?
  end

  test "name should be unique" do
    @category.save
    category2 = Category.new(category_name: 'sports')
    assert_not category2.valid?
  end

  test "name should not be too long" do
    @category.category_name = "a" * 25
    assert_not @category.valid?
  end

  test "name should not be too short" do
    @category.category_name = "aa"
    assert_not @category.valid?
  end

end