class Item < ApplicationRecord
  has_many :users, through: :user_items
  has_many :user_items
  validates :name, presence: true
end
