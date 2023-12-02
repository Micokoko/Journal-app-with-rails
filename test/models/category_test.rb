# test/models/category_test.rb
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  setup do
    @category = categories(:one)  # Use fixtures or factories to create a category
  end

  test 'should be valid with a name' do
    user = User.create(email: 'test@example.com', password: 'password')  # Create a user
    category = Category.new(name: 'Work', user: user)

    assert category.valid?, "Category should be valid with a name. Errors: #{category.errors.full_messages.join(', ')}"
  end
  
  test 'should not be valid without a name' do
    @category.name = nil
    assert_not @category.valid?, 'Category should not be valid without a name'
  end
end
