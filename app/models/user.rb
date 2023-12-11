# app/models/user.rb
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true  

  has_many :categories
  has_many :tasks, through: :categories
end
