# test/models/task_test.rb
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "can create task with name, category, and description" do
    category = Category.create(name: "Example Category")
    
    assert_difference('Task.count') do
      task = Task.create(name: "Example Task", category: category, description: "Task description")
      assert task.valid?, "Task should be valid. Errors: #{task.errors.full_messages.to_sentence}"
    end
  end

  test 'cannot create task with missing name' do
    task = Task.new
    assert_not task.save, 'Invalid task saved'
  end

  test 'cannot create task with missing category' do
    task = Task.new(name: 'get money')
    assert_not task.save, 'Missing category'
  end
end
