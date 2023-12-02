# test/models/task_test.rb
require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test 'can create task with name, category, and due date' do
    category = Category.create(name: 'Vacation')
    task = Task.new(name: 'get money', category: category, due_date: Date.today)
    assert task.save, "Task should be valid. Errors: #{task.errors.full_messages.join(', ')}"
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
