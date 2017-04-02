class Item < ApplicationRecord
  paginates_per 6
  has_many :users, through: :user_items
  has_many :user_items
  belongs_to :winner, class_name: 'User', foreign_key: :user_id
  validates :name, presence: true

  def biddable?
    return false unless winner.nil?
    true
  end

  def drawable?
    return true if winner.nil? && users.count > 1
    false
  end
end
