class Item < ApplicationRecord
  paginates_per 6
  has_many :users, through: :user_items
  has_many :user_items
  belongs_to :winner, class_name: 'User', foreign_key: :user_id, optional: true
  validates :name, presence: true

  def won?
    true if winner
  end

  def already_bid?(user)
    true if users.include?(user)
  end

  def drawable?
    return true if !won? && users.count > 1
    false
  end
end
