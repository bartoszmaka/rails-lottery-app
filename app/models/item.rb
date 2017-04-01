class Item < ApplicationRecord
  paginates_per 6
  has_many :users, through: :user_items
  has_many :user_items
  validates :name, presence: true
end
