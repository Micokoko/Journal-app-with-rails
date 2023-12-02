class Task < ApplicationRecord
    validates :name, :due_date, presence: true
    belongs_to :category
  end
  