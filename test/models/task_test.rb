require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "can create task with name and category" do
    category = Category.new(name: "Vacation")
    category.save
    task = Task.new(name: "get money", category_id: category.id)
    assert task.save, "valid task"
  end

  test "cannot create task with missing name" do
    task = Task.new
    assert_not task.save, "invalid task saved"
  end

  test "cannot create task with missing category" do
    task = Task.new(name: "get money")
    assert_not task.save, "missing category"
  end


end
