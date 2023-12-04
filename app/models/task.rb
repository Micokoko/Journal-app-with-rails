# app/models/task.rb
class Task < ApplicationRecord
  belongs_to :category, optional: false
  validates :name, presence: true
  validates :description, presence: true
end
