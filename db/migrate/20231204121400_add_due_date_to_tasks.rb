class AddDueDateToTasks < ActiveRecord::Migration[7.1]
  def change
    unless column_exists?(:tasks, :due_date)
      add_column :tasks, :due_date, :datetime
    end
  end
end
